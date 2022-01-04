import 'dart:convert';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/recent_emoji.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'emoji_lists.dart' as $emoji_list;

/// EmojiPicker public method class
/// Easy to use and expand other functions
/// Reduce repeated encapsulation of the same function

class EmojiPickerUtils {
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

  /// Returns list of all the category emojis
  static Map<Category, Map<String, String>> get getCategoryEmoji =>
      _categoryEmoji;

  static final Map<Category, Map<String, String>> _categoryEmoji = Map.from({
    Category.ACTIVITIES: $emoji_list.activities,
    Category.ANIMALS: $emoji_list.animals,
    Category.FLAGS: $emoji_list.flags,
    Category.FOODS: $emoji_list.foods,
    Category.OBJECTS: $emoji_list.objects,
    Category.SMILEYS: $emoji_list.smileys,
    Category.SYMBOLS: $emoji_list.symbols,
    Category.TRAVEL: $emoji_list.travel
  });
}
