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
  /// extension examples:
  /// 1. want to show my usual facial expressions outside
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
  /// extension examples:
  /// 1. when our package adds a category,
  /// we don’t need to modify it in multiple places
  /// 2. want to expand the function of searching emoticons,
  /// at this time, we need to get all the expressions,
  /// this method does not require the user to reassemble all the expression data.
  static Map<Category, Map<String, String>> getCategoryEmoji() {
    return Map.from({
      Category.ACTIVITIES: $emoji_list.activities,
      Category.ANIMALS: $emoji_list.animals,
      Category.FLAGS: $emoji_list.flags,
      Category.FOODS: $emoji_list.foods,
      Category.OBJECTS: $emoji_list.objects,
      Category.SMILEYS: $emoji_list.smileys,
      Category.SYMBOLS: $emoji_list.symbols,
      Category.TRAVEL: $emoji_list.travel,
    });
  }
}
