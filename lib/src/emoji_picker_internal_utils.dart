import 'dart:convert';
import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/category_emoji.dart';
import 'package:emoji_picker_flutter/src/emoji_skin_tones.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'emoji_lists.dart';
import 'recent_emoji.dart';

/// Helper class that provides internal usage
class EmojiPickerInternalUtils {
  // Establish communication with native
  static const _platform = MethodChannel('emoji_picker_flutter');

  // Get available emoji for given category title
  Future<CategoryEmoji> _getAvailableEmojis(CategoryEmoji category) async {
    var available = (await _platform.invokeListMethod<bool>(
        'getSupportedEmojis', {
      'source': category.emoji.map((e) => e.emoji).toList(growable: false)
    }))!;

    return category.copyWith(emoji: [
      for (int i = 0; i < available.length; i++)
        if (available[i]) category.emoji[i]
    ]);
  }

  /// Filters out emojis not supported on the platform
  Future<List<CategoryEmoji>> getAvailableCategoryEmoji() async {
    final futures = [
      for (final cat in emojiCategoryList) _getAvailableEmojis(cat)
    ];
    return await Future.wait(futures);
  }

  /// Returns list of recently used emoji from cache
  Future<List<RecentEmoji>> getRecentEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = prefs.getString('recent');
    if (emojiJson == null) {
      return [];
    }
    var json = jsonDecode(emojiJson) as List<dynamic>;
    return json.map<RecentEmoji>(RecentEmoji.fromJson).toList();
  }

  /// Add an emoji to recently used list or increase its counter
  Future<List<RecentEmoji>> addEmojiToRecentlyUsed(
      {required Emoji emoji, Config config = const Config()}) async {
    // Remove emoji's skin tone in Recent-Category
    if (emoji.hasSkinTone) {
      emoji = removeSkinTone(emoji);
    }
    var recentEmoji = await getRecentEmojis();
    var recentEmojiIndex =
        recentEmoji.indexWhere((element) => element.emoji.emoji == emoji.emoji);
    if (recentEmojiIndex != -1) {
      // Already exist in recent list
      // Just update counter
      recentEmoji[recentEmojiIndex].counter++;
    } else if (recentEmoji.length == config.recentsLimit &&
        config.replaceEmojiOnLimitExceed) {
      // Replace latest emoji with the fresh one
      recentEmoji[recentEmoji.length - 1] = RecentEmoji(emoji, 1);
    } else {
      recentEmoji.add(RecentEmoji(emoji, 1));
    }
    // Sort by counter desc
    recentEmoji.sort((a, b) => b.counter - a.counter);
    // Limit entries to recentsLimit
    recentEmoji =
        recentEmoji.sublist(0, min(config.recentsLimit, recentEmoji.length));
    // save locally
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('recent', jsonEncode(recentEmoji));

    return recentEmoji;
  }

  /// Applies skin tone to given emoji
  Emoji applySkinTone(Emoji emoji, String color) {
    final codeUnits = emoji.emoji.codeUnits;
    var result = List<int>.empty(growable: true)
      ..addAll(codeUnits.sublist(0, min(codeUnits.length, 2)))
      ..addAll(color.codeUnits);
    if (codeUnits.length >= 2) {
      result.addAll(codeUnits.sublist(2));
    }
    return emoji.copyWith(emoji: String.fromCharCodes(result));
  }

  /// Remove skin tone from given emoji
  Emoji removeSkinTone(Emoji emoji) {
    return emoji.copyWith(
      emoji: emoji.emoji.replaceFirst(
        RegExp('${SkinTone.values.join('|')}'),
        '',
      ),
    );
  }
}
