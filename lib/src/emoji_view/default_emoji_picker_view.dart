import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default EmojiPicker Implementation
class DefaultEmojiPickerView extends EmojiPickerView {
  /// Constructor
  DefaultEmojiPickerView(
    Config config,
    EmojiViewState state,
    VoidCallback showSearchBar,
  ) : super(config, state, showSearchBar);

  @override
  _DefaultEmojiPickerViewState createState() => _DefaultEmojiPickerViewState();
}

class _DefaultEmojiPickerViewState extends State<DefaultEmojiPickerView>
    with SingleTickerProviderStateMixin, SkinToneOverlayStateMixin {
  final double _tabBarHeight = 46;

  late TabController _tabController;
  late PageController _pageController;
  late final _scrollController = ScrollController();

  @override
  void initState() {
    var initCategory = widget.state.categoryEmoji.indexWhere((element) =>
        element.category == widget.config.categoryViewConfig.initCategory);
    if (initCategory == -1) {
      initCategory = 0;
    }
    _tabController = TabController(
        initialIndex: initCategory,
        length: widget.state.categoryEmoji.length,
        vsync: this);
    _pageController = PageController(initialPage: initCategory)
      ..addListener(closeSkinToneOverlay);
    _scrollController.addListener(closeSkinToneOverlay);
    super.initState();
  }

  @override
  void dispose() {
    closeSkinToneOverlay();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final emojiSize =
            widget.config.emojiViewConfig.getEmojiSize(constraints.maxWidth);
        return EmojiContainer(
          color: widget.config.emojiViewConfig.backgroundColor,
          buttonMode: widget.config.emojiViewConfig.buttonMode,
          child: Column(
            children: [
              // Category view or bottom search bar
              widget.config.swapCategoryAndBottomBar
                  ? _buildBottomSearchBar()
                  : _buildCategoryView(),

              // Emoji view
              _buildEmojiView(emojiSize),

              // Bottom Search Bar or Category view
              widget.config.swapCategoryAndBottomBar
                  ? _buildCategoryView()
                  : _buildBottomSearchBar(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryView() {
    return widget.config.categoryViewConfig.customCategoryView != null
        ? widget.config.categoryViewConfig.customCategoryView!(
            widget.config,
            widget.state,
            _tabController,
            _pageController,
          )
        : DefaultCategoryView(
            widget.config,
            widget.state,
            _tabController,
            _pageController,
          );
  }

  Flexible _buildEmojiView(double emojiSize) {
    return Flexible(
      child: PageView.builder(
        itemCount: widget.state.categoryEmoji.length,
        controller: _pageController,
        onPageChanged: (index) {
          _tabController.animateTo(
            index,
            duration: widget.config.categoryViewConfig.tabIndicatorAnimDuration,
          );
        },
        itemBuilder: (context, index) =>
            _buildPage(emojiSize, widget.state.categoryEmoji[index]),
      ),
    );
  }

  Widget _buildBottomSearchBar() {
    if (!widget.config.bottomActionBarConfig.enabled) {
      return const SizedBox.shrink();
    }
    return widget.config.bottomActionBarConfig.customBottomActionBar != null
        ? widget.config.bottomActionBarConfig.customBottomActionBar!(
            widget.config,
            widget.state,
            widget.showSearchBar,
          )
        : DefaultBottomActionBar(
            widget.config,
            widget.state,
            widget.showSearchBar,
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
      onTap: closeSkinToneOverlay,
      child: GridView.count(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          primary: false,
          // childAspectRatio: TODO: check if there is an alternative that
          // works by height
          // maxWidth / widget.config.columns / emojiSize / 2,
          padding: widget.config.emojiViewConfig.gridPadding,
          crossAxisCount: widget.config.emojiViewConfig.columns,
          mainAxisSpacing: widget.config.emojiViewConfig.verticalSpacing,
          crossAxisSpacing: widget.config.emojiViewConfig.horizontalSpacing,
          children: [
            for (int i = 0; i < categoryEmoji.emoji.length; i++)
              EmojiCell.fromConfig(
                emoji: categoryEmoji.emoji[i],
                emojiSize: emojiSize,
                categoryEmoji: categoryEmoji,
                index: i,
                onEmojiSelected: _onSkinTonedEmojiSelected,
                onSkinToneDialogRequested: _openSkinToneDialog,
                config: widget.config,
              )
          ]),
    );
  }

  /// Build Widget for when no recent emoji are available
  Widget _buildNoRecent() {
    return Center(
      child: widget.config.emojiViewConfig.noRecents,
    );
  }

  void _openSkinToneDialog(
    Emoji emoji,
    double emojiSize,
    CategoryEmoji? categoryEmoji,
    int index,
  ) {
    closeSkinToneOverlay();
    if (!emoji.hasSkinTone || !widget.config.skinToneConfig.enabled) {
      return;
    }
    showSkinToneOverlay(
      emoji,
      emojiSize,
      categoryEmoji,
      index,
      widget.config,
      _scrollController.offset,
      _tabBarHeight,
      _onSkinTonedEmojiSelected,
    );
  }

  void _onSkinTonedEmojiSelected(Category? category, Emoji emoji) {
    widget.state.onEmojiSelected(category, emoji);
    closeSkinToneOverlay();
  }
}
