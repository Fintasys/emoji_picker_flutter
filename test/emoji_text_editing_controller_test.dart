import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('EmojiTextEditingController', () {
    testWidgets('should apply emojiTextStyle to emojis', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            final emojiStyle = const TextStyle(color: Colors.red);
            final regularStyle = const TextStyle(color: Colors.black);
            final controller = EmojiTextEditingController(
              text: 'Hello 👋 World',
              emojiTextStyle: emojiStyle,
            );

            final span = controller.buildTextSpan(
              context: context,
              style: regularStyle,
              withComposing: false,
            );

            expect(span.children?.length, 3);
            // Hello
            expect(span.children?[0].style?.color, Colors.black);
            // Emoji
            expect(span.children?[1].style?.color, Colors.red);
            expect(
              span.children?[1].style?.fontFamilyFallback,
              DefaultEmojiTextStyle.fontFamilyFallback,
            );
            // World
            expect(span.children?[2].style?.color, Colors.black);

            return const Placeholder();
          },
        ),
      );
    });
  });
}
