import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

/// This example covers some advanced topics, like custom emoji font,
/// inserting emojis in [TextField] with [EditableTextState],
/// altering the default emoji set, etc.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _editKey = GlobalKey();
  final _focusNode = FocusNode();
  final TextEditingController _controller =
      EmojiTextEditingController(emojiStyle: GoogleFonts.notoEmoji());
  bool emojiShowing = false;

  void _updateTextEditingValue(TextEditingValue value) {
    (_editKey.currentState as TextSelectionGestureDetectorBuilderDelegate)
        .editableTextKey
        .currentState
        ?.userUpdateTextEditingValue(value, SelectionChangedCause.keyboard);
  }

  /// This demostrates advanced handling of the seleted emoji.
  /// Updating TextEditingValue this way ensures that the underlying
  /// EditableText will scroll to display caret position if necessary.
  /// Simply updating controller text and selection properties does not achieve
  /// that.
  /// One of the limitations of this approach is that it cannot be used with
  /// [TextFormField] widgets since they don't provide a way to reach their
  /// internal TextField widget state.
  ///
  /// You can always fall back to basic integration by just setting
  /// [textEditingController] parameter in the [EmojiPicker] constructor
  /// (see basic example).
  _onEmojiSelected(Emoji emoji) {
    debugPrint('_onEmojiSelected: ${emoji.emoji}');

    if (_controller.selection.base.offset < 0) {
      _updateTextEditingValue(TextEditingValue(
        text: _controller.text + emoji.emoji,
      ));
      return;
    }

    final selection = _controller.selection;
    final newText = _controller.text
        .replaceRange(selection.start, selection.end, emoji.emoji);
    final emojiLength = emoji.emoji.length;
    _updateTextEditingValue(TextEditingValue(
        text: newText,
        selection: selection.copyWith(
          baseOffset: selection.start + emojiLength,
          extentOffset: selection.start + emojiLength,
        )));
  }

  _onBackspacePressed() {
    debugPrint('_onBackspacePressed');
    if (_controller.selection.base.offset < 0) {
      return;
    }

    final selection = _controller.value.selection;
    final text = _controller.value.text;
    final newTextBeforeCursor =
        selection.textBefore(text).characters.skipLast(1).toString();
    _updateTextEditingValue(TextEditingValue(
        text: newTextBeforeCursor + selection.textAfter(text),
        selection: TextSelection.fromPosition(
            TextPosition(offset: newTextBeforeCursor.length))));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Emoji Picker Example App'),
        ),
        body: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18.0),
                      children: EmojiPickerUtils().setEmojiTextStyle(
                          '⌨ This text demonstrates how you can include '
                          'custom-font-based emojis 😁 '
                          'in your static texts 🎉👏',
                          emojiStyle: GoogleFonts.notoEmoji(
                              color: Colors.blueAccent)))),
            ),
            Container(
                height: 66.0,
                color: Colors.blue,
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            emojiShowing = !emojiShowing;
                            if (emojiShowing) {
                              // If TextField remains focused, the keyboard
                              // will pop up on every emoji insert done with
                              // EditableTextState manipulation.

                              // In a production app you might want to detect
                              // keyboard opens and hide emoji picker
                              // for more consistent experience.
                              _focusNode.unfocus();
                            } else {
                              _focusNode.requestFocus();
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                            key: _editKey,
                            controller: _controller,
                            focusNode: _focusNode,
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 8.0,
                                  top: 8.0,
                                  right: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            )),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                          onPressed: () {
                            // send message
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                    )
                  ],
                )),
            Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                  height: 250,
                  child: EmojiPicker(
                    onEmojiSelected: (Category? category, Emoji emoji) {
                      _onEmojiSelected(emoji);
                    },
                    onBackspacePressed: _onBackspacePressed,
                    config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32 *
                          (!foundation.kIsWeb && Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: false,
                      recentTabBehavior: RecentTabBehavior.RECENT,
                      recentsLimit: 28,
                      replaceEmojiOnLimitExceed: false,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      loadingIndicator:
                          const Center(child: CircularProgressIndicator()),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL,
                      checkPlatformCompatibility: false,
                      emojiTextStyle: GoogleFonts.notoColorEmoji(),
                      // or for single colored Emoji use:
                      // GoogleFonts.notoEmoji(color: Colors.black),
                      // or TextStyle(fontFamily: 'NotoColorEmoji',
                      //              color: Colors.blueAccent)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
