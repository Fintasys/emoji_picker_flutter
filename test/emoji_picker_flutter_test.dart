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

  test('applySkinTone() drops the emoji presentation selector', () {
    // A skin tone modifier already implies emoji presentation, so U+FE0F is
    // dropped from a modifier sequence instead of being carried along.
    // https://github.com/Fintasys/emoji_picker_flutter/issues/272

    // BMP base + U+FE0F: the old two-code-unit slice treated the selector as
    // part of the base and appended the tone after it, which renders as two
    // separate glyphs (✌️🏽 instead of ✌🏽).
    expect(
      codePoints(utils.applySkinTone(const Emoji('✌️', ''), SkinTone.medium)),
      [0x270C, 0x1F3FD],
    );
    expect(
      codePoints(utils.applySkinTone(const Emoji('☝️', ''), SkinTone.light)),
      [0x261D, 0x1F3FB],
    );
    expect(
      codePoints(utils.applySkinTone(const Emoji('✍️', ''), SkinTone.dark)),
      [0x270D, 0x1F3FF],
    );
    expect(
      codePoints(
        utils.applySkinTone(const Emoji('⛹️‍♀️', ''), SkinTone.mediumDark),
      ),
      [0x26F9, 0x1F3FE, 0x200D, 0x2640, 0xFE0F],
    );

    // Astral base + U+FE0F: the tone landed in the right place, but the
    // selector was kept after the modifier (1F590 1F3FD FE0F).
    expect(
      codePoints(utils.applySkinTone(const Emoji('🖐️', ''), SkinTone.medium)),
      [0x1F590, 0x1F3FD],
    );
    expect(
      codePoints(
        utils.applySkinTone(const Emoji('🏋️‍♂️', ''), SkinTone.mediumLight),
      ),
      [0x1F3CB, 0x1F3FC, 0x200D, 0x2642, 0xFE0F],
    );

    // Bases that do not carry a selector keep behaving as before.
    expect(
      codePoints(utils.applySkinTone(const Emoji('✋', ''), SkinTone.medium)),
      [0x270B, 0x1F3FD],
    );
    expect(
      codePoints(
        utils.applySkinTone(const Emoji('🏊‍♂️', ''), SkinTone.medium),
      ),
      [0x1F3CA, 0x1F3FD, 0x200D, 0x2642, 0xFE0F],
    );
  });

  test('applySkinTone() re-applies a tone to a selector-less base', () {
    // The toned form has no U+FE0F, so stripping and re-applying has to keep
    // working on the bare base.
    expect(
      codePoints(utils.applySkinTone(const Emoji('✌🏽', ''), SkinTone.dark)),
      [0x270C, 0x1F3FF],
    );
    expect(
      codePoints(
        utils.applySkinTone(const Emoji('🏋🏽‍♂️', ''), SkinTone.light),
      ),
      [0x1F3CB, 0x1F3FB, 0x200D, 0x2642, 0xFE0F],
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

  test('removeSkinTone() restores the emoji presentation selector', () {
    // Stripping the modifier also removes what implied emoji presentation, so
    // U+FE0F has to come back for bases that default to text presentation -
    // otherwise recents and the skin tone overlay would show ✌ instead of ✌️.
    expect(codePoints(internalUtils.removeSkinTone(const Emoji('✌🏽', ''))), [
      0x270C,
      0xFE0F,
    ]);
    expect(codePoints(internalUtils.removeSkinTone(const Emoji('🖐🏿', ''))), [
      0x1F590,
      0xFE0F,
    ]);
    expect(
      codePoints(internalUtils.removeSkinTone(const Emoji('⛹🏻‍♀️', ''))),
      [0x26F9, 0xFE0F, 0x200D, 0x2640, 0xFE0F],
    );

    // Already carrying a selector -> not duplicated.
    expect(codePoints(internalUtils.removeSkinTone(const Emoji('✌️', ''))), [
      0x270C,
      0xFE0F,
    ]);

    // Emoji_Presentation=Yes bases must not gain a selector.
    expect(codePoints(internalUtils.removeSkinTone(const Emoji('👍🏻', ''))), [
      0x1F44D,
    ]);
    expect(codePoints(internalUtils.removeSkinTone(const Emoji('✋🏽', ''))), [
      0x270B,
    ]);

    // Empty input is passed through instead of throwing.
    expect(internalUtils.removeSkinTone(const Emoji('', '')).emoji, '');
  });

  test('applySkinTone() produces valid sequences for the whole emoji set', () {
    final toneable = defaultEmojiSet
        .expand((category) => category.emoji)
        .where((emoji) => emoji.hasSkinTone);
    expect(toneable, isNotEmpty);

    for (final emoji in toneable) {
      for (final tone in SkinTone.values) {
        final toned = utils.applySkinTone(emoji, tone);
        final runes = toned.emoji.runes.toList();
        final reason = '${emoji.emoji} + $tone -> ${toned.emoji}';

        // The base is unchanged and the modifier immediately follows it, with
        // no presentation selector wedged in between or left behind after it.
        expect(runes.first, emoji.emoji.runes.first, reason: reason);
        expect(runes[1], tone.runes.single, reason: reason);
        if (runes.length > 2) {
          expect(runes[2], isNot(0xFE0F), reason: reason);
        }

        // Round trip: stripping the tone gives the original glyph back.
        expect(utils.removeSkinTone(toned).emoji, emoji.emoji, reason: reason);
      }
    }
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

/// The Unicode code points of [emoji], so that assertions are explicit about
/// selectors and modifiers instead of relying on how the source file renders.
List<int> codePoints(Emoji emoji) => emoji.emoji.runes.toList();
