import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/category_emoji.dart';
import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_builder.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Default EmojiPicker Implementation
class DefaultEmojiPickerView extends EmojiPickerBuilder {
  /// Constructor
  DefaultEmojiPickerView(Config config, EmojiViewState state)
      : super(config, state);

  @override
  _DefaultEmojiPickerViewState createState() => _DefaultEmojiPickerViewState();
}

class _DefaultEmojiPickerViewState extends State<DefaultEmojiPickerView>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  TabController? _tabController;

  @override
  void initState() {
    var initCategory = widget.state.categoryEmoji.indexWhere(
        (element) => element.category == widget.config.initCategory);
    if (initCategory == -1) {
      initCategory = 0;
    }
    _tabController = TabController(
        initialIndex: initCategory,
        length: widget.state.categoryEmoji.length,
        vsync: this);
    _pageController = PageController(initialPage: initCategory);
    super.initState();
  }

  Widget _buildBackspaceButton() {
    if (widget.state.onBackspacePressed != null) {
      return Material(
        type: MaterialType.transparency,
        child: IconButton(
            padding: const EdgeInsets.only(bottom: 2),
            icon: Icon(
              Icons.backspace,
              color: widget.config.backspaceColor,
            ),
            onPressed: () {
              widget.state.onBackspacePressed!();
            }),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final emojiSize = widget.config.getEmojiSize(constraints.maxWidth);

        return Container(
          color: widget.config.bgColor,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TabBar(
                      labelColor: widget.config.iconColorSelected,
                      indicatorColor: widget.config.indicatorColor,
                      unselectedLabelColor: widget.config.iconColor,
                      controller: _tabController,
                      labelPadding: EdgeInsets.zero,
                      onTap: (index) {
                        _pageController!.jumpToPage(index);
                      },
                      tabs: widget.state.categoryEmoji
                          .asMap()
                          .entries
                          .map<Widget>((item) =>
                              _buildCategory(item.key, item.value.category))
                          .toList(),
                    ),
                  ),
                  _buildBackspaceButton(),
                ],
              ),
              Flexible(
                child: PageView.builder(
                  itemCount: widget.state.categoryEmoji.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController!.animateTo(
                      index,
                      duration: widget.config.tabIndicatorAnimDuration,
                    );
                  },
                  itemBuilder: (context, index) => Page(widget.config,
                      emojiSize, widget.state.categoryEmoji[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategory(int index, Category category) {
    return Tab(
      icon: Icon(
        widget.config.getIconForCategory(category),
      ),
    );
  }
}

class Page extends StatefulWidget {
  /// Page
  const Page(this.config, this.emojiSize, this.categoryEmoji);
  final Config config;
  final double emojiSize;
  final CategoryEmoji categoryEmoji;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  OverlayEntry? overlay;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      overlay?.remove();
      overlay = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Display notice if recent has no entries yet
    if (widget.categoryEmoji.category == Category.RECENT &&
        widget.categoryEmoji.emoji.isEmpty) {
      return _buildNoRecent();
    }
    // Build page normally
    return GridView.count(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      controller: _scrollController,
      shrinkWrap: true,
      primary: false, // changed
      padding: const EdgeInsets.all(0),
      crossAxisCount: widget.config.columns,
      mainAxisSpacing: widget.config.verticalSpacing,
      crossAxisSpacing: widget.config.horizontalSpacing,
      children: widget.categoryEmoji.emoji
          .asMap()
          .entries
          .map((item) => _buildEmoji(
              widget.emojiSize, widget.categoryEmoji, item.value, item.key))
          .toList(),
    );
  }

  Widget _buildEmoji(
    double emojiSize,
    CategoryEmoji categoryEmoji,
    Emoji emoji,
    int index,
  ) {
    return _buildButtonWidget(
      onPressed: () {
        // widget.state.onEmojiSelected(categoryEmoji.category, emoji);
      },
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          emoji.emoji,
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: emojiSize,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      index: index,
    );
  }

  Widget _buildButtonWidget({
    required VoidCallback onPressed,
    required Widget child,
    required int index,
  }) {
    if (widget.config.buttonMode == ButtonMode.MATERIAL) {
      return TextButton(
        onPressed: onPressed,
        onLongPress: () {
          var row = index ~/ widget.config.columns;
          var column = index % widget.config.columns;
          overlay?.remove();
          overlay = _createSkinToneOverlay(row, column);
          Overlay.of(context)!.insert(overlay!);
          print(row);
          print(column);
        },
        child: child,
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      );
    }
    return CupertinoButton(
        padding: EdgeInsets.zero, onPressed: onPressed, child: child);
  }

  Widget _buildNoRecent() {
    return Center(
        child: Text(
      widget.config.noRecentsText,
      style: widget.config.noRecentsStyle,
      textAlign: TextAlign.center,
    ));
  }

  /// Overlay for SkinTone
  OverlayEntry _createSkinToneOverlay(int row, int column) {
    var renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var emojiWidth = renderBox.size.width / widget.config.columns;

    print(offset.dx + column * emojiWidth);
    print(offset.dy + row * emojiWidth);

    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx + column * emojiWidth,
              top: offset.dy + row * emojiWidth - _scrollController.offset,
              child: Material(
                elevation: 4.0,
                child: Container(
                  width: emojiWidth,
                  height: emojiWidth,
                  color: Colors.red,
                ),
              ),
            ));
  }
}
