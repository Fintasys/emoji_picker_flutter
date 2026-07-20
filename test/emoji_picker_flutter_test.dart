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

  test('applySkinTone() strips an existing tone before re-applying', () {
    // Re-applying a tone to an already toned glyph must not produce an
    // invalid double-modifier sequence (e.g. 👋🏻🏽).
    expect(
      utils.applySkinTone(const Emoji('👍🏻', ''), SkinTone.medium).emoji,
      '👍🏽',
    );
    expect(
      utils.applySkinTone(const Emoji('🏊🏾‍♂️', ''), SkinTone.light).emoji,
      '🏊🏻‍♂️',
    );
  });

  test('removeSkinTone()', () {
    expect(internalUtils.removeSkinTone(const Emoji('👍🏻', '')).emoji, '👍');
    expect(
      internalUtils.removeSkinTone(const Emoji('🏊🏾‍♂️', '')).emoji,
      '🏊‍♂️',
    );
    expect(
      internalUtils.removeSkinTone(const Emoji('👱🏿‍♀️', '')).emoji,
      '👱‍♀️',
    );
  });

  test('EmojiPickerUtils.removeSkinTone()', () {
    expect(utils.removeSkinTone(const Emoji('👍🏻', '')).emoji, '👍');
    expect(utils.removeSkinTone(const Emoji('👍', '')).emoji, '👍');
  });

  test('extractSkinTone()', () {
    expect(utils.extractSkinTone(const Emoji('👍🏽', '')), SkinTone.medium);
    expect(
      utils.extractSkinTone(const Emoji('🏊🏾‍♂️', '')),
      SkinTone.mediumDark,
    );
    // Base glyph without a modifier -> null
    expect(utils.extractSkinTone(const Emoji('👍', '')), isNull);
  });

  test('applyDisplaySkinTone()', () {
    const toneable = Emoji('👍', '', hasSkinTone: true);
    const plain = Emoji('😀', '');
    const remember = SkinToneConfig(rememberSkinTone: true);

    // No remembered tone -> emoji is returned unchanged
    expect(utils.applyDisplaySkinTone(toneable, remember, null).emoji, '👍');

    // Emoji without skin tone support is never modified
    expect(
      utils.applyDisplaySkinTone(plain, remember, SkinTone.dark).emoji,
      '😀',
    );

    // Remembered tone is applied and hasSkinTone is preserved
    final toned = utils.applyDisplaySkinTone(
      toneable,
      remember,
      SkinTone.medium,
    );
    expect(toned.emoji, '👍🏽');
    expect(toned.hasSkinTone, isTrue);

    // rememberSkinTone disabled -> tone is not applied
    expect(
      utils
          .applyDisplaySkinTone(
            toneable,
            const SkinToneConfig(rememberSkinTone: false),
            SkinTone.medium,
          )
          .emoji,
      '👍',
    );

    // Skin tones disabled entirely -> tone is not applied
    expect(
      utils
          .applyDisplaySkinTone(
            toneable,
            const SkinToneConfig(enabled: false, rememberSkinTone: true),
            SkinTone.medium,
          )
          .emoji,
      '👍',
    );
  });
}

void emojiModelTests() {
  test('encode Emoji', () {
    final encode = const Emoji('🤣', 'name');
    expect(encode.toJson(), <String, dynamic>{
      'emoji': '🤣',
      'name': 'name',
      'hasSkinTone': false,
    });
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
      'hasSkinTone': true,
    };
    final result = Emoji.fromJson(decode);
    expect(result.name, 'name');
    expect(result.emoji, '🤣');
    expect(result.hasSkinTone, true);
  });
}
