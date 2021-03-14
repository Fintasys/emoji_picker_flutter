import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:emoji_picker_flutter/src/category_emoji.dart';
import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/default_emoji_picker_view.dart';
import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:emoji_picker_flutter/src/recent_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'emoji_lists.dart' as emojiList;

/// All the possible categories that [Emoji] can be put into
///
/// All [Category] are shown in the category bar
enum Category {
  RECENT,
  SMILEYS,
  ANIMALS,
  FOODS,
  ACTIVITIES,
  TRAVEL,
  OBJECTS,
  SYMBOLS,
  FLAGS
}

/// Enum to alter the keyboard button style
enum ButtonMode {
  /// Android button style - gives the button a splash color with ripple effect
  MATERIAL,

  /// iOS button style - gives the button a fade out effect when pressed
  CUPERTINO
}

/// Callback function for when emoji is selected
///
/// The function returns the selected [Emoji] as well as the [Category] from which it originated
typedef void OnEmojiSelected(Category category, Emoji emoji);

typedef EmojiViewBuilder = Widget Function(Config config, EmojiViewState state);

/// The Emoji Keyboard widget
///
/// This widget displays a grid of [Emoji] sorted by [Category] which the user can horizontally scroll through.
///
/// There is also a bottombar which displays all the possible [Category] and allow the user to quickly switch to that [Category]
class EmojiPickerFlutter extends StatefulWidget {
  /// Custom widget
  final EmojiViewBuilder customWidget;

  /// The function called when the emoji is selected
  final OnEmojiSelected onEmojiSelected;

  final Config config;

  EmojiPickerFlutter({
    Key key,
    @required this.onEmojiSelected,
    this.config = const Config(),
    this.customWidget,
  }) : super(key: key);

  @override
  _EmojiPickerFlutterState createState() => _EmojiPickerFlutterState();
}

class _EmojiPickerFlutterState extends State<EmojiPickerFlutter> {
  static const platform = const MethodChannel("emoji_picker_flutter");

  List<CategoryEmoji> categoryEmoji = [];
  List<RecentEmoji> recentEmoji = [];

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      // Load emojis
      _updateEmojis().then((value) =>
          WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                loaded = true;
              })));

      // Show loading indicator
      return Center(child: CircularProgressIndicator());
    }
    if (widget.config.showRecentsTab) {
      categoryEmoji[0].emoji = recentEmoji.map((e) => e.emoji).toList();
    }

    EmojiViewState state = EmojiViewState(
      categoryEmoji,
      _getOnEmojiListener(),
    );

    // Build
    return widget.customWidget == null
        ? DefaultEmojiPickerView(widget.config, state)
        : widget.customWidget(widget.config, state);
  }

  // Add recent emoji handling to tap listener
  OnEmojiSelected _getOnEmojiListener() {
    return (category, emoji) {
      if (widget.config.showRecentsTab) {
        _addEmojiToRecentlyUsed(emoji).then((value) => setState(() {}));
      }
      widget.onEmojiSelected(category, emoji);
    };
  }

  // Initalize emoji data
  Future<void> _updateEmojis() async {
    categoryEmoji.clear();
    if (widget.config.showRecentsTab) {
      recentEmoji = await _getRecentEmojis();
      final recentEmojiMap = recentEmoji.map((e) => e.emoji).toList();
      categoryEmoji.add(CategoryEmoji(Category.RECENT, recentEmojiMap));
    }
    categoryEmoji.add(CategoryEmoji(Category.SMILEYS,
        await _getAvailableEmojis(emojiList.smileys, title: 'smileys')));
    categoryEmoji.add(CategoryEmoji(Category.ANIMALS,
        await _getAvailableEmojis(emojiList.animals, title: 'animals')));
    categoryEmoji.add(CategoryEmoji(Category.FOODS,
        await _getAvailableEmojis(emojiList.foods, title: 'foods')));
    categoryEmoji.add(CategoryEmoji(Category.ACTIVITIES,
        await _getAvailableEmojis(emojiList.activities, title: 'activities')));
    categoryEmoji.add(CategoryEmoji(Category.TRAVEL,
        await _getAvailableEmojis(emojiList.travel, title: 'travel')));
    categoryEmoji.add(CategoryEmoji(Category.OBJECTS,
        await _getAvailableEmojis(emojiList.objects, title: 'objects')));
    categoryEmoji.add(CategoryEmoji(Category.SYMBOLS,
        await _getAvailableEmojis(emojiList.symbols, title: 'symbols')));
    categoryEmoji.add(CategoryEmoji(Category.FLAGS,
        await _getAvailableEmojis(emojiList.flags, title: 'flags')));
  }

  // Get available emoji for given category title
  Future<List<Emoji>> _getAvailableEmojis(Map<String, String> map,
      {@required String title}) async {
    Map<String, String> newMap;

    // Get Emojis cached locally if available
    newMap = await _restoreFilteredEmojis(title);

    if (newMap == null) {
      // Check if emoji is available on this platform
      newMap = await _getPlatformAvailableEmoji(map);
      // Save available Emojis to local storage for faster loading next time
      await _cacheFilteredEmojis(title, newMap);
    }

    // Map to Emoji Object
    return newMap.entries
        .map<Emoji>((entry) => new Emoji(entry.key, entry.value))
        .toList();
  }

  // Check if emoji is available on current platform
  Future<Map<String, String>> _getPlatformAvailableEmoji(
      Map<String, String> emoji) async {
    if (Platform.isAndroid) {
      Map<String, String> filtered;
      try {
        String entries = emoji.values.join("//");
        String keys = emoji.keys.join("//");
        String result = (await platform.invokeMethod("checkAvailability",
            {'emojiKeys': keys, 'emojiEntries': entries})) as String;
        List<String> resultKeys = result.split("//");
        for (int i = 0; i < emoji.length; i++) {
          if (!emoji.containsKey(resultKeys[i])) {
            emoji.remove(resultKeys[i]);
          }
        }
        filtered = emoji;
      } on PlatformException catch (_) {
        filtered = null;
      }
      return filtered;
    } else {
      return emoji;
    }
  }

  // Restore locally cached emoji
  Future<Map<String, String>> _restoreFilteredEmojis(String title) async {
    final prefs = await SharedPreferences.getInstance();
    String emojiJson = prefs.getString(title);
    if (emojiJson == null) {
      return null;
    }
    Map<String, String> emojis =
        Map<String, String>.from(jsonDecode(emojiJson));
    return emojis;
  }

  // Stores filtered emoji locally for faster access next time
  Future<void> _cacheFilteredEmojis(
      String title, Map<String, String> emojis) async {
    final prefs = await SharedPreferences.getInstance();
    String emojiJson = jsonEncode(emojis);
    prefs.setString(title, emojiJson);
    return;
  }

  // Returns list of recently used emoji from cache
  Future<List<RecentEmoji>> _getRecentEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    String emojiJson = prefs.getString('recent');
    if (emojiJson == null) {
      return [];
    }
    final List<dynamic> json = jsonDecode(emojiJson);
    return json.map<RecentEmoji>((e) => RecentEmoji.fromJson(e)).toList();
  }

  // Add an emoji to recently used list or increase its counter
  Future<void> _addEmojiToRecentlyUsed(Emoji emoji) async {
    final prefs = await SharedPreferences.getInstance();
    int recentEmojiIndex =
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
    recentEmoji = recentEmoji.sublist(
        0, min(widget.config.recentsLimit, recentEmoji.length));
    // save locally
    prefs.setString('recent', jsonEncode(recentEmoji));
  }
}
