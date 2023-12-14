import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/skin_tones/skin_tone_overlay.dart';
import 'package:flutter/material.dart';

/// Default Search implementation
class DefaultSearchView extends SearchView {
  /// Constructor
  DefaultSearchView(
    Config config,
    EmojiViewState state,
    VoidCallback showEmojiView,
  ) : super(config, state, showEmojiView);

  @override
  _DefaultSearchViewState createState() => _DefaultSearchViewState();
}

class _DefaultSearchViewState extends State<DefaultSearchView>
    with SkinToneOverlayStateMixin {
  // late final TextEditingController _controller;
  final EmojiPickerUtils _utils = EmojiPickerUtils();
  List<Emoji> _results = [];

  void _onTextInputChanged(String text) {
    _utils.searchEmoji(text, widget.state.categoryEmoji).then(
          (value) => setState(
            () {
              _results = value;
            },
          ),
        );
  }

  EmojiCell _buildEmoji(Emoji emoji, double emojiSize) {
    return EmojiCell.fromConfig(
      emoji: emoji,
      emojiSize: emojiSize,
      onEmojiSelected: (Category? category, Emoji e) {
        widget.state.onEmojiSelected(category, emoji);
      },
      config: widget.config,
      onSkinToneDialogRequested: (emoji, emojiSize, category, index) {
        closeSkinToneOverlay();
        if (!emoji.hasSkinTone ||
            !widget.config.skinToneConfig.enableSkinTones) {
          return;
        }
        showSkinToneOverlay(
          emoji,
          emojiSize,
          null,
          index,
          widget.config,
          0.0,
          0.0,
          _onSkinTonedEmojiSelected,
        );
      },
    );
  }

  void _onSkinTonedEmojiSelected(Category? category, Emoji emoji) {
    widget.state.onEmojiSelected(category, emoji);
    closeSkinToneOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final emojiSize =
          widget.config.emojiViewConfig.getEmojiSize(constraints.maxWidth);
      return Container(
        color: widget.config.searchViewConfig.backgroundColor,
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 16.0,
          right: 8.0,
          bottom: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: emojiSize + 16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _results.length,
                separatorBuilder: (context, _) {
                  return const SizedBox(width: 8.0);
                },
                itemBuilder: (context, index) {
                  return _buildEmoji(_results[index], emojiSize);
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: widget.showEmojiView,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black26,
                  ),
                ),
                Expanded(
                  child: TextField(
                    //controller: _controller,
                    onChanged: _onTextInputChanged,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
