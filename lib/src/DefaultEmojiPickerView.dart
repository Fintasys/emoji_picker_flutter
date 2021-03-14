import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/CategoryEmoji.dart';
import 'package:emoji_picker_flutter/src/Config.dart';
import 'package:emoji_picker_flutter/src/EmojiPickerBuilder.dart';
import 'package:emoji_picker_flutter/src/EmojiViewState.dart';
import 'package:flutter/material.dart';

class DefaultEmojiPickerView extends EmojiPickerBuilder {
  DefaultEmojiPickerView(Config config, EmojiViewState state)
      : super(config, state);

  @override
  _DefaultEmojiPickerViewState createState() => _DefaultEmojiPickerViewState();
}

class _DefaultEmojiPickerViewState extends State<DefaultEmojiPickerView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = new PageController();
  TabController _tabController;

  @override
  void initState() {
    int selectedCategory = widget.state.categoryEmoji.indexWhere(
        (element) => element.category == widget.config.initCategory);
    _tabController = new TabController(
        initialIndex: selectedCategory,
        length: widget.state.categoryEmoji.length,
        vsync: this);
    super.initState();
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
              TabBar(
                labelColor: widget.config.iconColorSelected,
                indicatorColor: widget.config.indicatorColor,
                unselectedLabelColor: widget.config.iconColor,
                controller: _tabController,
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
                tabs: widget.state.categoryEmoji
                    .asMap()
                    .entries
                    .map<Widget>(
                        (item) => _buildCategory(item.key, item.value.category))
                    .toList(),
              ),
              Flexible(
                child: PageView.builder(
                  itemCount: widget.state.categoryEmoji.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController.animateTo(index);
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
    return GridView.count(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      crossAxisCount: widget.config.columns,
      mainAxisSpacing: widget.config.verticalSpacing,
      crossAxisSpacing: widget.config.horizontalSpacing,
      children: categoryEmoji.emoji
          .map<Widget>((item) => SizedBox(
                width: emojiSize,
                height: emojiSize,
                child: TextButton(
                    onPressed: () {
                      widget.state
                          .onEmojiSelected(categoryEmoji.category, item);
                    },
                    child: Center(
                      child: Text(item.emoji,
                          style: TextStyle(fontSize: emojiSize)),
                    )),
              ))
          .toList(),
    );
  }
}
