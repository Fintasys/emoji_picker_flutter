import 'package:emoji_picker_flutter/src/category_emoji.dart';
import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/default_emoji_picker_view.dart';
import 'package:emoji_picker_flutter/src/default_emoji_set.dart';
import 'package:emoji_picker_flutter/src/emoji.dart';
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
  /// No cell touch effects, uses GestureDetector only. Provides best grid
  /// scrolling performance
  NONE,

  /// Android button style - gives the button a splash color with ripple effect
  MATERIAL,

  /// iOS button style - gives the button a fade out effect when pressed
  CUPERTINO
}

/// Number of skin tone icons
const kSkinToneCount = 6;

/// Callback function for when emoji is selected
///
/// The function returns the selected [Emoji] as well
/// as the [Category] from which it originated
/// Category can be null in some cases, for example in search results
typedef void OnEmojiSelected(Category? category, Emoji emoji);

/// Callback from emoji cell to show a skin tone selection overlay
typedef void OnSkinToneDialogRequested(
    Emoji emoji, double emojiSize, CategoryEmoji? categoryEmoji, int index);

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
  const EmojiPicker({
    Key? key,
    this.textEditingController,
    this.onEmojiSelected,
    this.onBackspacePressed,
    this.config = const Config(),
    this.customWidget,
  }) : super(key: key);

  /// Custom widget
  final EmojiViewBuilder? customWidget;

  /// If you provide the [TextEditingController] that is linked to a
  /// [TextField] this widget handles inserting and deleting for you
  /// automatically.
  final TextEditingController? textEditingController;

  /// The function called when the emoji is selected
  final OnEmojiSelected? onEmojiSelected;

  /// The function called when backspace button is pressed
  final OnBackspacePressed? onBackspacePressed;

  /// Config for customizations
  final Config config;

  @override
  EmojiPickerState createState() => EmojiPickerState();
}

/// EmojiPickerState
class EmojiPickerState extends State<EmojiPicker> {
  final List<CategoryEmoji> _categoryEmoji = List.empty(growable: true);
  List<RecentEmoji> _recentEmoji = List.empty(growable: true);
  late EmojiViewState _state;

  // Prevent emojis to be reloaded with every build
  bool _loaded = false;

  // Internal helper
  final _emojiPickerInternalUtils = EmojiPickerInternalUtils();

  /// Update recentEmoji list from outside using EmojiPickerUtils
  void updateRecentEmoji(List<RecentEmoji> recentEmoji,
      {bool refresh = false}) {
    _recentEmoji = recentEmoji;
    _categoryEmoji[0] = _categoryEmoji[0]
        .copyWith(emoji: _recentEmoji.map((e) => e.emoji).toList());
    if (mounted && refresh) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _updateEmojis();
  }

  @override
  void didUpdateWidget(covariant EmojiPicker oldWidget) {
    if (oldWidget.config != widget.config) {
      // Config changed - rebuild EmojiPickerView completely
      _loaded = false;
      _updateEmojis();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return widget.config.loadingIndicator;
    }
    return widget.customWidget == null
        ? DefaultEmojiPickerView(widget.config, _state)
        : widget.customWidget!(widget.config, _state);
  }

  void _onBackspacePressed() {
    if (widget.textEditingController != null) {
      final controller = widget.textEditingController!;

      final selection = controller.value.selection;
      final text = controller.value.text;
      final cursorPosition = controller.selection.base.offset;

      if (cursorPosition < 0) {
        widget.onBackspacePressed?.call();
        return;
      }

      final newTextBeforeCursor =
          selection.textBefore(text).characters.skipLast(1).toString();
      controller
        ..text = newTextBeforeCursor + selection.textAfter(text)
        ..selection = TextSelection.fromPosition(
            TextPosition(offset: newTextBeforeCursor.length));
    }

    widget.onBackspacePressed?.call();
  }

  // Add recent emoji handling to tap listener
  OnEmojiSelected _getOnEmojiListener() {
    return (category, emoji) {
      if (widget.config.showRecentsTab) {
        _emojiPickerInternalUtils
            .addEmojiToRecentlyUsed(emoji: emoji, config: widget.config)
            .then((newRecentEmoji) => {
                  // we don't want to rebuild the widget if user is currently on
                  // the RECENT tab, it will make emojis jump since sorting
                  // is based on the use frequency
                  updateRecentEmoji(newRecentEmoji,
                      refresh: category != Category.RECENT),
                });
      }

      if (widget.textEditingController != null) {
        // based on https://stackoverflow.com/a/60058972/10975692
        final controller = widget.textEditingController!;
        final text = controller.text;
        final selection = controller.selection;
        final cursorPosition = controller.selection.base.offset;

        if (cursorPosition < 0) {
          controller.text += emoji.emoji;
          widget.onEmojiSelected?.call(category, emoji);
          return;
        }

        final newText =
            text.replaceRange(selection.start, selection.end, emoji.emoji);
        final emojiLength = emoji.emoji.length;
        controller
          ..text = newText
          ..selection = selection.copyWith(
            baseOffset: selection.start + emojiLength,
            extentOffset: selection.start + emojiLength,
          );
      }

      widget.onEmojiSelected?.call(category, emoji);
    };
  }

  // Initialize emoji data
  Future<void> _updateEmojis() async {
    _categoryEmoji.clear();
    if (widget.config.showRecentsTab) {
      _recentEmoji = await _emojiPickerInternalUtils.getRecentEmojis();
      final recentEmojiMap = _recentEmoji.map((e) => e.emoji).toList();
      _categoryEmoji.add(CategoryEmoji(Category.RECENT, recentEmojiMap));
    }
    final data = widget.config.emojiSet ?? defaultEmojiSet;
    _categoryEmoji.addAll(widget.config.checkPlatformCompatibility
        ? await _emojiPickerInternalUtils.filterUnsupported(data)
        : data);
    _state = EmojiViewState(
      _categoryEmoji,
      _getOnEmojiListener(),
      widget.onBackspacePressed == null && widget.textEditingController == null
          ? null
          : _onBackspacePressed,
    );
    if (mounted) {
      setState(() {
        _loaded = true;
      });
    }
  }
}
