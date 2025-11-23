import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// State that holds current emoji data
class EmojiViewState {
  /// Constructor
  EmojiViewState(
    this.categoryEmoji,
    this.onEmojiSelected,
    this.onBackspacePressed,
    this.onBackspaceLongPressed,
    this.onShowSearchView,
    this.onCategoryChanged, {
    this.currentCategory,
  });

  /// List of all category including their emoji
  final List<CategoryEmoji> categoryEmoji;

  /// Callback when pressed on emoji
  final OnEmojiSelected onEmojiSelected;

  /// Callback when pressed on backspace
  final OnBackspacePressed? onBackspacePressed;

  /// Callback when long pressed on backspace
  final OnBackspaceLongPressed onBackspaceLongPressed;

  /// Callback when pressed on search
  final VoidCallback onShowSearchView;

  /// Callback when category tab changes
  final OnCategoryChanged? onCategoryChanged;

  /// Current category from controller (if available)
  /// Used to override the config's initCategory
  final Category? currentCategory;

  /// Notifier for programmatic category changes from controller
  /// When this changes, the tabbar should navigate to the new category
  /// without rebuilding the entire widget
  final ValueNotifier<Category?> categoryNavigationNotifier =
      ValueNotifier<Category?>(null);
}
