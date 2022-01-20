import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'emoji_lists.dart' as $emoji_list;
import 'recent_emoji.dart';

/// Helper class that provides internal usage
class EmojiPickerInternalUtils {
  /// Establish communication with native
  static const platform = MethodChannel('emoji_picker_flutter');

  /// Restore locally cached emoji
  Future<Map<String, String>?> _restoreFilteredEmojis(String title) async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = prefs.getString(title);
    if (emojiJson == null) {
      return null;
    }
    var emojis =
        Map<String, String>.from(jsonDecode(emojiJson) as Map<String, dynamic>);
    return emojis;
  }

  // Get available emoji for given category title
  Future<Map<String, String>> _getAvailableEmojis(Map<String, String> map,
      {required String title}) async {
    Map<String, String>? newMap;

    // Get Emojis cached locally if available
    newMap = await _restoreFilteredEmojis(title);

    if (newMap == null) {
      // Check if emoji is available on this platform
      newMap = await _getPlatformAvailableEmoji(map);
      // Save available Emojis to local storage for faster loading next time
      if (newMap != null) {
        await _cacheFilteredEmojis(title, newMap);
      }
    }

    return newMap ?? {};
  }

  /// Returns map of all the available category emojis
  Future<Map<Category, Map<String, String>>> getAvailableCategoryEmoji() async {
    final allCategoryEmoji = Map.fromIterables([
      Category.SMILEYS,
      Category.ANIMALS,
      Category.FOODS,
      Category.ACTIVITIES,
      Category.TRAVEL,
      Category.OBJECTS,
      Category.SYMBOLS,
      Category.FLAGS
    ], [
      $emoji_list.smileys,
      $emoji_list.animals,
      $emoji_list.foods,
      $emoji_list.activities,
      $emoji_list.travel,
      $emoji_list.objects,
      $emoji_list.symbols,
      $emoji_list.flags,
    ]);

    final futures = allCategoryEmoji.entries
        .map((e) => _getAvailableEmojis(e.value, title: e.key.name));

    final allAvailableEmojis = await Future.wait(futures);

    return Map.fromIterables(allCategoryEmoji.keys, allAvailableEmojis);
  }

  /// Stores filtered emoji locally for faster access next time
  Future<void> _cacheFilteredEmojis(
      String title, Map<String, String> emojis) async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = jsonEncode(emojis);
    prefs.setString(title, emojiJson);
  }

  /// Check if emoji is available on current platform
  Future<Map<String, String>?> _getPlatformAvailableEmoji(
      Map<String, String> emoji) async {
    if (Platform.isAndroid) {
      Map<String, String>? filtered = {};
      var delimiter = '|';
      try {
        var entries = emoji.values.join(delimiter);
        var keys = emoji.keys.join(delimiter);
        var result = (await platform.invokeMethod<String>('checkAvailability',
            {'emojiKeys': keys, 'emojiEntries': entries})) as String;
        var resultKeys = result.split(delimiter);
        for (var i = 0; i < resultKeys.length; i++) {
          filtered[resultKeys[i]] = emoji[resultKeys[i]]!;
        }
      } on PlatformException catch (_) {
        filtered = null;
      }
      return filtered;
    } else {
      return emoji;
    }
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
        recentEmoji.sublist(0, min(config.recentsLimit, recentEmoji.length));
    // save locally
    prefs.setString('recent', jsonEncode(recentEmoji));

    return recentEmoji;
  }
}
