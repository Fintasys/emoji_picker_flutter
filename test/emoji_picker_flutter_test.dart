import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/emoji_lists.dart' as emoji_list;
import 'package:emoji_picker_flutter/src/emoji_picker_internal_utils.dart';
import 'package:emoji_picker_flutter/src/emoji_skin_tones.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  skinToneTests();
  emojiVersioningTests();
  emojiModelTests();
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

void emojiVersioningTests() {
  test('isEmojiUpdateAvailable() no pre data', () async {
    SharedPreferences.setMockInitialValues({});
    final utils = EmojiPickerInternalUtils();
    expect((await utils.isEmojiUpdateAvailable()), true);
  });

  test('isEmojiUpdateAvailable() pre data and outdated', () async {
    SharedPreferences.setMockInitialValues({
      'emoji_version': 0,
    });
    final utils = EmojiPickerInternalUtils();
    expect((await utils.isEmojiUpdateAvailable()), true);
  });

  test('isEmojiUpdateAvailable() pre data and up to date', () async {
    SharedPreferences.setMockInitialValues({
      'emoji_version': emoji_list.version,
    });
    final utils = EmojiPickerInternalUtils();
    expect((await utils.isEmojiUpdateAvailable()), false);
  });
}

void emojiModelTests() {
  test('encode Emoji', () {
    final encode = const Emoji('name', '🤣');
    expect(encode.toJson(),
        <String, dynamic>{'name': 'name', 'emoji': '🤣', 'hasSkinTone': false});
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
