import 'package:emoji_picker_flutter/src/category_emoji.dart';
import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/default_emoji_picker_view.dart';
import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_extended_utils.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_internal_utils.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:emoji_picker_flutter/src/recent_emoji.dart';
import 'package:flutter/material.dart';

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
  FLAGS,
}

/// Extension on Category enum to get its name
extension CategoryExtension on Category {
  /// Returns name of Category
  String get name {
    switch (this) {
      case Category.RECENT:
        return 'recent';
      case Category.SMILEYS:
        return 'smileys';
      case Category.ANIMALS:
        return 'animals';
      case Category.FOODS:
        return 'foods';
      case Category.ACTIVITIES:
        return 'activities';
      case Category.TRAVEL:
        return 'travel';
      case Category.OBJECTS:
        return 'objects';
      case Category.SYMBOLS:
        return 'symbols';
      case Category.FLAGS:
        return 'flags';
    }
  }
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

/// Callback function for backspace button
typedef void OnBackspacePressed();

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
    this.onBackspacePressed,
    this.config = const Config(),
    this.customWidget,
  }) : super(key: key);

  /// Custom widget
  final EmojiViewBuilder? customWidget;

  /// The function called when the emoji is selected
  final OnEmojiSelected onEmojiSelected;

  /// The function called when backspace button is pressed
  final OnBackspacePressed? onBackspacePressed;

  /// Config for customizations
  final Config config;

  @override
  _EmojiPickerState createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  List<CategoryEmoji> categoryEmoji = List.empty(growable: true);
  List<RecentEmoji> recentEmoji = List.empty(growable: true);
  late Future<void> updateEmojiFuture;

  // Prevent emojis to be reloaded with every build
  bool loaded = false;

  final emojiPickerInternalUtils = EmojiPickerInternalUtils();

  @override
  void initState() {
    super.initState();
    updateEmojiFuture = _updateEmojis();
  }

  @override
  void didUpdateWidget(covariant EmojiPicker oldWidget) {
    if (oldWidget.config != widget.config) {
      // Config changed - rebuild EmojiPickerView completely
      loaded = false;
      updateEmojiFuture = _updateEmojis();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      // Load emojis
      updateEmojiFuture.then(
        (value) => WidgetsBinding.instance!.addPostFrameCallback((_) {
          if (!mounted) return;
          setState(() {
            loaded = true;
          });
        }),
      );

      // Show loading indicator
      return const Center(child: CircularProgressIndicator());
    }
    if (widget.config.showRecentsTab) {
      categoryEmoji[0].emoji = recentEmoji.map((e) => e.emoji).toList();
    }

    var state = EmojiViewState(
      categoryEmoji,
      _getOnEmojiListener(),
      widget.onBackspacePressed,
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
        EmojiPickerExtendedUtils.addEmojiToRecentlyUsed(
                emoji: emoji, recentsLimit: widget.config.recentsLimit)
            .then((newRecentEmoji) => {
                  recentEmoji = newRecentEmoji,
                  if (category != Category.RECENT && mounted)
                    setState(() {
                      // rebuild to update recent emoji tab
                      // when it is not current tab
                    })
                });
      }
      widget.onEmojiSelected(category, emoji);
    };
  }

  // Initalize emoji data
  Future<void> _updateEmojis() async {
    categoryEmoji.clear();
    if (widget.config.showRecentsTab) {
      recentEmoji = await EmojiPickerExtendedUtils.getRecentEmojis();
      final recentEmojiMap = recentEmoji.map((e) => e.emoji).toList();
      categoryEmoji.add(CategoryEmoji(Category.RECENT, recentEmojiMap));
    }

    final availableCategoryEmoji =
        await emojiPickerInternalUtils.getAvailableCategoryEmoji();

    availableCategoryEmoji.forEach((category, emojis) async {
      categoryEmoji.add(
        CategoryEmoji(
            category,
            emojis.entries
                .map((emoji) => Emoji(emoji.key, emoji.value))
                .toList()),
      );
    });
  }
}
