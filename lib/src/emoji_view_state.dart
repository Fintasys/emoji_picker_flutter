import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/category_emoji.dart';

class EmojiViewState {
  final List<CategoryEmoji> categoryEmoji;
  final Category currentCategory;
  final OnEmojiSelected onEmojiSelected;

  EmojiViewState(
    this.categoryEmoji,
    this.currentCategory,
    this.onEmojiSelected,
  );
}
