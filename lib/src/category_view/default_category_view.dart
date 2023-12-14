import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/skin_tones/skin_tone_overlay.dart';
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
  _DefaultCategoryViewState createState() => _DefaultCategoryViewState();
}

class _DefaultCategoryViewState extends State<DefaultCategoryView>
    with SkinToneOverlayStateMixin {
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
                  (item) => _buildCategory(item.key, item.value.category))
              .toList(),
        ),
      );

  Widget _buildBackspaceButton() {
    if (widget.state.onBackspacePressed != null) {
      return Material(
        type: MaterialType.transparency,
        child: IconButton(
            padding: const EdgeInsets.only(bottom: 2),
            icon: Icon(
              Icons.backspace,
              color: widget.config.categoryViewConfig.backspaceColor,
            ),
            onPressed: () {
              widget.state.onBackspacePressed!();
            }),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildCategory(int index, Category category) {
    return Tab(
      icon: Icon(
        getIconForCategory(
            widget.config.categoryViewConfig.categoryIcons, category),
      ),
    );
  }
}
