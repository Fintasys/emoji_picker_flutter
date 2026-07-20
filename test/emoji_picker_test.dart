import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Use for golden tests, helpful in debugging
// await expectLater(
//   find.byType(MaterialApp),
//   matchesGoldenFile('overlay.png'),
// );

void main() {
  group('EmojiPicker Tests', () {
    testWidgets('Should allow user to select an emoji',
        (WidgetTester tester) async {
      final _controller = TextEditingController();
      Emoji? _emojiSelected;
      Category? _categorySelected;

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmojiPicker(
              textEditingController: _controller,
              onEmojiSelected: (category, emoji) {
                _emojiSelected = emoji;
                _categorySelected = category;
              },
              config: const Config(
                  height: 256,
                  categoryViewConfig: CategoryViewConfig(
                    recentTabBehavior: RecentTabBehavior.NONE,
                  )),
            ),
          ),
        ),
      );

      // Wait for the emojis to load if they are being loaded asynchronously
      await tester.pumpAndSettle();

      // Find an emoji in the picker
      final emoji = find.text('🙂').hitTestable();

      // Verify if we can find the emoji
      expect(emoji, findsOneWidget);

      // Tap on the emoji, this should trigger the selection action
      await tester.tap(emoji);

      // Call pumpAndSettle in case the UI needs to settle after an interaction
      await tester.pumpAndSettle();

      // Check if the emoji is added to the text controller
      expect(_controller.text, contains('🙂'));

      // Check if the emoji been passed to the 'onEmojiSelected' callback
      expect(
        _emojiSelected,
        equals(
          const Emoji('🙂', 'face | happy | slightly | smile | smiling'),
        ),
      );

      // Check if the category been passed to the 'onEmojiSelected' callback
      expect(_categorySelected, equals(Category.SMILEYS));
    });

    testWidgets('Should allow to select an emoji with skintone on longPress',
        (WidgetTester tester) async {
      final _controller = TextEditingController();
      final _utils = EmojiPickerUtils();
      final emoji = const Emoji('👍', 'Thumbs Up', hasSkinTone: true);
      Emoji? _emojiSelected;
      Category? _categorySelected;

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: EmojiPicker(
                textEditingController: _controller,
                onEmojiSelected: (category, emoji) {
                  _emojiSelected = emoji;
                  _categorySelected = category;
                },
                config: const Config(
                  height: 500,
                  categoryViewConfig: CategoryViewConfig(
                    recentTabBehavior: RecentTabBehavior.NONE,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Wait for the emojis to load if they are being loaded asynchronously
      await tester.pumpAndSettle();

      // Find an emoji in the picker
      final emojiToFind = find.text(emoji.emoji);

      // Scroll until the emoji to be found appears.
      await tester.dragUntilVisible(
        emojiToFind,
        find.byKey(const Key('emojiScrollView')),
        const Offset(0, -300),
      );

      // Verify if we can find the emoji
      expect(emojiToFind, findsOneWidget);

      // Tap on the emoji, this should trigger the skintone overlay
      await tester.longPress(emojiToFind);

      // Call pumpAndSettle in case the UI needs to settle after an interaction
      await tester.pumpAndSettle();

      /// Check if all skin tones are rendered in overlay
      Finder? skinToneVariantToFind;
      for (var i = 0; i < SkinTone.values.length; i++) {
        skinToneVariantToFind =
            find.text(_utils.applySkinTone(emoji, SkinTone.values[i]).emoji);
        // Verify if we can find the skintone variant
        expect(skinToneVariantToFind, findsOneWidget);
      }

      // Tap on the emoji, this should trigger the selection action
      await tester.tap(skinToneVariantToFind!);

      // Check if the emoji is added to the text controller
      expect(_controller.text, contains('👍🏿'));

      // Check if the emoji been passed to the 'onEmojiSelected' callback
      expect(_emojiSelected?.emoji, equals('👍🏿'));
      expect(
        _emojiSelected?.name,
        equals('+1 | good | hand | like | thumb | up | yes'),
      );
      expect(_emojiSelected?.hasSkinTone, equals(true));

      // Check if the category been passed to the 'onEmojiSelected' callback
      expect(_categorySelected, equals(Category.SMILEYS));
    });

    testWidgets('Clips overflow when constrained tighter than natural height',
        (WidgetTester tester) async {
      final _controller = TextEditingController();

      // Constrain the picker far below the natural sum of the category bar
      // and bottom action bar to force the inner Column to overflow (#256).
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                height: 30,
                child: EmojiPicker(
                  textEditingController: _controller,
                  config: const Config(
                    height: 30,
                    categoryViewConfig: CategoryViewConfig(
                      recentTabBehavior: RecentTabBehavior.NONE,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // A RenderFlex overflow is reported in debug mode; drain it so the test
      // can assert the overflow is clipped rather than left painting stripes.
      final exception = tester.takeException();
      expect(
        exception == null || exception.toString().contains('overflowed'),
        isTrue,
      );

      // The inner Column is wrapped in a ClipRect that clips the overflow.
      expect(
        find.descendant(
          of: find.byType(EmojiContainer),
          matching: find.byType(ClipRect),
        ),
        findsOneWidget,
      );
    });
  });
}
