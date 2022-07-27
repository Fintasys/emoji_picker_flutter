import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/emoji_lists.dart';
import 'package:emoji_picker_flutter/src/recent_emoji.dart';
import 'package:flutter/material.dart';
import 'emoji_picker_internal_utils.dart';

/// Helper class that provides extended usage
class EmojiPickerUtils {
  /// Singleton Constructor
  factory EmojiPickerUtils() {
    return _singleton;
  }

  EmojiPickerUtils._internal();

  static final EmojiPickerUtils _singleton = EmojiPickerUtils._internal();
  final List<Emoji> _allAvailableEmojiEntities = [];

  /// Returns list of recently used emoji from cache
  Future<List<RecentEmoji>> getRecentEmojis() async {
    return EmojiPickerInternalUtils().getRecentEmojis();
  }

  /// Search for related emoticons based on keywords
  Future<List<Emoji>> searchEmoji(String keyword,
      {bool checkPlatformCompatibility = true}) async {
    if (keyword.isEmpty) return [];

    if (_allAvailableEmojiEntities.isEmpty) {
      final emojiPickerInternalUtils = EmojiPickerInternalUtils();

      final availableCategoryEmoji = checkPlatformCompatibility
          ? await emojiPickerInternalUtils.getAvailableCategoryEmoji()
          : emojiCategoryList;

      // Set all the emoji entities
      for (var emojis in availableCategoryEmoji) {
        _allAvailableEmojiEntities.addAll(emojis.emoji);
      }
    }

    return _allAvailableEmojiEntities
        .where(
          (emoji) => emoji.name.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }

  /// Add an emoji to recently used list or increase its counter
  Future addEmojiToRecentlyUsed({
    required GlobalKey<EmojiPickerState> key,
    required Emoji emoji,
    Config config = const Config(),
  }) async {
    return EmojiPickerInternalUtils()
        .addEmojiToRecentlyUsed(emoji: emoji, config: config)
        .then((recentEmojiList) =>
            key.currentState?.updateRecentEmoji(recentEmojiList));
  }
}
