import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_internal_utils.dart';
import 'package:test/test.dart';

void main() {
  skinToneTests();
  emojiModelTests();
}

void skinToneTests() {
  final internalUtils = EmojiPickerInternalUtils();
  final utils = EmojiPickerUtils();

  test('applySkinTone()', () {
    expect(
      utils.applySkinTone(const Emoji('👍', ''), SkinTone.light).emoji,
      '👍🏻',
    );
    expect(
      utils.applySkinTone(const Emoji('🏊‍♂️', ''), SkinTone.mediumDark).emoji,
      '🏊🏾‍♂️',
    );
    expect(
      utils.applySkinTone(const Emoji('👱‍♀️', ''), SkinTone.dark).emoji,
      '👱🏿‍♀️',
    );
  });

  test('removeSkinTone()', () {
    expect(internalUtils.removeSkinTone(const Emoji('👍🏻', '')).emoji, '👍');
    expect(internalUtils.removeSkinTone(const Emoji('🏊🏾‍♂️', '')).emoji,
        '🏊‍♂️');
    expect(internalUtils.removeSkinTone(const Emoji('👱🏿‍♀️', '')).emoji,
        '👱‍♀️');
  });
}

void emojiModelTests() {
  test('encode Emoji', () {
    final encode = const Emoji('🤣', 'name');
    expect(encode.toJson(),
        <String, dynamic>{'emoji': '🤣', 'name': 'name', 'hasSkinTone': false});
  });

  test('decode Emoji without hasSkinTone property', () {
    final decode = <String, dynamic>{'name': 'name', 'emoji': '🤣'};
    final result = Emoji.fromJson(decode);
    expect(result.name, 'name');
    expect(result.emoji, '🤣');
    expect(result.hasSkinTone, false);
  });

  test('decode Emoji with hasSkinTone property', () {
    final decode = <String, dynamic>{
      'name': 'name',
      'emoji': '🤣',
      'hasSkinTone': true
    };
    final result = Emoji.fromJson(decode);
    expect(result.name, 'name');
    expect(result.emoji, '🤣');
    expect(result.hasSkinTone, true);
  });
}
