import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/skin_tone_overlay.dart';
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
    with SingleTickerProviderStateMixin, SkinToneOverlayStateMixin {
  final double _tabBarHeight = 46;
  Timer? _onBackspacePressedCallbackTimer;

  late PageController _pageController;
  late TabController _tabController;
  late final _scrollController = ScrollController();

  late final _utils = EmojiPickerUtils();

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
      ..addListener(closeSkinToneOverlay);
    _scrollController.addListener(closeSkinToneOverlay);
    super.initState();
  }

  @override
  void dispose() {
    closeSkinToneOverlay();
    _pageController.dispose();
    _tabController.dispose();
    _scrollController.dispose();
    _onBackspacePressedCallbackTimer?.cancel();
    super.dispose();
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
                    child: _buildTabBar(context),
                  ),
                  _buildBackspaceButton(),
                ],
              ),
              Flexible(
                child: PageView.builder(
                  itemCount: widget.state.categoryEmoji.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController.animateTo(
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

  Widget _buildTabBar(BuildContext context) => SizedBox(
        height: _tabBarHeight,
        child: TabBar(
          labelColor: widget.config.iconColorSelected,
          indicatorColor: widget.config.indicatorColor,
          unselectedLabelColor: widget.config.iconColor,
          controller: _tabController,
          labelPadding: EdgeInsets.zero,
          onTap: (index) {
            closeSkinToneOverlay();
            _pageController.jumpToPage(index);
          },
          tabs: widget.state.categoryEmoji
              .asMap()
              .entries
              .map<Widget>(
                  (item) => _buildCategory(item.key, item.value.category))
              .toList(),
        ),
      );

  Widget _buildBackspaceButton() {
    if (widget.state.onBackspacePressed != null) {
      return Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onLongPressStart: (_) => _startOnBackspacePressedCallback(),
          onLongPressEnd: (_) => _stopOnBackspacePressedCallback(),
          child: IconButton(
            padding: const EdgeInsets.only(bottom: 2),
            icon: Icon(
              Icons.backspace,
              color: widget.config.backspaceColor,
            ),
            onPressed: () => widget.state.onBackspacePressed!(),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
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
      onTap: closeSkinToneOverlay,
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
                  closeSkinToneOverlay();
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

  void _openSkinToneDialog(
    Emoji emoji,
    double emojiSize,
    CategoryEmoji? categoryEmoji,
    int index,
  ) {
    closeSkinToneOverlay();
    if (!emoji.hasSkinTone || !widget.config.enableSkinTones) {
      return;
    }
    showSkinToneOverlay(
        emoji,
        emojiSize,
        categoryEmoji,
        index,
        kSkinToneCount,
        widget.config,
        _scrollController.offset,
        _tabBarHeight,
        _utils,
        _onSkinTonedEmojiSelected);
  }

  void _onSkinTonedEmojiSelected(Category? category, Emoji emoji) {
    widget.state.onEmojiSelected(category, emoji);
    closeSkinToneOverlay();
  }

  /// Start the callback for long-pressing the backspace button.
  void _startOnBackspacePressedCallback() {
    // Initial callback interval for short presses
    var callbackInterval = const Duration(milliseconds: 75);
    var millisecondsSincePressed = 0;

    // Callback function executed on each timer tick
    void _callback(Timer timer) {
      // Accumulate elapsed time since the last tick
      millisecondsSincePressed += callbackInterval.inMilliseconds;

      // If the long-press duration exceeds 3 seconds
      if (millisecondsSincePressed > 3000 &&
          callbackInterval == const Duration(milliseconds: 75)) {
        // Switch to a longer callback interval for word-by-word deletion
        callbackInterval = const Duration(milliseconds: 300);

        // Restart the timer with the updated interval
        _onBackspacePressedCallbackTimer?.cancel();
        _onBackspacePressedCallbackTimer =
            Timer.periodic(callbackInterval, _callback);

        // Reset the elapsed time for the new interval
        millisecondsSincePressed = 0;
      }

      // Trigger the appropriate callback based on the interval
      if (callbackInterval == const Duration(milliseconds: 75)) {
        widget.state.onBackspacePressed!(); // Short-press callback
      } else {
        widget.state.onBackspaceLongPressed(); // Long-press callback
      }
    }

    // Start the initial timer with the short-press interval
    _onBackspacePressedCallbackTimer =
        Timer.periodic(callbackInterval, _callback);
  }

  /// Stop the callback for long-pressing the backspace button.
  void _stopOnBackspacePressedCallback() {
    // Cancel the active timer
    _onBackspacePressedCallbackTimer?.cancel();
  }
}
