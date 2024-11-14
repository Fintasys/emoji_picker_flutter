import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/widgets.dart';

/// Default delimiter for regex
const delimiter = '|';

/// Text editing controller that produces text spans on the fly for setting
/// a particular style to emoji characters.
class EmojiTextEditingController extends TextEditingController {
  /// Constructor, requres emojiStyle, since otherwise this class has no effect
  EmojiTextEditingController({super.text, required this.emojiTextStyle});

  /// The style used for the emoji characters
  final TextStyle emojiTextStyle;

  /// Emoji Picker Utils
  final EmojiPickerUtils utils = EmojiPickerUtils();

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    assert(!value.composing.isValid ||
        !withComposing ||
        value.isComposingRangeValid);
    // If the composing range is out of range for the current text, ignore it to
    // preserve the tree integrity, otherwise in release mode a RangeError will
    // be thrown and this EditableText will be built with a broken subtree.
    final composingRegionOutOfRange =
        !value.isComposingRangeValid || !withComposing;

    // Style when no cursor or selection is set
    if (composingRegionOutOfRange) {
      final textSpanChildren = utils.setEmojiTextStyle(
        text,
        emojiStyle: emojiTextStyle,
        parentStyle: style,
      );
      return TextSpan(style: style, children: textSpanChildren);
    }

    // Cursor will automatically highlight current word underlined
    final underlineStyle =
        style?.merge(const TextStyle(decoration: TextDecoration.underline)) ??
            const TextStyle(decoration: TextDecoration.underline);

    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(
          children: utils.setEmojiTextStyle(
            value.composing.textBefore(value.text),
            emojiStyle: emojiTextStyle,
            parentStyle: style,
          ),
        ),
        TextSpan(
          children: utils.setEmojiTextStyle(
            value.composing.textInside(value.text),
            emojiStyle: emojiTextStyle,
            parentStyle: underlineStyle,
          ),
        ),
        TextSpan(
          children: utils.setEmojiTextStyle(
            value.composing.textAfter(value.text),
            emojiStyle: emojiTextStyle,
            parentStyle: style,
          ),
        ),
      ],
    );
  }
}
