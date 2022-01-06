import 'dart:convert';
import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/recent_emoji.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper class that provides extended usage

class EmojiPickerUtils {
  static Map<Category, Map<String, String>?>? _availableCategoryEmoji;
  static final List<Emoji> _allAvailableEmojiEntities = [];

  /// Returns list of recently used emoji from cache
  static Future<List<RecentEmoji>> getRecentEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = prefs.getString('recent');
    if (emojiJson == null) {
      return [];
    }
    var json = jsonDecode(emojiJson) as List<dynamic>;
    return json.map<RecentEmoji>(RecentEmoji.fromJson).toList();
  }

  /// Returns map of all the available category emojis
  static Future<Map<Category, Map<String, String>?>?>
      getAvailableCategoryEmoji() async {
    if (_availableCategoryEmoji == null) {
      // Filter recent category emojis
      final categories =
          Category.values.where((category) => category != Category.RECENT);

      // Get all available emojis from cached
      final futures = categories.map((category) async {
        final emojis = await restoreFilteredEmojis(category.name);
        return emojis;
      });

      final allAvailableEmojis = await Future.wait(futures);

      _availableCategoryEmoji =
          Map.fromIterables(categories, allAvailableEmojis);
    }
    return _availableCategoryEmoji;
  }

  /// Returns list of all the emoji entities
  static Future<List<Emoji>> getAllAvailableEmojiEntities() async {
    if (_allAvailableEmojiEntities.isEmpty) {
      final availableCategoryEmoji = await getAvailableCategoryEmoji();
      // Set all the emoji entities
      availableCategoryEmoji?.forEach((_, emojis) {
        final emojiEntities =
            emojis?.entries.map((emoji) => Emoji(emoji.key, emoji.value));
        _allAvailableEmojiEntities.addAll(emojiEntities ?? []);
      });
    }
    return _allAvailableEmojiEntities;
  }

  /// Search for related emoticons based on keywords
  static Future<List<Emoji>> searchEmoji(String keyword) async {
    if (keyword.isEmpty) {
      return [];
    }

    final allAvailableEmojiEntities = await getAllAvailableEmojiEntities();

    return allAvailableEmojiEntities
        .where((emoji) => emoji.name.contains(keyword))
        .toList();
  }

  /// Restore locally cached emoji
  static Future<Map<String, String>?> restoreFilteredEmojis(
      String title) async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = prefs.getString(title);
    if (emojiJson == null) {
      return null;
    }
    var emojis =
        Map<String, String>.from(jsonDecode(emojiJson) as Map<String, dynamic>);
    return emojis;
  }

  /// Add an emoji to recently used list or increase its counter
  static Future<List<RecentEmoji>> addEmojiToRecentlyUsed(
      {required Emoji emoji, int recentsLimit = 1000}) async {
    final prefs = await SharedPreferences.getInstance();
    var recentEmoji = await getRecentEmojis();
    var recentEmojiIndex =
        recentEmoji.indexWhere((element) => element.emoji.emoji == emoji.emoji);
    if (recentEmojiIndex != -1) {
      // Already exist in recent list
      // Just update counter
      recentEmoji[recentEmojiIndex].counter++;
    } else {
      recentEmoji.add(RecentEmoji(emoji, 1));
    }
    // Sort by counter desc
    recentEmoji.sort((a, b) => b.counter - a.counter);
    // Limit entries to recentsLimit
    recentEmoji =
        recentEmoji.sublist(0, min(recentsLimit, recentEmoji.length));
    // save locally
    prefs.setString('recent', jsonEncode(recentEmoji));

    return recentEmoji;
  }
}
