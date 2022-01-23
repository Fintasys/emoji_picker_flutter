import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_internal_utils.dart';
import 'package:emoji_picker_flutter/src/emoji_skin_tones.dart';
import 'package:test/test.dart';

void main() {
  skinToneTests();
}

void skinToneTests() {
  final utils = EmojiPickerInternalUtils();
  test('hasSkinTone()', () {
    expect(utils.hasSkinTone(const Emoji('', '👍')), true);
    expect(utils.hasSkinTone(const Emoji('', '👨‍🍳')), true);
    expect(utils.hasSkinTone(const Emoji('', '👩‍🚀')), true);

    expect(utils.hasSkinTone(const Emoji('', '🏀')), false);
    expect(utils.hasSkinTone(const Emoji('', '😆')), false);
    expect(utils.hasSkinTone(const Emoji('', '🧟‍♂️')), false);
  });

  test('applySkinTone()', () {
    expect(
      utils.applySkinTone(const Emoji('', '👍'), SkinTone.light).emoji,
      '👍🏻',
    );
    expect(
      utils.applySkinTone(const Emoji('', '🏊‍♂️'), SkinTone.mediumDark).emoji,
      '🏊🏾‍♂️',
    );
    expect(
      utils.applySkinTone(const Emoji('', '👱‍♀️'), SkinTone.dark).emoji,
      '👱🏿‍♀️',
    );
  });

  test('removeSkinTone()', () {
    expect(utils.removeSkinTone(const Emoji('', '👍🏻')).emoji, '👍');
    expect(utils.removeSkinTone(const Emoji('', '🏊🏾‍♂️')).emoji, '🏊‍♂️');
    expect(utils.removeSkinTone(const Emoji('', '👱🏿‍♀️')).emoji, '👱‍♀️');
  });
}
