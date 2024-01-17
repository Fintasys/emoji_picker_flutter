import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/widgets.dart';

/// Default delimiter for regex
const delimiter = '|';

/// Text editing controller that produces text spans on the fly for setting
/// a particular style to emoji characters.
class EmojiTextEditingController extends TextEditingController {
  /// Constructor, requres emojiStyle, since otherwise this class has no effect
  EmojiTextEditingController({String? text, required this.emojiTextStyle})
      : super(text: text) {
    final utils = EmojiPickerUtils();
    _regex = utils.getEmojiRegex();
  }

  /// The style used for the emoji characters
  final TextStyle emojiTextStyle;

  /// Cached Regex for emoji
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

    // Style when no cursor or selection is set
    if (composingRegionOutOfRange) {
      final textSpanChildren = _getEmojiTextSpanChildren(text, style);
      return TextSpan(style: style, children: textSpanChildren);
    }

    // Cursor will automatically highlight current word underlined
    final composingStyle =
        style?.merge(const TextStyle(decoration: TextDecoration.underline)) ??
            const TextStyle(decoration: TextDecoration.underline);

    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(
            children: _getEmojiTextSpanChildren(
                value.composing.textBefore(value.text), style)),
        TextSpan(
            children: _getEmojiTextSpanChildren(
                value.composing.textInside(value.text), composingStyle)),
        TextSpan(
            children: _getEmojiTextSpanChildren(
                value.composing.textAfter(value.text), style)),
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

  List<InlineSpan> _getEmojiTextSpanChildren(String text, TextStyle? style) {
    final textSpanChildren = <InlineSpan>[];
    text.splitMapJoin(_regex, onMatch: (Match match) {
      final textPart = match.group(0);

      if (textPart == null) return '';

      _addTextSpan(
        textSpanChildren,
        textPart,
        style?.merge(emojiTextStyle),
      );

      return '';
    }, onNonMatch: (String text) {
      _addTextSpan(textSpanChildren, text, style);
      return '';
    });
    return textSpanChildren;
  }
}
