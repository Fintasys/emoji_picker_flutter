import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final utils = EmojiPickerUtils();
  const heart = Emoji('❤️', 'hjerte | rødt hjerte');
  const thumb = Emoji('👍', 'tommel | bra', hasSkinTone: true);
  const local = [
    CategoryEmoji(Category.SMILEYS, [heart, thumb]),
  ];

  Future<List<Emoji>> search(String text, {bool english = true}) =>
      utils.searchEmoji(
        text,
        local,
        checkPlatformCompatibility: false,
        includeEnglishKeywords: english,
      );

  test('English matching is opt-in; local keywords always work', () async {
    expect(await search('hjerte', english: false), [heart]);
    expect(await search('heart', english: false), isEmpty);
    expect(await search('heart'), [heart]);
    expect(await search('RØDT heart'), [heart]);
  });

  test('returns local metadata, deduplicates and honors custom sets', () async {
    final result = await search('thumb');
    expect(result, [thumb]);
    expect(result.single, same(thumb));
    expect(result.single.hasSkinTone, isTrue);
    expect(await search('apple'), isEmpty);
    expect(
      await utils.searchEmoji('hjerte', const [
        CategoryEmoji(Category.SMILEYS, [heart, heart]),
        CategoryEmoji(Category.RECENT, [heart]),
      ], checkPlatformCompatibility: false),
      [heart],
    );
  });

  test(
    'uses the current dataset after language and custom-set changes',
    () async {
      expect(await search('hjerte'), [heart]);
      const germanHeart = Emoji('❤️', 'Herz');
      const german = [
        CategoryEmoji(Category.SMILEYS, [germanHeart]),
      ];
      expect(
        await utils.searchEmoji(
          'Herz',
          german,
          checkPlatformCompatibility: false,
        ),
        [germanHeart],
      );
      expect(
        await utils.searchEmoji(
          'hjerte',
          german,
          checkPlatformCompatibility: false,
        ),
        isEmpty,
      );
      expect(await search('hjerte'), [heart]);
      expect(
        await utils.searchEmoji(
          'heart',
          const [],
          includeEnglishKeywords: true,
          checkPlatformCompatibility: false,
        ),
        isEmpty,
      );
    },
  );

  test(
    'whitespace, prefixes, exact glyphs and presentation selectors',
    () async {
      expect(await search('   '), isEmpty);
      expect(await search('  rødt   hj  '), [heart]);
      expect(await search(' ❤️ '), [heart]);
      const textHeart = Emoji('❤', 'lokalt');
      expect(
        await utils.searchEmoji(
          'heart',
          const [
            CategoryEmoji(Category.SMILEYS, [textHeart]),
          ],
          includeEnglishKeywords: true,
          checkPlatformCompatibility: false,
        ),
        [textHeart],
      );
    },
  );

  test('config equality includes the English matching option', () {
    expect(
      const SearchViewConfig(),
      const SearchViewConfig(includeEnglishKeywords: false),
    );
    expect(
      const SearchViewConfig(),
      isNot(const SearchViewConfig(includeEnglishKeywords: true)),
    );
  });

  for (final english in [false, true]) {
    testWidgets('search view forwards bilingual setting ($english)', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({});
      Emoji? selected;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmojiPicker(
              onEmojiSelected: (_, emoji) => selected = emoji,
              config: Config(
                height: 300,
                checkPlatformCompatibility: false,
                emojiSet: (_) => local,
                searchViewConfig: SearchViewConfig(
                  includeEnglishKeywords: english,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'heart');
      await tester.pumpAndSettle();
      expect(find.text('❤️'), english ? findsOneWidget : findsNothing);
      if (english) {
        await tester.tap(find.text('❤️'));
        expect(selected, same(heart));
      }
    });
  }
}
