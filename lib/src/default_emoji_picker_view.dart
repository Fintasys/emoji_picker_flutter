import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
  OverlayEntry? _overlay;
  late final _scrollController = ScrollController();
  late final _utils = EmojiPickerUtils();
  final double tabBarHeight = 46;

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
    _pageController = PageController(initialPage: initCategory)
      ..addListener(_closeSkinToneDialog);
    _scrollController.addListener(_closeSkinToneDialog);
    super.initState();
  }

  @override
  void dispose() {
    _closeSkinToneDialog();
    super.dispose();
  }

  void _closeSkinToneDialog() {
    _overlay?.remove();
    _overlay = null;
  }

  void _openSkinToneDialog(
    Emoji emoji,
    double emojiSize,
    CategoryEmoji? categoryEmoji,
    int index,
  ) {
    _closeSkinToneDialog();
    if (!emoji.hasSkinTone || !widget.config.enableSkinTones) {
      return;
    }
    _overlay = _buildSkinToneOverlay(
      emoji,
      emojiSize,
      categoryEmoji,
      index,
    );
    Overlay.of(context)?.insert(_overlay!);
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
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final emojiSize = widget.config.getEmojiSize(constraints.maxWidth);
        return EmojiContainer(
          color: widget.config.bgColor,
          buttonMode: widget.config.buttonMode,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: tabBarHeight,
                      child: TabBar(
                        labelColor: widget.config.iconColorSelected,
                        indicatorColor: widget.config.indicatorColor,
                        unselectedLabelColor: widget.config.iconColor,
                        controller: _tabController,
                        labelPadding: EdgeInsets.zero,
                        onTap: (index) {
                          _closeSkinToneDialog();
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
                  itemBuilder: (context, index) =>
                      _buildPage(emojiSize, widget.state.categoryEmoji[index]),
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

  Widget _buildPage(double emojiSize, CategoryEmoji categoryEmoji) {
    // Display notice if recent has no entries yet
    if (categoryEmoji.category == Category.RECENT &&
        categoryEmoji.emoji.isEmpty) {
      return _buildNoRecent();
    }
    // Build page normally
    return GestureDetector(
      onTap: _closeSkinToneDialog,
      child: GridView.count(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          primary: false,
          padding: widget.config.gridPadding,
          crossAxisCount: widget.config.columns,
          mainAxisSpacing: widget.config.verticalSpacing,
          crossAxisSpacing: widget.config.horizontalSpacing,
          children: [
            for (int i = 0; i < categoryEmoji.emoji.length; i++)
              EmojiCell.fromConfig(
                emoji: categoryEmoji.emoji[i],
                emojiSize: emojiSize,
                categoryEmoji: categoryEmoji,
                index: i,
                onEmojiSelected: (category, emoji) {
                  _closeSkinToneDialog();
                  widget.state.onEmojiSelected(category, emoji);
                },
                onSkinToneDialogRequested: _openSkinToneDialog,
                config: widget.config,
              )
          ]),
    );
  }

  /// Build Widget for when no recent emoji are available
  Widget _buildNoRecent() {
    return Center(
      child: widget.config.noRecents,
    );
  }

  /// Overlay for SkinTone
  OverlayEntry _buildSkinToneOverlay(
    Emoji emoji,
    double emojiSize,
    CategoryEmoji? categoryEmoji,
    int index,
  ) {
    // Calculate position of emoji in the grid
    final row = index ~/ widget.config.columns;
    final column = index % widget.config.columns;
    // Calculate position for skin tone dialog
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final emojiSpace = renderBox.size.width / widget.config.columns;
    final topOffset = emojiSpace;
    final leftOffset = _getLeftOffset(emojiSpace, column);
    final left = offset.dx + column * emojiSpace + leftOffset;
    final top = tabBarHeight +
        offset.dy +
        row * emojiSpace -
        _scrollController.offset -
        topOffset;

    // Generate other skintone options
    final skinTonesEmoji = SkinTone.values
        .map((skinTone) => _utils.applySkinTone(emoji, skinTone))
        .toList();

    return OverlayEntry(
      builder: (context) => Positioned(
        left: left,
        top: top,
        child: Material(
          elevation: 4.0,
          child: EmojiContainer(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            color: widget.config.skinToneDialogBgColor,
            buttonMode: widget.config.buttonMode,
            child: Row(
              children: [
                _buildSkinToneEmoji(
                    categoryEmoji, emoji, emojiSpace, emojiSize),
                _buildSkinToneEmoji(
                    categoryEmoji, skinTonesEmoji[0], emojiSpace, emojiSize),
                _buildSkinToneEmoji(
                    categoryEmoji, skinTonesEmoji[1], emojiSpace, emojiSize),
                _buildSkinToneEmoji(
                    categoryEmoji, skinTonesEmoji[2], emojiSpace, emojiSize),
                _buildSkinToneEmoji(
                    categoryEmoji, skinTonesEmoji[3], emojiSpace, emojiSize),
                _buildSkinToneEmoji(
                    categoryEmoji, skinTonesEmoji[4], emojiSpace, emojiSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build Emoji inside skin tone dialog
  Widget _buildSkinToneEmoji(
    CategoryEmoji? categoryEmoji,
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
          categoryEmoji: categoryEmoji,
          onEmojiSelected: (category, emoji) {
            widget.state.onEmojiSelected(category, emoji);
            _closeSkinToneDialog();
          },
          config: widget.config,
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
        widget.config.columns - (column + 1 + (kSkinToneCount ~/ 2));
    if (column >= 0 && column < 3) {
      return -1 * column * emojiWidth;
    } else if (remainingColumns < 0) {
      return -1 *
          ((kSkinToneCount ~/ 2 - 1) + -1 * remainingColumns) *
          emojiWidth;
    }
    return -1 * ((kSkinToneCount ~/ 2) * emojiWidth) + emojiWidth / 2;
  }
}
