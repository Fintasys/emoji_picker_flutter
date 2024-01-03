import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default category view
class DefaultCategoryView extends CategoryView {
  /// Constructor
  DefaultCategoryView(
    Config config,
    EmojiViewState state,
    TabController tabController,
    PageController pageController, {
    Key? key,
  }) : super(config, state, tabController, pageController, key: key);

  @override
  DefaultCategoryViewState createState() => DefaultCategoryViewState();
}

/// Default Category View State
class DefaultCategoryViewState extends CategoryViewState {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.config.categoryViewConfig.backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: _buildTabBar(context),
          ),
          _buildBackspaceButton(),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) => SizedBox(
        height: widget.config.categoryViewConfig.tabBarHeight,
        child: TabBar(
          labelColor: widget.config.categoryViewConfig.iconColorSelected,
          indicatorColor: widget.config.categoryViewConfig.indicatorColor,
          unselectedLabelColor: widget.config.categoryViewConfig.iconColor,
          dividerColor: widget.config.categoryViewConfig.dividerColor,
          controller: widget.tabController,
          labelPadding: EdgeInsets.zero,
          onTap: (index) {
            closeSkinToneOverlay();
            widget.pageController.jumpToPage(index);
          },
          tabs: widget.state.categoryEmoji
              .asMap()
              .entries
              .map<Widget>(
                  (item) => _buildCategoryTab(item.key, item.value.category))
              .toList(),
        ),
      );

  Widget _buildBackspaceButton() {
    if (widget.config.categoryViewConfig.showBackspaceButton) {
      return BackspaceButton(
        widget.config,
        widget.state.onBackspacePressed,
        widget.state.onBackspaceLongPressed,
        widget.config.categoryViewConfig.backspaceColor,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildCategoryTab(int index, Category category) {
    return Tab(
      icon: Icon(
        getIconForCategory(
            widget.config.categoryViewConfig.categoryIcons, category),
      ),
    );
  }
}
