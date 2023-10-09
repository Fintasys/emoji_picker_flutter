import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Example for EmojiPickerFlutter that demonstrates possible search feature
/// implementation.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _searchScrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();
  List<Emoji> _searchResults = List.empty();
  OverlayEntry? _overlay;
  final Config _config = const Config(
    buttonMode: ButtonMode.MATERIAL,
  );
  bool _isSearchFocused = false;
  bool _emojiShowing = false;

  @override
  void dispose() {
    _closeSkinToneDialog();
    _controller.dispose();
    _searchController.dispose();
    _searchScrollController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onEmojiSelected(Category? category, Emoji emoji) {
    final text = _controller.text;
    final selection = _controller.selection;
    final cursorPosition = _controller.selection.base.offset;

    if (cursorPosition < 0) {
      _controller.text += emoji.emoji;
      return;
    }
    final newText =
        text.replaceRange(selection.start, selection.end, emoji.emoji);
    final emojiLength = emoji.emoji.length;
    _controller
      ..text = newText
      ..selection = selection.copyWith(
        baseOffset: selection.start + emojiLength,
        extentOffset: selection.start + emojiLength,
      );
  }

  void _openSkinToneDialog(
    BuildContext context,
    Emoji emoji,
    double emojiSize,
    CategoryEmoji? categoryEmoji,
    int index,
  ) {
    _closeSkinToneDialog();
    if (!emoji.hasSkinTone || !_config.enableSkinTones) {
      return;
    }
    _overlay = _buildSkinToneOverlay(
      context,
      emoji,
      emojiSize,
      index,
    );
    Overlay.of(context).insert(_overlay!);
  }

  void _closeSkinToneDialog() {
    _overlay?.remove();
    _overlay = null;
  }

  /// Overlay for SkinTone
  OverlayEntry _buildSkinToneOverlay(
    BuildContext context,
    Emoji emoji,
    double emojiSize,
    int index,
  ) {
    // Calculate position for skin tone dialog
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final emojiSpace = renderBox.size.width / _config.columns;
    final leftOffset = _getLeftOffset(emojiSpace, index);
    final left = offset.dx + index * emojiSpace + leftOffset;
    final top = offset.dy;

    // Generate other skintone options
    final skinTonesEmoji = SkinTone.values
        .map((skinTone) => EmojiPickerUtils().applySkinTone(emoji, skinTone))
        .toList();

    return OverlayEntry(
      builder: (context) => Positioned(
        left: left,
        top: top,
        child: Material(
          elevation: 4.0,
          child: EmojiContainer(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            color: _config.skinToneDialogBgColor,
            buttonMode: _config.buttonMode,
            child: Row(
              children: [
                _buildSkinToneEmoji(emoji, emojiSpace, emojiSize),
                _buildSkinToneEmoji(skinTonesEmoji[0], emojiSpace, emojiSize),
                _buildSkinToneEmoji(skinTonesEmoji[1], emojiSpace, emojiSize),
                _buildSkinToneEmoji(skinTonesEmoji[2], emojiSpace, emojiSize),
                _buildSkinToneEmoji(skinTonesEmoji[3], emojiSpace, emojiSize),
                _buildSkinToneEmoji(skinTonesEmoji[4], emojiSpace, emojiSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build Emoji inside skin tone dialog
  Widget _buildSkinToneEmoji(
    Emoji emoji,
    double width,
    double emojiSize,
  ) {
    return SizedBox(
        width: width,
        height: width,
        child: EmojiCell.fromConfig(
          emoji: emoji,
          emojiSize: emojiSize,
          onEmojiSelected: (category, emoji) {
            _onEmojiSelected(category, emoji);
            _closeSkinToneDialog();
          },
          config: _config,
        ));
  }

  // Calucates the offset from the middle of selected emoji to the left side
  // of the skin tone dialog
  // Case 1: Selected Emoji is close to left border and offset needs to be
  // reduced
  // Case 2: Selected Emoji is close to right border and offset needs to be
  // larger than half of the whole width
  // Case 3: Enough space to left and right border and offset can be half
  // of whole width
  double _getLeftOffset(double emojiWidth, int column) {
    var remainingColumns =
        _config.columns - (column + 1 + (kSkinToneCount ~/ 2));
    if (column >= 0 && column < 3) {
      return -1 * column * emojiWidth;
    } else if (remainingColumns < 0) {
      return -1 *
          ((kSkinToneCount ~/ 2 - 1) + -1 * remainingColumns) *
          emojiWidth;
    }
    return -1 * ((kSkinToneCount ~/ 2) * emojiWidth) + emojiWidth / 2;
  }

  Widget _buildSearchBar(BuildContext context, bool isEmpty) {
    return ColoredBox(
      color: _config.bgColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!_isSearchFocused)
            IconButton(
              onPressed: _searchFocusNode.requestFocus,
              icon: const Icon(Icons.search),
              visualDensity: VisualDensity.compact,
            )
          else
            IconButton(
              onPressed: () {
                _searchController.text = '';
                _searchFocusNode.unfocus();
              },
              icon: const Icon(Icons.arrow_back),
              visualDensity: VisualDensity.compact,
            ),
          Expanded(
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _isSearchFocused = hasFocus;
                });
              },
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                maxLines: 1,
                onChanged: (text) async {
                  _searchResults = await EmojiPickerUtils()
                      .searchEmoji(text, defaultEmojiSet);
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 10.0),
                  isDense: true,
                  suffixIconConstraints: const BoxConstraints(),
                  suffixIcon: isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            _searchController.text = '';
                          },
                          icon: const Icon(Icons.clear),
                          visualDensity: VisualDensity.compact,
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchResults(
      BuildContext context, double emojiSize, double cellSize) {
    if (_searchResults.isEmpty) {
      return SizedBox(
          height: cellSize,
          child: Center(
              child: Text(_searchController.text.isEmpty
                  ? 'Type your search phrase'
                  : 'No matches')));
    }
    return SizedBox(
      height: cellSize,
      child: ListView(
        controller: _searchScrollController,
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < _searchResults.length; i++)
            SizedBox(
              width: cellSize,
              child: EmojiCell.fromConfig(
                emoji: _searchResults[i],
                emojiSize: emojiSize,
                index: i,
                onEmojiSelected: (category, emoji) {
                  _closeSkinToneDialog();
                  _onEmojiSelected(category, emoji);
                },
                onSkinToneDialogRequested:
                    (emoji, emojiSize, categoryEmoji, index) =>
                        _openSkinToneDialog(
                  context,
                  emoji,
                  emojiSize,
                  categoryEmoji,
                  index,
                ),
                config: _config,
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Emoji Picker Search Example App'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          final emojiSize = _config.getEmojiSize(constraints.maxWidth);
          // emojiSize is the size of the font, need some paddings around
          final cellSize = emojiSize + 20.0;
          return Column(
            children: [
              const Spacer(),
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
                              _emojiShowing = !_emojiShowing;
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
                              controller: _controller,
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
                offstage: !_emojiShowing,
                child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _searchController,
                    builder: (context, value, _) {
                      return Column(
                        children: [
                          if (value.text.isEmpty && !_isSearchFocused)
                            SizedBox(
                                height: 250,
                                child: EmojiPicker(
                                  textEditingController: _controller,
                                  config: _config,
                                ))
                          else
                            _buildSearchResults(context, emojiSize, cellSize),
                          _buildSearchBar(context, value.text.isEmpty)
                        ],
                      );
                    }),
              )
            ],
          );
        }),
      ),
    );
  }
}
