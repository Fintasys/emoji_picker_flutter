import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/locales/default_emoji_set_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const words = {
    'da': 'hjerte',
    'fi': 'sydän',
    'is': 'hjarta',
    'nb': 'hjerte',
    'nn': 'hjarte',
    'pl': 'serce',
    'sv': 'hjärta',
  };
  for (final entry in words.entries) {
    test('${entry.key} preserves the template and has localized keywords', () {
      final data = getDefaultEmojiLocale(Locale(entry.key));
      expect(
        data.map((c) => c.category),
        defaultEmojiSet.map((c) => c.category),
      );
      for (var i = 0; i < data.length; i++) {
        expect(
          data[i].emoji.map((e) => e.emoji),
          defaultEmojiSet[i].emoji.map((e) => e.emoji),
        );
        expect(
          data[i].emoji.map((e) => e.hasSkinTone),
          defaultEmojiSet[i].emoji.map((e) => e.hasSkinTone),
        );
      }
      final all = data.expand((c) => c.emoji);
      expect(
        all.firstWhere((e) => e.emoji == '❤️').keywords,
        contains(entry.value),
      );
      expect(
        all.every(
          (e) =>
              e.name.isNotEmpty &&
              !e.name.contains('↑↑↑') &&
              !e.name.contains('∅∅∅'),
        ),
        isTrue,
      );
    });
  }
  test('no aliases Bokmål and unsupported languages still use English', () {
    expect(
      getDefaultEmojiLocale(const Locale('no')),
      same(emojiSetNorwegianBokmal),
    );
    expect(getDefaultEmojiLocale(const Locale('zz')), same(emojiSetEnglish));
    expect(
      getDefaultEmojiLocale(const Locale('pt', 'BR')),
      same(emojiSetPortuguese),
    );
  });
}
