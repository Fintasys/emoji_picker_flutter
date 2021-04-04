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
import 'emoji_lists.dart' as emoji_list;

/// All the possible categories that [Emoji] can be put into
///
/// All [Category] are shown in the category bar
enum Category {
  /// Recent emojis
  RECENT,

  /// Smiley emojis
  SMILEYS,

  /// Animal emojis
  ANIMALS,

  /// Food emojis
  FOODS,

  /// Activity emojis
  ACTIVITIES,

  /// Travel emojis
  TRAVEL,

  /// Ojects emojis
  OBJECTS,

  /// Sumbol emojis
  SYMBOLS,

  /// Flag emojis
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
/// The function returns the selected [Emoji] as well
/// as the [Category] from which it originated
typedef void OnEmojiSelected(Category category, Emoji emoji);

/// Callback function for custom view
typedef EmojiViewBuilder = Widget Function(Config config, EmojiViewState state);

/// The Emoji Keyboard widget
///
/// This widget displays a grid of [Emoji] sorted by [Category]
/// which the user can horizontally scroll through.
///
/// There is also a bottombar which displays all the possible [Category]
/// and allow the user to quickly switch to that [Category]
class EmojiPicker extends StatefulWidget {
  /// EmojiPicker for flutter
  EmojiPicker({
    Key? key,
    required this.onEmojiSelected,
    this.config = const Config(),
    this.customWidget,
  }) : super(key: key);

  /// Custom widget
  final EmojiViewBuilder? customWidget;

  /// The function called when the emoji is selected
  final OnEmojiSelected onEmojiSelected;

  /// Config for customizations
  final Config config;

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  static const platform = MethodChannel('emoji_picker_flutter');

  List<CategoryEmoji> categoryEmoji = List.empty(growable: true);
  List<RecentEmoji> recentEmoji = List.empty(growable: true);

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      // Load emojis
      _updateEmojis().then((value) =>
          WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
                loaded = true;
              })));

      // Show loading indicator
      return const Center(child: CircularProgressIndicator());
    }
    if (widget.config.showRecentsTab) {
      categoryEmoji[0].emoji = recentEmoji.map((e) => e.emoji).toList();
    }

    var state = EmojiViewState(
      categoryEmoji,
      _getOnEmojiListener(),
    );

    // Build
    return widget.customWidget == null
        ? DefaultEmojiPickerView(widget.config, state)
        : widget.customWidget!(widget.config, state);
  }

  // Add recent emoji handling to tap listener
  OnEmojiSelected _getOnEmojiListener() {
    return (category, emoji) {
      if (widget.config.showRecentsTab) {
        _addEmojiToRecentlyUsed(emoji).then((value) {
          if (category != Category.RECENT) {
            setState(() {
              // rebuild to update recent emoji tab
              // when it is not current tab
            });
          }
        });
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
    categoryEmoji
      ..add(CategoryEmoji(Category.SMILEYS,
          await _getAvailableEmojis(emoji_list.smileys, title: 'smileys')))
      ..add(CategoryEmoji(Category.ANIMALS,
          await _getAvailableEmojis(emoji_list.animals, title: 'animals')))
      ..add(CategoryEmoji(Category.FOODS,
          await _getAvailableEmojis(emoji_list.foods, title: 'foods')))
      ..add(CategoryEmoji(
          Category.ACTIVITIES,
          await _getAvailableEmojis(emoji_list.activities,
              title: 'activities')))
      ..add(CategoryEmoji(Category.TRAVEL,
          await _getAvailableEmojis(emoji_list.travel, title: 'travel')))
      ..add(CategoryEmoji(Category.OBJECTS,
          await _getAvailableEmojis(emoji_list.objects, title: 'objects')))
      ..add(CategoryEmoji(Category.SYMBOLS,
          await _getAvailableEmojis(emoji_list.symbols, title: 'symbols')))
      ..add(CategoryEmoji(Category.FLAGS,
          await _getAvailableEmojis(emoji_list.flags, title: 'flags')));
  }

  // Get available emoji for given category title
  Future<List<Emoji>> _getAvailableEmojis(Map<String, String> map,
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

    // Map to Emoji Object
    return newMap!.entries
        .map<Emoji>((entry) => Emoji(entry.key, entry.value))
        .toList();
  }

  // Check if emoji is available on current platform
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

  // Restore locally cached emoji
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

  // Stores filtered emoji locally for faster access next time
  Future<void> _cacheFilteredEmojis(
      String title, Map<String, String> emojis) async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = jsonEncode(emojis);
    prefs.setString(title, emojiJson);
  }

  // Returns list of recently used emoji from cache
  Future<List<RecentEmoji>> _getRecentEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    var emojiJson = prefs.getString('recent');
    if (emojiJson == null) {
      return [];
    }
    var json = jsonDecode(emojiJson) as List<dynamic>;
    return json.map<RecentEmoji>(RecentEmoji.fromJson).toList();
  }

  // Add an emoji to recently used list or increase its counter
  Future<void> _addEmojiToRecentlyUsed(Emoji emoji) async {
    final prefs = await SharedPreferences.getInstance();
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
    recentEmoji = recentEmoji.sublist(
        0, min(widget.config.recentsLimit, recentEmoji.length));
    // save locally
    prefs.setString('recent', jsonEncode(recentEmoji));
  }
}
