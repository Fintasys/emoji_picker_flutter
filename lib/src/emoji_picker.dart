import 'package:emoji_picker_flutter/locales/default_emoji_set_locale.dart';
import 'package:emoji_picker_flutter/src/category_view/category_emoji.dart';
import 'package:emoji_picker_flutter/src/category_view/recent_tab_behavior.dart';
import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/emoji.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_controller.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_internal_utils.dart';
import 'package:emoji_picker_flutter/src/emoji_view/default_emoji_picker_view.dart';
import 'package:emoji_picker_flutter/src/emoji_view/emoji_view_config.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:emoji_picker_flutter/src/recent_emoji.dart';
import 'package:emoji_picker_flutter/src/search_view/default_search_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/io/io_helper.dart';

/// All the possible categories that [Emoji] can be put into
///
/// All [Category] are shown in the category bar
enum Category {
  /// Recent / Popular emojis
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

/// Callback function for when emoji is selected
///
/// The function returns the selected [Emoji] as well
/// as the [Category] from which it originated
/// Category can be null in some cases, for example in search results
typedef OnEmojiSelected = void Function(Category? category, Emoji emoji);

/// Callback from emoji cell to show a skin tone selection overlay
typedef OnSkinToneDialogRequested = void Function(Offset emojiBoxPosition,
    Emoji emoji, double emojiSize, CategoryEmoji? categoryEmoji);

/// Callback function for backspace button
typedef OnBackspacePressed = void Function();

/// Callback function for backspace button when long pressed
typedef OnBackspaceLongPressed = void Function();

/// Callback function for category tab changed
typedef OnCategoryChanged = void Function(Category category);

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
    super.key,
    this.textEditingController,
    this.scrollController,
    this.controller,
    this.onEmojiSelected,
    this.onBackspacePressed,
    this.onCategoryChanged,
    this.config = const Config(),
    this.customWidget,
  });

  /// Custom widget
  final EmojiViewBuilder? customWidget;

  /// If you provide the [TextEditingController] that is linked to a
  /// [TextField] this widget handles inserting and deleting for you
  /// automatically.
  final TextEditingController? textEditingController;

  /// If you provide the [ScrollController] that is linked to a
  /// [TextField] this widget handles auto scrolling for you.
  final ScrollController? scrollController;

  /// Controller for managing the emoji picker state, including
  /// the currently selected category tab.
  ///
  /// If provided, this controller allows you to:
  /// - Read the current selected category programmatically
  /// - Change the selected category programmatically
  /// - Listen to category changes
  ///
  /// If both [controller] and [onCategoryChanged] are provided,
  /// the controller takes precedence.
  final EmojiPickerController? controller;

  /// The function called when the emoji is selected
  final OnEmojiSelected? onEmojiSelected;

  /// The function called when backspace button is pressed
  final OnBackspacePressed? onBackspacePressed;

  /// The function called when category tab changes
  final OnCategoryChanged? onCategoryChanged;

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

  // Display Search bar
  bool _isSearchBarVisible = false;

  // Internal helper
  final _emojiPickerInternalUtils = EmojiPickerInternalUtils();

  /// Update recentEmoji list from outside using EmojiPickerUtils
  void updateRecentEmoji(List<RecentEmoji> recentEmoji,
      {bool refresh = false}) {
    _recentEmoji = recentEmoji;
    final recentTabIndex = _categoryEmoji
        .indexWhere((element) => element.category == Category.RECENT);
    if (recentTabIndex != -1) {
      _categoryEmoji[recentTabIndex] = _categoryEmoji[recentTabIndex]
          .copyWith(emoji: _recentEmoji.map((e) => e.emoji).toList());
      if (mounted && refresh) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _updateEmojis();
    widget.textEditingController?.addListener(_scrollToCursorAfterTextChange);
    widget.controller?.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(covariant EmojiPicker oldWidget) {
    if (oldWidget.config != widget.config) {
      // Config changed - rebuild EmojiPickerView completely
      _loaded = false;
      _updateEmojis();
    }
    // Handle controller changes
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onControllerChanged);
      widget.controller?.addListener(_onControllerChanged);
    }
    _resetStateWhenOffstage();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return widget.config.emojiViewConfig.loadingIndicator;
    }
    if (_isSearchBarVisible) {
      return _buildSearchBar();
    }
    return _buildEmojiView();
  }

  void _resetStateWhenOffstage() {
    final offstageParent = context.findAncestorWidgetOfExactType<Offstage>();
    if (offstageParent != null &&
        offstageParent.offstage == true &&
        _isSearchBarVisible) {
      setState(() {
        _isSearchBarVisible = false;
      });
    }
  }

  void _onBackspacePressed() {
    if (widget.textEditingController != null) {
      final controller = widget.textEditingController!;

      final text = controller.value.text;
      var cursorPosition = controller.selection.base.offset;

      // If cursor is not set, then place it at the end of the textfield
      if (cursorPosition < 0) {
        controller.selection = TextSelection(
          baseOffset: controller.text.length,
          extentOffset: controller.text.length,
        );
        cursorPosition = controller.selection.base.offset;
      }

      if (cursorPosition >= 0) {
        final selection = controller.value.selection;
        final newTextBeforeCursor =
            selection.textBefore(text).characters.skipLast(1).toString();

        controller.value = controller.value.copyWith(
          text: newTextBeforeCursor + selection.textAfter(text),
          selection: TextSelection.fromPosition(
            TextPosition(offset: newTextBeforeCursor.length),
          ),
          composing: TextRange.collapsed(newTextBeforeCursor.length),
        );
      }
    }

    widget.onBackspacePressed?.call();

    if (widget.textEditingController == null) {
      _scrollToCursorAfterTextChange();
    }
  }

  void _onBackspaceLongPressed() {
    if (widget.textEditingController != null) {
      final controller = widget.textEditingController!;

      final text = controller.value.text;
      var cursorPosition = controller.selection.base.offset;

      // If cursor is not set, then place it at the end of the textfield
      if (cursorPosition < 0) {
        controller.selection = TextSelection(
          baseOffset: controller.text.length,
          extentOffset: controller.text.length,
        );
        cursorPosition = controller.selection.base.offset;
      }

      if (cursorPosition >= 0) {
        final selection = controller.value.selection;
        final newTextBeforeCursor = _deleteWordByWord(
          selection.textBefore(text).toString(),
        );
        controller.value = controller.value.copyWith(
          text: newTextBeforeCursor + selection.textAfter(text),
          selection: TextSelection.fromPosition(
            TextPosition(offset: newTextBeforeCursor.length),
          ),
          composing: TextRange.collapsed(newTextBeforeCursor.length),
        );
      }
    }
  }

  String _deleteWordByWord(String text) {
    // Trim trailing spaces
    text = text.trimRight();

    // Find the last space to determine the start of the last word
    final lastSpaceIndex = text.lastIndexOf(' ');

    // If there is a space, remove the last word and spaces before it
    if (lastSpaceIndex != -1) {
      return text.substring(0, lastSpaceIndex).trimRight();
    }

    // If there is no space, remove the entire text
    return '';
  }

  // Add recent emoji handling to tap listener
  void _onEmojiSelected(Category? category, Emoji emoji) {
    if (widget.config.categoryViewConfig.recentTabBehavior ==
        RecentTabBehavior.POPULAR) {
      _emojiPickerInternalUtils
          .addEmojiToPopularUsed(emoji: emoji, config: widget.config)
          .then((newRecentEmoji) => {
                // we don't want to rebuild the widget if user is currently on
                // the RECENT tab, it will make emojis jump since sorting
                // is based on the use frequency
                updateRecentEmoji(newRecentEmoji,
                    refresh: category != Category.RECENT),
              });
    } else if (widget.config.categoryViewConfig.recentTabBehavior ==
        RecentTabBehavior.RECENT) {
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

      final newText = text.replaceRange(
        selection.start,
        selection.end,
        emoji.emoji,
      );
      final emojiLength = emoji.emoji.length;
      controller.value = controller.value.copyWith(
        text: newText,
        selection: selection.copyWith(
          baseOffset: selection.start + emojiLength,
          extentOffset: selection.start + emojiLength,
        ),
        composing: TextRange.collapsed(newText.length),
      );
    }

    widget.onEmojiSelected?.call(category, emoji);

    if (widget.textEditingController == null) {
      _scrollToCursorAfterTextChange();
    }
  }

  // Initialize emoji data
  Future<void> _updateEmojis() async {
    _categoryEmoji.clear();
    if ([RecentTabBehavior.RECENT, RecentTabBehavior.POPULAR]
        .contains(widget.config.categoryViewConfig.recentTabBehavior)) {
      final futureOrRecent = _emojiPickerInternalUtils.getRecentEmojis();

      if (futureOrRecent is List<RecentEmoji>) {
        _recentEmoji = futureOrRecent;
      } else {
        _recentEmoji = await futureOrRecent;
      }

      final recentEmojiMap = _recentEmoji.map((e) => e.emoji).toList();
      _categoryEmoji.add(CategoryEmoji(Category.RECENT, recentEmojiMap));
    }
    final data = widget.config.emojiSet?.call(widget.config.locale) ??
        getDefaultEmojiLocale(widget.config.locale);

    if (widget.config.checkPlatformCompatibility) {
      final futureOrCategories =
          _emojiPickerInternalUtils.filterUnsupported(data);

      if (futureOrCategories is List<CategoryEmoji>) {
        _categoryEmoji.addAll(futureOrCategories);
      } else {
        _categoryEmoji.addAll(await futureOrCategories);
      }
    } else {
      _categoryEmoji.addAll(data);
    }

    _state = EmojiViewState(
      _categoryEmoji,
      _onEmojiSelected,
      _onBackspacePressed,
      _onBackspaceLongPressed,
      _showSearchView,
      _handleCategoryChanged,
      currentCategory: widget.controller?.currentCategory,
    );
    if (mounted) {
      setState(() {
        _loaded = true;
      });
    }
  }

  Widget _buildSearchBar() {
    return widget.config.searchViewConfig.customSearchView == null
        ? DefaultSearchView(
            widget.config,
            _state,
            _hideSearchView,
          )
        : widget.config.searchViewConfig.customSearchView!(
            widget.config,
            _state,
            _hideSearchView,
          );
  }

  Widget _wrapScrollBehaviorForPlatforms(Widget child) {
    return !kIsWeb && Platform.isLinux
        ? ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ),
            child: child,
          )
        : child;
  }

  Widget _buildEmojiView() {
    final content = widget.customWidget == null
        ? DefaultEmojiPickerView(
            widget.config,
            _state,
            _showSearchView,
          )
        : widget.customWidget!(
            widget.config,
            _state,
            _showSearchView,
          );

    return _wrapScrollBehaviorForPlatforms(
      widget.config.height != null
          ? SizedBox(
              height: widget.config.height,
              child: content,
            )
          : content,
    );
  }

  void _showSearchView() {
    setState(() {
      _isSearchBarVisible = true;
    });
  }

  void _hideSearchView() {
    setState(() {
      _isSearchBarVisible = false;
    });
  }

  void _scrollToCursorAfterTextChange() {
    if (widget.scrollController != null) {
      final scrollController = widget.scrollController!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        }
      });
    }
  }

  /// Handler for controller category changes
  void _onControllerChanged() {
    // When the controller's category changes programmatically,
    // navigate the tabbar to the new category without rebuilding
    if (mounted && _loaded && widget.controller != null) {
      _state.categoryNavigationNotifier.value =
          widget.controller!.currentCategory;
    }
  }

  /// Handle category changes (both from user interaction and programmatic)
  void _handleCategoryChanged(Category category) {
    // Update controller if present
    widget.controller?.updateCategory(category);

    // Call callback if present and no controller (for backward compatibility)
    if (widget.controller == null) {
      widget.onCategoryChanged?.call(category);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    super.dispose();
  }
}
