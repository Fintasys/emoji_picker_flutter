import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default EmojiPicker Implementation
class DefaultEmojiPickerView extends EmojiPickerView {
  /// Constructor
  const DefaultEmojiPickerView(
    super.config,
    super.state,
    super.showSearchBar, {
    super.key,
  });

  @override
  State<DefaultEmojiPickerView> createState() => _DefaultEmojiPickerViewState();
}

class _DefaultEmojiPickerViewState extends State<DefaultEmojiPickerView>
    with SingleTickerProviderStateMixin, SkinToneOverlayStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  final _scrollController = ScrollController();
  final _utils = EmojiPickerUtils();

  /// Last remembered skin tone, applied to skin-tone-capable emoji for
  /// display and selection when [SkinToneConfig.rememberSkinTone] is enabled.
  String? _rememberedSkinTone;

  @override
  void initState() {
    // Use controller's current category if available,
    // otherwise use config's initCategory
    final targetCategory =
        widget.state.currentCategory ??
        widget.config.categoryViewConfig.initCategory;

    var initCategory = widget.state.categoryEmoji.indexWhere(
      (element) => element.category == targetCategory,
    );
    if (initCategory == -1) {
      initCategory = 0;
    }
    _tabController = TabController(
      initialIndex: initCategory,
      length: widget.state.categoryEmoji.length,
      vsync: this,
    );
    _pageController = PageController(initialPage: initCategory)
      ..addListener(closeSkinToneOverlay);
    _scrollController.addListener(closeSkinToneOverlay);

    // Listen to programmatic category changes from controller
    widget.state.categoryNavigationNotifier.addListener(
      _onCategoryNavigationChanged,
    );

    _loadRememberedSkinTone();

    super.initState();
  }

  void _loadRememberedSkinTone() {
    if (!widget.config.skinToneConfig.rememberSkinTone) {
      return;
    }
    _utils.getRememberedSkinTone().then((tone) {
      if (!mounted || tone == null) {
        return;
      }
      setState(() => _rememberedSkinTone = tone);
    });
  }

  void _onCategoryNavigationChanged() {
    final targetCategory = widget.state.categoryNavigationNotifier.value;
    if (targetCategory != null) {
      final index = widget.state.categoryEmoji.indexWhere(
        (element) => element.category == targetCategory,
      );
      if (index != -1) {
        final currentPage = _pageController.page?.round();
        if (index != currentPage) {
          // Use jumpToPage for instant navigation without building
          // intermediate pages. This prevents performance issues when
          // jumping to tabs far away. The onPageChanged callback will
          // handle animating the tab indicator
          _pageController.jumpToPage(index);
        }
      }
    }
  }

  @override
  void dispose() {
    widget.state.categoryNavigationNotifier.removeListener(
      _onCategoryNavigationChanged,
    );
    closeSkinToneOverlay();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final emojiSize = widget.config.emojiViewConfig.getEmojiSize(
          constraints.maxWidth,
        );
        final emojiBoxSize = widget.config.emojiViewConfig.getEmojiBoxSize(
          constraints.maxWidth,
        );
        return EmojiContainer(
          color: widget.config.emojiViewConfig.backgroundColor,
          buttonMode: widget.config.emojiViewConfig.buttonMode,
          child: ClipRect(
            child: Column(
              children:
                  [
                    widget.config.viewOrderConfig.top,
                    widget.config.viewOrderConfig.middle,
                    widget.config.viewOrderConfig.bottom,
                  ].map((item) {
                    switch (item) {
                      case EmojiPickerItem.categoryBar:
                        // Category view
                        return _buildCategoryView();
                      case EmojiPickerItem.emojiView:
                        // Emoji view
                        return _buildEmojiView(emojiSize, emojiBoxSize);
                      case EmojiPickerItem.searchBar:
                        // Search Bar
                        return _buildBottomSearchBar();
                    }
                  }).toList(),
            ),
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

  Widget _buildEmojiView(double emojiSize, double emojiBoxSize) {
    return Flexible(
      child: PageView.builder(
        itemCount: widget.state.categoryEmoji.length,
        controller: _pageController,
        onPageChanged: (index) {
          _tabController.animateTo(
            index,
            duration: widget.config.categoryViewConfig.tabIndicatorAnimDuration,
          );
          // Notify about category change
          if (index < widget.state.categoryEmoji.length) {
            widget.state.onCategoryChanged?.call(
              widget.state.categoryEmoji[index].category,
            );
          }
        },
        itemBuilder: (context, index) => _buildPage(
          emojiSize,
          emojiBoxSize,
          widget.state.categoryEmoji[index],
        ),
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

  Widget _buildPage(
    double emojiSize,
    double emojiBoxSize,
    CategoryEmoji categoryEmoji,
  ) {
    // Display notice if recent has no entries yet
    if (categoryEmoji.category == Category.RECENT &&
        categoryEmoji.emoji.isEmpty) {
      return _buildNoRecent();
    }
    // Build page normally
    return GridView.builder(
      key: const Key('emojiScrollView'),
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      primary: false,
      padding: widget.config.emojiViewConfig.gridPadding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: widget.config.emojiViewConfig.columns,
        mainAxisSpacing: widget.config.emojiViewConfig.verticalSpacing,
        crossAxisSpacing: widget.config.emojiViewConfig.horizontalSpacing,
      ),
      itemCount: categoryEmoji.emoji.length,
      itemBuilder: (context, index) {
        // Apply a remembered/default skin tone for display and selection.
        // Falls back to the base glyph when no tone is configured.
        final displayEmoji = _utils.applyDisplaySkinTone(
          categoryEmoji.emoji[index],
          widget.config.skinToneConfig,
          _rememberedSkinTone,
        );
        return addSkinToneTargetIfAvailable(
          hasSkinTone: displayEmoji.hasSkinTone,
          linkKey: categoryEmoji.category.name + displayEmoji.emoji,
          child: EmojiCell.fromConfig(
            emoji: displayEmoji,
            emojiSize: emojiSize,
            emojiBoxSize: emojiBoxSize,
            categoryEmoji: categoryEmoji,
            onEmojiSelected: _onSkinTonedEmojiSelected,
            onSkinToneDialogRequested: _openSkinToneDialog,
            config: widget.config,
          ),
        );
      },
    );
  }

  /// Build Widget for when no recent emoji are available
  Widget _buildNoRecent() {
    return Center(child: widget.config.emojiViewConfig.noRecents);
  }

  void _openSkinToneDialog(
    Offset emojiBoxPosition,
    Emoji emoji,
    double emojiSize,
    CategoryEmoji? categoryEmoji,
  ) {
    closeSkinToneOverlay();
    if (!emoji.hasSkinTone || !widget.config.skinToneConfig.enabled) {
      return;
    }
    showSkinToneOverlay(
      emojiBoxPosition,
      emoji,
      emojiSize,
      categoryEmoji,
      widget.config,
      _onSkinTonedEmojiSelected,
      links[categoryEmoji!.category.name + emoji.emoji]!,
    );
  }

  void _onSkinTonedEmojiSelected(Category? category, Emoji emoji) {
    _rememberSkinToneIfEnabled(emoji);
    widget.state.onEmojiSelected(category, emoji);
    closeSkinToneOverlay();
  }

  /// Persists and re-applies the skin tone of the selected [emoji] when
  /// [SkinToneConfig.rememberSkinTone] is enabled. Selecting a
  /// skin-tone-capable base glyph (no modifier) clears the remembered tone.
  void _rememberSkinToneIfEnabled(Emoji emoji) {
    if (!widget.config.skinToneConfig.rememberSkinTone || !emoji.hasSkinTone) {
      return;
    }
    final tone = _utils.extractSkinTone(emoji);
    if (tone == _rememberedSkinTone) {
      return;
    }
    _utils.setRememberedSkinTone(tone);
    setState(() => _rememberedSkinTone = tone);
  }
}
