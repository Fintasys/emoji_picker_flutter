import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmojiTextStyle', () {
    testWidgets('should apply EmojiTextStyle to emoji in text', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            final text = 'Hello 👋 World';
            final result = EmojiPickerUtils().setEmojiTextStyle(
              text,
              emojiStyle: const TextStyle(color: Colors.red),
              parentStyle: const TextStyle(
                color: Colors.black,
              ),
            );

            expect(result.length, 3);
            // Hello
            expect(result[0].style?.color, Colors.black);
            // Emoji
            expect(result[1].style?.color, Colors.red);
            expect(result[1].style?.fontFamilyFallback,
                DefaultEmojiTextStyle.fontFamilyFallback);
            // World
            expect(result[2].style?.color, Colors.black);

            return const Placeholder();
          },
        ),
      );
    });
  });
}
