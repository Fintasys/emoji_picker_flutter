import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/io/io_helper.dart';

/// Initial value for RecentEmoji
const initVal = 1;

/// Helper class that provides internal usage
class EmojiPickerInternalUtils {
  // Establish communication with native
  static const _platform = MethodChannel('emoji_picker_flutter');

  static final RegExp _skinToneRegExp = RegExp(SkinTone.values.join('|'));

  /// Skin tone capable emoji bases that default to *text* presentation, so
  /// their untoned form needs U+FE0F to render as an emoji (✌️, not ✌).
  ///
  /// A skin tone modifier already implies emoji presentation, which is why
  /// [EmojiPickerUtils.applySkinTone] drops the selector while building a
  /// modifier sequence - it has to be restored once the tone is stripped
  /// again. Every other skin tone base has Emoji_Presentation=Yes and must
  /// *not* gain a selector (👍, not 👍️).
  static const _textPresentationBases = <int>{
    0x261D, // ☝ index pointing up
    0x26F9, // ⛹ person bouncing ball
    0x270C, // ✌ victory hand
    0x270D, // ✍ writing hand
    0x1F3CB, // 🏋 person lifting weights
    0x1F3CC, // 🏌 person golfing
    0x1F574, // 🕴 person in suit levitating
    0x1F575, // 🕵 detective
    0x1F590, // 🖐 hand with fingers splayed
  };

  /// Caches, per [Category], whether each emoji glyph is supported on the
  /// platform. Keyed by the emoji string (not the [CategoryEmoji]) so the
  /// cache stays correct across locales and custom emoji sets, which change
  /// an emoji's name/keywords but never the glyph or its platform support.
  static final Map<Category, Map<String, bool>> _emojiSupport = {};

  /// Caches the recently used emojis so that [getRecentEmojis] avoids
  /// re-reading [SharedPreferences] on subsequent calls. Kept in sync by the
  /// add/clear methods below.
  static List<RecentEmoji>? _recentEmojis;

  // Query the native side for which of the given glyphs are supported and
  // merge the result into the per-category support cache.
  Future<void> _cacheSupport(CategoryEmoji category, List<Emoji> query) async {
    final available = (await _platform.invokeListMethod<bool>(
      'getSupportedEmojis',
      {'source': query.map((e) => e.emoji).toList(growable: false)},
    ))!;

    final support = _emojiSupport.putIfAbsent(category.category, () => {});
    for (var i = 0; i < query.length; i++) {
      support[query[i].emoji] = available[i];
    }
  }

  // Filter a category down to the glyphs known to be supported. Every glyph is
  // expected to be present in the cache by the time this is called.
  CategoryEmoji _applySupport(CategoryEmoji category) {
    final support = _emojiSupport[category.category];
    return category.copyWith(
      emoji: category.emoji.where((e) => support?[e.emoji] ?? false).toList(),
    );
  }

  /// Filters out emojis not supported on the platform
  ///
  /// Returns synchronously when the support of every requested glyph is
  /// already cached, so a rebuilt [EmojiPicker] does not have to hit the
  /// native side again. Glyphs whose support is not yet known (e.g. after a
  /// locale switch that introduces new glyphs, or a custom emoji set) are
  /// queried and merged into the cache.
  FutureOr<List<CategoryEmoji>> filterUnsupported(List<CategoryEmoji> data) {
    if (kIsWeb || !Platform.isAndroid) {
      return data;
    }

    // Collect, per category, the glyphs whose support is not yet cached.
    final pending = <CategoryEmoji, List<Emoji>>{};
    for (final cat in data) {
      final support = _emojiSupport[cat.category];
      final unknown = support == null
          ? cat.emoji
          : cat.emoji.where((e) => !support.containsKey(e.emoji)).toList();
      if (unknown.isNotEmpty) {
        pending[cat] = unknown;
      }
    }

    if (pending.isEmpty) {
      return [for (final cat in data) _applySupport(cat)];
    }

    return Future(() async {
      await Future.wait([
        for (final entry in pending.entries)
          _cacheSupport(entry.key, entry.value),
      ]);
      return [for (final cat in data) _applySupport(cat)];
    });
  }

  /// Returns list of recently used emoji from cache
  ///
  /// Reads from [SharedPreferences] on the first call and reuses the cached
  /// result afterwards. The cache is kept in sync by [addEmojiToRecentlyUsed],
  /// [addEmojiToPopularUsed] and [clearRecentEmojisInLocalStorage].
  FutureOr<List<RecentEmoji>> getRecentEmojis() {
    if (_recentEmojis != null) {
      return _recentEmojis!.toList();
    }

    return Future(() async {
      final prefs = await SharedPreferences.getInstance();
      var emojiJson = prefs.getString('recent');
      if (emojiJson == null) {
        return _recentEmojis = [];
      }
      var json = jsonDecode(emojiJson) as List<dynamic>;
      return _recentEmojis = json
          .map<RecentEmoji>(RecentEmoji.fromJson)
          .toList();
    });
  }

  /// Add an emoji to recently used list
  Future<List<RecentEmoji>> addEmojiToRecentlyUsed({
    required Emoji emoji,
    Config config = const Config(),
  }) async {
    // Remove emoji's skin tone in Recent-Category
    if (emoji.hasSkinTone) {
      emoji = removeSkinTone(emoji);
    }
    var recentEmoji = await getRecentEmojis();
    var recentEmojiIndex = recentEmoji.indexWhere(
      (element) => element.emoji.emoji == emoji.emoji,
    );
    if (recentEmojiIndex != -1) {
      // Already exist in recent list
      // Remove it
      recentEmoji.removeAt(recentEmojiIndex);
    }
    // Add it first position
    recentEmoji.insert(0, RecentEmoji(emoji, initVal));

    // Limit entries to recentsLimit
    recentEmoji = recentEmoji.sublist(
      0,
      min(config.emojiViewConfig.recentsLimit, recentEmoji.length),
    );

    // save locally
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('recent', jsonEncode(recentEmoji));

    return _recentEmojis = recentEmoji;
  }

  /// Add an emoji to popular used list or increase its counter
  Future<List<RecentEmoji>> addEmojiToPopularUsed({
    required Emoji emoji,
    Config config = const Config(),
  }) async {
    // Remove emoji's skin tone in Recent-Category
    if (emoji.hasSkinTone) {
      emoji = removeSkinTone(emoji);
    }
    var recentEmoji = await getRecentEmojis();
    var recentEmojiIndex = recentEmoji.indexWhere(
      (element) => element.emoji.emoji == emoji.emoji,
    );
    if (recentEmojiIndex != -1) {
      // Already exist in recent list
      // Just update counter
      recentEmoji[recentEmojiIndex].counter++;
    } else if (recentEmoji.length == config.emojiViewConfig.recentsLimit &&
        config.emojiViewConfig.replaceEmojiOnLimitExceed) {
      // Replace latest emoji with the fresh one
      recentEmoji[recentEmoji.length - 1] = RecentEmoji(emoji, initVal);
    } else {
      recentEmoji.add(RecentEmoji(emoji, initVal));
    }

    // Sort by counter desc
    recentEmoji.sort((a, b) => b.counter - a.counter);

    // Limit entries to recentsLimit
    recentEmoji = recentEmoji.sublist(
      0,
      min(config.emojiViewConfig.recentsLimit, recentEmoji.length),
    );

    // save locally
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('recent', jsonEncode(recentEmoji));

    return _recentEmojis = recentEmoji;
  }

  /// Clears the list of recent emojis in local storage
  Future<void> clearRecentEmojisInLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('recent', jsonEncode([]));
    _recentEmojis = [];
  }

  /// Returns the last remembered skin tone modifier, or `null` if none stored
  Future<String?> getRememberedSkinTone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('skin_tone');
  }

  /// Persists the remembered skin tone modifier. Passing `null` clears it.
  Future<void> setRememberedSkinTone(String? skinTone) async {
    final prefs = await SharedPreferences.getInstance();
    if (skinTone == null) {
      await prefs.remove('skin_tone');
    } else {
      await prefs.setString('skin_tone', skinTone);
    }
  }

  /// Remove skin tone from given emoji
  Emoji removeSkinTone(Emoji emoji) {
    final stripped = emoji.emoji.replaceFirst(_skinToneRegExp, '');
    return emoji.copyWith(emoji: _restorePresentationSelector(stripped));
  }

  /// Re-inserts U+FE0F after the base code point of [emoji] when the untoned
  /// form needs it to keep emoji presentation. See [_textPresentationBases].
  String _restorePresentationSelector(String emoji) {
    final runes = emoji.runes.toList();
    if (runes.isEmpty || !_textPresentationBases.contains(runes.first)) {
      return emoji;
    }
    if (runes.length > 1 && runes[1] == 0xFE0F) {
      return emoji;
    }
    return String.fromCharCodes([runes.first, 0xFE0F, ...runes.skip(1)]);
  }

  /// Clears the in-memory caches. The caches are `static`, so they otherwise
  /// persist for the lifetime of the isolate and can leak state between test
  /// cases. Call this in `setUp`/`tearDown` to keep tests isolated.
  @visibleForTesting
  static void resetCaches() {
    _emojiSupport.clear();
    _recentEmojis = null;
  }
}
