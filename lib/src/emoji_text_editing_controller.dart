import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/widgets.dart';

/// Default delimiter for regex
const delimiter = '|';

/// Text editing controller that produces text spans on the fly for setting
/// a particular style to emoji characters. Offloads the main magic to
/// [EmojiPickerUtils.setEmojiTextStyle] method.
class EmojiTextEditingController extends TextEditingController {
  /// Constructor, requres emojiStyle, since otherwise this class has no effect
  EmojiTextEditingController({String? text, required this.emojiStyle})
      : super(text: text) {
    // Combine all emojis as regex string
    final utils = EmojiPickerUtils();
    final regExBuffer = StringBuffer();
    for (final list in defaultEmojiSet) {
      for (final emoji in list.emoji) {
        // Put emoji inclusive skin tone before actualy emoji
        // to avoid color and emoji being seperated
        if (emoji.hasSkinTone) {
          for (final skinTone in SkinTone.values) {
            regExBuffer.write(
              '${utils.applySkinTone(emoji, skinTone).emoji}$delimiter',
            );
          }
        }
        regExBuffer.write('${emoji.emoji}$delimiter');
      }
    }
    final regExString = regExBuffer.toString();
    _regex = RegExp(regExString.substring(0, regExString.length - 1));
  }

  /// The style used for the emoji characters
  final TextStyle emojiStyle;
  // final _utils = EmojiPickerUtils();
  late final RegExp _regex;

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

    if (composingRegionOutOfRange) {
      final textSpanChildren = <InlineSpan>[];

      text.splitMapJoin(_regex, onMatch: (Match match) {
        final textPart = match.group(0);

        if (textPart == null) return '';

        _addTextSpan(
          textSpanChildren,
          textPart,
          style?.merge(emojiStyle),
        );

        return '';
      }, onNonMatch: (String text) {
        _addTextSpan(textSpanChildren, text, style);
        return '';
      });

      return TextSpan(style: style, children: textSpanChildren);
    }

    final composingStyle =
        style?.merge(const TextStyle(decoration: TextDecoration.underline)) ??
            const TextStyle(decoration: TextDecoration.underline);
    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(text: value.composing.textBefore(value.text)),
        TextSpan(
          style: composingStyle,
          text: value.composing.textInside(value.text),
        ),
        TextSpan(text: value.composing.textAfter(value.text)),
      ],
    );
  }

  void _addTextSpan(
    List<InlineSpan> textSpanChildren,
    String? textToBeStyled,
    TextStyle? style,
  ) {
    textSpanChildren.add(
      TextSpan(
        text: textToBeStyled,
        style: style,
      ),
    );
  }
}
