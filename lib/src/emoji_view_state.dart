import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

/// State that holds current emoji data
class EmojiViewState {
  /// Constructor
  EmojiViewState(
    this.categoryEmoji,
    this.onEmojiSelected,
    this.onBackspacePressed,
    this.onBackspaceLongPressed,
  );

  /// List of all category including their emoji
  final List<CategoryEmoji> categoryEmoji;

  /// Callback when pressed on emoji
  final OnEmojiSelected onEmojiSelected;

  /// Callback when pressed on backspace
  final OnBackspacePressed? onBackspacePressed;

  /// Callback when long pressed on backspace
  final OnBackspaceLongPressed onBackspaceLongPressed;
}
