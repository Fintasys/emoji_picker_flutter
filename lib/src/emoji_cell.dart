import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/triangle_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A widget that represents an individual clickable emoji cell.
/// Can have a long pressed listener [onSkinToneDialogRequested] that
/// provides necessary data to show a skin tone popup.
class EmojiCell extends StatelessWidget {
  /// Constructor for manually setting all properties
  const EmojiCell({
    required this.emoji,
    required this.emojiSize,
    this.categoryEmoji,
    required this.buttonMode,
    this.index = 0,
    required this.enableSkinTones,
    required this.textStyle,
    required this.skinToneIndicatorColor,
    this.onSkinToneDialogRequested,
    required this.onEmojiSelected,
  });

  /// Constructor that can retrieve as much information as possible from
  /// [Config]
  EmojiCell.fromConfig(
      {required this.emoji,
      required this.emojiSize,
      this.categoryEmoji,
      this.index = 0,
      required this.onEmojiSelected,
      this.onSkinToneDialogRequested,
      required Config config})
      : buttonMode = config.buttonMode,
        enableSkinTones = config.enableSkinTones,
        textStyle = config.emojiTextStyle,
        skinToneIndicatorColor = config.skinToneIndicatorColor;

  /// Emoji to display as the cell content
  final Emoji emoji;

  /// Font size for the emoji
  final double emojiSize;

  /// Optinonal category that will be passed through to callbacks
  final CategoryEmoji? categoryEmoji;

  /// Visual tap feedback, see [ButtonMode] for options
  final ButtonMode buttonMode;

  /// Optional index that can be used for precise skin dialog position.
  /// Will be passed through to [onSkinToneDialogRequested] callback.
  final int index;

  /// Whether to show skin popup indicator if emoji supports skin colors
  final bool enableSkinTones;

  /// Custom text style to use on emoji
  final TextStyle? textStyle;

  /// Color for skin color indicator triangle
  final Color skinToneIndicatorColor;

  /// Callback triggered on long press. Will be called regardless
  /// whether [enableSkinTones] is set or not and for any emoji to
  /// give a way for the caller to dismiss any existing overlays.
  final OnSkinToneDialogRequested? onSkinToneDialogRequested;

  /// Callback for a single tap on the cell.
  final OnEmojiSelected onEmojiSelected;

  /// Build different Button based on ButtonMode
  Widget _buildButtonWidget({
    required VoidCallback onPressed,
    VoidCallback? onLongPressed,
    required Widget child,
  }) {
    if (buttonMode == ButtonMode.MATERIAL) {
      return InkWell(
        onTap: onPressed,
        onLongPress: onLongPressed,
        child: child,
      );
    }
    if (buttonMode == ButtonMode.CUPERTINO) {
      return GestureDetector(
        onLongPress: onLongPressed,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: child,
        ),
      );
    }
    return GestureDetector(
      onLongPress: onLongPressed,
      onTap: onPressed,
      child: child,
    );
  }

  /// Build and display Emoji centered of its parent
  Widget _buildEmoji() {
    final style = TextStyle(
      fontSize: emojiSize,
      backgroundColor: Colors.transparent,
    );
    final emojiText = Text(
      emoji.emoji,
      textScaleFactor: 1.0,
      style: textStyle == null ? style : textStyle!.merge(style),
    );

    return Center(
      child: emoji.hasSkinTone &&
              enableSkinTones &&
              onSkinToneDialogRequested != null
          ? Container(
              decoration:
                  TriangleDecoration(color: skinToneIndicatorColor, size: 8.0),
              child: emojiText,
            )
          : emojiText,
    );
  }

  @override
  Widget build(BuildContext context) {
    final onPressed = () {
      onEmojiSelected(categoryEmoji?.category, emoji);
    };

    final onLongPressed = () {
      onSkinToneDialogRequested?.call(emoji, emojiSize, categoryEmoji, index);
    };

    return _buildButtonWidget(
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      child: _buildEmoji(),
    );
  }
}
