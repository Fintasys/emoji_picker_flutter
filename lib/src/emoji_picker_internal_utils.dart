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

  /// Caches the platform-supported emojis per [Category] so that
  /// [filterUnsupported] only queries the native side once per category.
  static final Map<Category, CategoryEmoji> _availableEmojis = {};

  /// Caches the recently used emojis so that [getRecentEmojis] avoids
  /// re-reading [SharedPreferences] on subsequent calls. Kept in sync by the
  /// add/clear methods below.
  static List<RecentEmoji>? _recentEmojis;

  // Get available emoji for given category title
  Future<CategoryEmoji> _getAvailableEmojis(CategoryEmoji category) async {
    var available = (await _platform.invokeListMethod<bool>(
      'getSupportedEmojis',
      {'source': category.emoji.map((e) => e.emoji).toList(growable: false)},
    ))!;

    return category.copyWith(
      emoji: [
        for (int i = 0; i < available.length; i++)
          if (available[i]) category.emoji[i],
      ],
    );
  }

  /// Filters out emojis not supported on the platform
  ///
  /// Returns synchronously when every requested category is already cached,
  /// so a rebuilt [EmojiPicker] does not have to hit the native side again.
  FutureOr<List<CategoryEmoji>> filterUnsupported(List<CategoryEmoji> data) {
    if (kIsWeb || !Platform.isAndroid) {
      return data;
    }

    if (data.every((e) => _availableEmojis.containsKey(e.category))) {
      return data.map((e) => _availableEmojis[e.category]!).toList();
    }

    return Future(() async {
      final futures = [
        for (final cat
            in data.where((e) => !_availableEmojis.containsKey(e.category)))
          _getAvailableEmojis(cat),
      ];

      for (final cat in await Future.wait(futures)) {
        _availableEmojis[cat.category] = cat;
      }

      return data.map((e) => _availableEmojis[e.category]!).toList();
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
      return _recentEmojis =
          json.map<RecentEmoji>(RecentEmoji.fromJson).toList();
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
    return emoji.copyWith(emoji: emoji.emoji.replaceFirst(_skinToneRegExp, ''));
  }
}
