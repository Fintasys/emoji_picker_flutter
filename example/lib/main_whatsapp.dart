import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' as foundation;

const accentColor = Color(0xFF4BA586);
const accentColorDark = Color(0xFF377E6A);
const backgroundColor = Color(0xFFEEE7DF);
const secondaryColor = Color(0xFF8B98A0);
const systemBackgroundColor = Color(0xFFF7F8FA);

void main() {
  runApp(const MyApp());
}

/// Example for EmojiPicker with Google Emoji Fonts
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _utils = EmojiPickerUtils();
  late final EmojiTextEditingController _controller;
  late final ScrollController _scrollController;
  late final FocusNode _focusNode;
  late final TextStyle _textStyle;
  final bool isApple = [TargetPlatform.iOS, TargetPlatform.macOS]
      .contains(foundation.defaultTargetPlatform);
  bool _emojiShowing = false;

  @override
  void initState() {
    final fontSize = 24 * (isApple ? 1.2 : 1.0);
    // Define Custom Emoji Font & Text Style
    _textStyle = DefaultEmojiTextStyle.copyWith(
      fontFamily: GoogleFonts.notoColorEmoji().fontFamily,
      fontSize: fontSize,
    );

    _controller = EmojiTextEditingController(emojiTextStyle: _textStyle);
    _scrollController = ScrollController();
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: systemBackgroundColor,
        ),
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: accentColorDark,
            title: const Text(
              'Emoji Picker Example App',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Image.asset(
                  'assets/whatsapp_bg.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  opacity: const AlwaysStoppedAnimation(0.7),
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, text, child) {
                            return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                children: _utils.setEmojiTextStyle(
                                  _controller.text,
                                  emojiStyle: _textStyle,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 48.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 4.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _emojiShowing = !_emojiShowing;
                                        if (!_emojiShowing) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            _focusNode.requestFocus();
                                          });
                                        } else {
                                          _focusNode.unfocus();
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      _emojiShowing
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions_outlined,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _controller,
                                      scrollController: _scrollController,
                                      focusNode: _focusNode,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Type a message',
                                        hintStyle: TextStyle(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.normal),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            child: CircleAvatar(
                              backgroundColor: accentColor,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // send message
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: !_emojiShowing,
                      child: EmojiPicker(
                        textEditingController: _controller,
                        scrollController: _scrollController,
                        config: Config(
                          height: 256,
                          checkPlatformCompatibility: true,
                          viewOrderConfig: const ViewOrderConfig(
                            top: EmojiPickerItem.searchBar,
                            middle: EmojiPickerItem.emojiView,
                            bottom: EmojiPickerItem.categoryBar,
                          ),
                          emojiTextStyle: _textStyle,
                          emojiViewConfig: const EmojiViewConfig(
                            backgroundColor: Colors.white,
                          ),
                          skinToneConfig: const SkinToneConfig(),
                          categoryViewConfig: CategoryViewConfig(
                            backgroundColor: Colors.white,
                            dividerColor: Colors.white,
                            indicatorColor: accentColor,
                            iconColorSelected: Colors.black,
                            iconColor: secondaryColor,
                            customCategoryView: (
                              config,
                              state,
                              tabController,
                              pageController,
                            ) {
                              return WhatsAppCategoryView(
                                config,
                                state,
                                tabController,
                                pageController,
                              );
                            },
                            categoryIcons: const CategoryIcons(
                              recentIcon: Icons.access_time_outlined,
                              smileyIcon: Icons.emoji_emotions_outlined,
                              animalIcon: Icons.cruelty_free_outlined,
                              foodIcon: Icons.coffee_outlined,
                              activityIcon: Icons.sports_soccer_outlined,
                              travelIcon: Icons.directions_car_filled_outlined,
                              objectIcon: Icons.lightbulb_outline,
                              symbolIcon: Icons.emoji_symbols_outlined,
                              flagIcon: Icons.flag_outlined,
                            ),
                          ),
                          bottomActionBarConfig: const BottomActionBarConfig(
                            backgroundColor: Colors.white,
                            buttonColor: Colors.white,
                            buttonIconColor: secondaryColor,
                          ),
                          searchViewConfig: SearchViewConfig(
                            backgroundColor: Colors.white,
                            customSearchView: (
                              config,
                              state,
                              showEmojiView,
                            ) {
                              return WhatsAppSearchView(
                                config,
                                state,
                                showEmojiView,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// Customized Whatsapp category view
class WhatsAppCategoryView extends CategoryView {
  const WhatsAppCategoryView(
    super.config,
    super.state,
    super.tabController,
    super.pageController, {
    super.key,
  });

  @override
  WhatsAppCategoryViewState createState() => WhatsAppCategoryViewState();
}

class WhatsAppCategoryViewState extends State<WhatsAppCategoryView>
    with SkinToneOverlayStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.config.categoryViewConfig.backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: WhatsAppTabBar(
              widget.config,
              widget.tabController,
              widget.pageController,
              widget.state.categoryEmoji,
              closeSkinToneOverlay,
            ),
          ),
          _buildExtraTab(widget.config.categoryViewConfig.extraTab),
        ],
      ),
    );
  }

  Widget _buildExtraTab(extraTab) {
    if (extraTab == CategoryExtraTab.BACKSPACE) {
      return BackspaceButton(
        widget.config,
        widget.state.onBackspacePressed,
        widget.state.onBackspaceLongPressed,
        widget.config.categoryViewConfig.backspaceColor,
      );
    } else if (extraTab == CategoryExtraTab.SEARCH) {
      return SearchButton(
        widget.config,
        widget.state.onShowSearchView,
        widget.config.categoryViewConfig.iconColor,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class WhatsAppTabBar extends StatelessWidget {
  const WhatsAppTabBar(
    this.config,
    this.tabController,
    this.pageController,
    this.categoryEmojis,
    this.closeSkinToneOverlay, {
    super.key,
  });

  final Config config;

  final TabController tabController;

  final PageController pageController;

  final List<CategoryEmoji> categoryEmojis;

  final VoidCallback closeSkinToneOverlay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: config.categoryViewConfig.tabBarHeight,
      child: TabBar(
        labelColor: config.categoryViewConfig.iconColorSelected,
        indicatorColor: config.categoryViewConfig.indicatorColor,
        unselectedLabelColor: config.categoryViewConfig.iconColor,
        dividerColor: config.categoryViewConfig.dividerColor,
        controller: tabController,
        labelPadding: const EdgeInsets.only(top: 1.0),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black12,
        ),
        onTap: (index) {
          closeSkinToneOverlay();
          pageController.jumpToPage(index);
        },
        tabs: categoryEmojis
            .asMap()
            .entries
            .map<Widget>(
                (item) => _buildCategory(item.key, item.value.category))
            .toList(),
      ),
    );
  }

  Widget _buildCategory(int index, Category category) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          getIconForCategory(
            config.categoryViewConfig.categoryIcons,
            category,
          ),
          size: 20,
        ),
      ),
    );
  }
}

/// Custom Whatsapp Search view implementation
class WhatsAppSearchView extends SearchView {
  const WhatsAppSearchView(super.config, super.state, super.showEmojiView,
      {super.key});

  @override
  WhatsAppSearchViewState createState() => WhatsAppSearchViewState();
}

class WhatsAppSearchViewState extends SearchViewState {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final emojiSize =
          widget.config.emojiViewConfig.getEmojiSize(constraints.maxWidth);
      final emojiBoxSize =
          widget.config.emojiViewConfig.getEmojiBoxSize(constraints.maxWidth);
      return Container(
        color: widget.config.searchViewConfig.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: emojiBoxSize + 8.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                scrollDirection: Axis.horizontal,
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return buildEmoji(
                    results[index],
                    emojiSize,
                    emojiBoxSize,
                  );
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: widget.showEmojiView,
                  color: widget.config.searchViewConfig.buttonIconColor,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20.0,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: onTextInputChanged,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.config.searchViewConfig.hintText,
                      hintStyle: const TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
