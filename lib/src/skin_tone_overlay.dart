import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Overlay for SkinTone
OverlayEntry buildSkinToneOverlay(
  BuildContext context,
  Emoji emoji,
  double emojiSize,
  CategoryEmoji? categoryEmoji,
  int index,
  int skinToneCount,
  Config config,
  double scrollControllerOffset,
  double tabBarHeight,
  EmojiPickerUtils utils,
  OnEmojiSelected onEmojiSelected,
) {
  // Generate other skintone options
  final skinTonesEmoji = SkinTone.values
      .map((skinTone) => utils.applySkinTone(emoji, skinTone))
      .toList();

  final position = _calculateEmojiPosition(context, index, config.columns,
      skinToneCount, scrollControllerOffset, tabBarHeight);

  return OverlayEntry(
    builder: (context) => Positioned(
      left: position.left,
      top: position.top,
      child: Material(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          color: config.skinToneDialogBgColor,
          child: Row(
            children: [
              SizedBox(
                width: emojiSize,
                height: emojiSize,
                child: EmojiCell.fromConfig(
                  categoryEmoji: categoryEmoji,
                  config: config,
                  emoji: emoji,
                  emojiSize: emojiSize,
                  onEmojiSelected: onEmojiSelected,
                ),
              ),
              EmojiCell.fromConfig(
                emoji: emoji,
                emojiSize: emojiSize,
                categoryEmoji: categoryEmoji,
                onEmojiSelected: onEmojiSelected,
                config: config,
              ),
              ...List.generate(
                SkinTone.values.length,
                (index) => EmojiCell.fromConfig(
                  emoji: skinTonesEmoji[index],
                  emojiSize: emojiSize,
                  categoryEmoji: categoryEmoji,
                  onEmojiSelected: onEmojiSelected,
                  config: config,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Rect _calculateEmojiPosition(BuildContext context, int index, int columns,
    int skinToneCount, double scrollControllerOffset, double tabBarHeight) {
  // Calculate position of emoji in the grid
  final row = index ~/ columns;
  final column = index % columns;
  // Calculate position for skin tone dialog
  final renderBox = context.findRenderObject() as RenderBox;
  final offset = renderBox.localToGlobal(Offset.zero);
  final emojiSpace = renderBox.size.width / columns;
  final topOffset = emojiSpace;
  final leftOffset = _getLeftOffset(emojiSpace, column, skinToneCount, columns);
  final left = offset.dx + column * emojiSpace + leftOffset;
  final top = tabBarHeight +
      offset.dy +
      row * emojiSpace -
      scrollControllerOffset -
      topOffset;

  return Rect.fromLTWH(left, top, emojiSpace, .0);
}

// Calucates the offset from the middle of selected emoji to the left side
// of the skin tone dialog
// Case 1: Selected Emoji is close to left border and offset needs to be
// reduced
// Case 2: Selected Emoji is close to right border and offset needs to be
// larger than half of the whole width
// Case 3: Enough space to left and right border and offset can be half
// of whole width
double _getLeftOffset(
    double emojiWidth, int column, int skinToneCount, int columns) {
  var remainingColumns = columns - (column + 1 + (skinToneCount ~/ 2));
  if (column >= 0 && column < 3) {
    return -1 * column * emojiWidth;
  } else if (remainingColumns < 0) {
    return -1 * ((skinToneCount ~/ 2 - 1) + -1 * remainingColumns) * emojiWidth;
  }
  return -1 * ((skinToneCount ~/ 2) * emojiWidth) + emojiWidth / 2;
}
