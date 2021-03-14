import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/Config.dart';
import 'package:emoji_picker_flutter/src/Emoji.dart';
import 'package:emoji_picker_flutter/src/EmojiPickerBuilder.dart';
import 'package:emoji_picker_flutter/src/EmojiViewState.dart';
import 'package:flutter/material.dart';

class DefaultEmojiPickerView extends EmojiPickerBuilder {
  DefaultEmojiPickerView(Config config, EmojiViewState state)
      : super(config, state);

  @override
  _DefaultEmojiPickerViewState createState() => _DefaultEmojiPickerViewState();
}

class _DefaultEmojiPickerViewState extends State<DefaultEmojiPickerView> {
  final PageController _pageController = PageController();

  int selectedCategory;

  @override
  void initState() {
    selectedCategory = widget.state.categoryEmoji.indexWhere(
        (element) => element.category == widget.config.initCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final emojiSize = widget.config.getEmojiSize(constraints.maxWidth);

        return Column(
          children: [
            Container(
              height: 50,
              color: Colors.grey[200],
              child: Row(
                  children: widget.state.categoryEmoji
                      .asMap()
                      .entries
                      .map<Widget>((item) =>
                          _buildCategory(item.key, item.value.category))
                      .toList()),
            ),
            Flexible(
              child: PageView.builder(
                itemCount: widget.state.categoryEmoji.length,
                controller: _pageController,
                onPageChanged: (index) {},
                itemBuilder: (context, index) => _buildPage(
                    emojiSize, widget.state.categoryEmoji[index].emoji),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategory(int index, Category category) {
    return Expanded(
      flex: 1,
      child: Container(
        color: selectedCategory == index
            ? widget.config.indicatorColor
            : Colors.transparent,
        child: Center(
          child: TextButton(
              onPressed: () {
                setState(() {
                  selectedCategory = index;
                  _pageController.jumpToPage(index);
                });
              },
              child: Icon(widget.config.getIconForCategory(category).icon)),
        ),
      ),
    );
  }

  Widget _buildPage(double emojiSize, List<Emoji> emoji) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      crossAxisCount: widget.config.columns,
      mainAxisSpacing: widget.config.verticalSpacing,
      crossAxisSpacing: widget.config.horizontalSpacing,
      children: emoji
          .map<Widget>((item) => SizedBox(
                width: emojiSize,
                height: emojiSize,
                child: TextButton(
                    onPressed: () {
                      widget.state.onEmojiSelected(
                          widget.state.categoryEmoji[0].category, item);
                    },
                    child: Center(
                      child: Text(item.emoji,
                          style: TextStyle(fontSize: emojiSize - 8)),
                    )),
              ))
          .toList(),
    );
  }
}
