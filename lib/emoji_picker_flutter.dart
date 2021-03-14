import 'dart:convert';
import 'dart:io';

import 'package:emoji_picker_flutter/src/CategoryEmoji.dart';
import 'package:emoji_picker_flutter/src/Config.dart';
import 'package:emoji_picker_flutter/src/DefaultEmojiPickerView.dart';
import 'package:emoji_picker_flutter/src/Emoji.dart';
import 'package:emoji_picker_flutter/src/EmojiViewState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'emoji_lists.dart' as emojiList;

/// All the possible categories that [Emoji] can be put into
///
/// All [Category] are shown in the keyboard bottombar with the exception of [Category.RECOMMENDED]
/// which only displays when keywords are given
enum Category {
  RECOMMENDED,
  RECENT,
  SMILEYS,
  ANIMALS,
  FOODS,
  TRAVEL,
  ACTIVITIES,
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

  Category selectedCategory = Category.SMILEYS;
  List<String> recentEmojis = new List.empty();
  List<CategoryEmoji> categoryEmoji = [];

  bool loaded = false;

  @override
  void initState() {
    selectedCategory =
        widget.config.initCategory ?? widget.config.recommendKeywords != null
            ? Category.RECOMMENDED
            : Category.SMILEYS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      // Load emojis
      updateEmojis().then((value) =>
          WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                loaded = true;
              })));

      // Show loading indicator
      return Center(child: CircularProgressIndicator());
    }

    EmojiViewState state = EmojiViewState(
      categoryEmoji,
      selectedCategory,
      widget.onEmojiSelected,
    );

    // Build
    return widget.customWidget == null
        ? DefaultEmojiPickerView(widget.config, state)
        : widget.customWidget(widget.config, state);
  }

  Future updateEmojis() async {
    categoryEmoji.add(CategoryEmoji(Category.SMILEYS,
        await _getAvailableEmojis(emojiList.smileys, title: 'smileys')));
    categoryEmoji.add(CategoryEmoji(Category.ANIMALS,
        await _getAvailableEmojis(emojiList.animals, title: 'animals')));
    categoryEmoji.add(CategoryEmoji(Category.FOODS,
        await _getAvailableEmojis(emojiList.foods, title: 'foods')));
    categoryEmoji.add(CategoryEmoji(Category.TRAVEL,
        await _getAvailableEmojis(emojiList.travel, title: 'travel')));
    categoryEmoji.add(CategoryEmoji(Category.ACTIVITIES,
        await _getAvailableEmojis(emojiList.activities, title: 'activities')));
    categoryEmoji.add(CategoryEmoji(Category.OBJECTS,
        await _getAvailableEmojis(emojiList.objects, title: 'objects')));
    categoryEmoji.add(CategoryEmoji(Category.SYMBOLS,
        await _getAvailableEmojis(emojiList.symbols, title: 'symbols')));
    categoryEmoji.add(CategoryEmoji(Category.FLAGS,
        await _getAvailableEmojis(emojiList.flags, title: 'flags')));
  }

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

  Future<void> _cacheFilteredEmojis(
      String title, Map<String, String> emojis) async {
    final prefs = await SharedPreferences.getInstance();
    String emojiJson = jsonEncode(emojis);
    prefs.setString(title, emojiJson);
    return;
  }
}
