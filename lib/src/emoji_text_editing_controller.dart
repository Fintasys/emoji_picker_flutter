import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/widgets.dart';

/// Text editing controller that produces text spans on the fly for setting
/// a particular style to emoji characters. Offloads the main magic to
/// [EmojiPickerUtils.setEmojiTextStyle] method.
class EmojiTextEditingController extends TextEditingController {
  /// Constructor, requres emojiStyle, since otherwise this class has no effect
  EmojiTextEditingController({String? text, required this.emojiStyle})
      : super(text: text);

  /// The style used for the emoji characters
  final TextStyle emojiStyle;
  final _utils = EmojiPickerUtils();

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    if (!value.isComposingRangeValid || !withComposing) {
      return TextSpan(
          style: style,
          children: _utils.setEmojiTextStyle(text,
              emojiStyle: emojiStyle, parentStyle: style));
    }
    final composingStyle =
        style?.merge(const TextStyle(decoration: TextDecoration.underline)) ??
            const TextStyle(decoration: TextDecoration.underline);
    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(
            children: _utils.setEmojiTextStyle(
                value.composing.textBefore(value.text),
                emojiStyle: emojiStyle)),
        TextSpan(
          style: composingStyle,
          children: _utils.setEmojiTextStyle(
              value.composing.textInside(value.text),
              emojiStyle: emojiStyle,
              parentStyle: composingStyle),
        ),
        TextSpan(
            children: _utils.setEmojiTextStyle(
                value.composing.textAfter(value.text),
                emojiStyle: emojiStyle)),
      ],
    );
  }
}
