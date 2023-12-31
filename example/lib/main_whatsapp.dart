import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late EmojiTextEditingController _controller;
  late ScrollController _scrollController;
  late TextStyle _textStyle;
  bool _emojiShowing = false;
  final _fontSize = 24.0;

  @override
  void initState() {
    // Define Custom Emoji Font & Text Style
    _textStyle = emojiTextStyle.copyWith(
      fontFamily: GoogleFonts.notoColorEmoji().fontFamily,
      fontSize: _fontSize,
    );

    _controller = EmojiTextEditingController(emojiStyle: _textStyle);
    _scrollController = ScrollController();

    super.initState();
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
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
          body: Stack(
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
                          return Text(
                            _controller.text,
                            style: _textStyle,
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
                      onBackspacePressed: _onBackspacePressed,
                      config: Config(
                        height: 256,
                        checkPlatformCompatibility: true,
                        emojiTextStyle: _textStyle,
                        emojiViewConfig: EmojiViewConfig(
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: _fontSize *
                              (foundation.defaultTargetPlatform ==
                                      TargetPlatform.iOS
                                  ? 1.30
                                  : 1.0),
                          backgroundColor: Colors.white,
                        ),
                        swapCategoryAndBottomBar: true,
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
    Config config,
    EmojiViewState state,
    TabController tabController,
    PageController pageController, {
    Key? key,
  }) : super(config, state, tabController, pageController, key: key);

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
          labelPadding: const EdgeInsets.only(top: 1.0),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black12,
          ),
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

  Widget _buildCategory(int index, Category category) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          getIconForCategory(
            widget.config.categoryViewConfig.categoryIcons,
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
  const WhatsAppSearchView(
      Config config, EmojiViewState state, VoidCallback showEmojiView,
      {super.key})
      : super(config, state, showEmojiView);

  @override
  WhatsAppSearchViewState createState() => WhatsAppSearchViewState();
}

class WhatsAppSearchViewState extends State<WhatsAppSearchView>
    with SkinToneOverlayStateMixin {
  final FocusNode _focusNode = FocusNode();
  final EmojiPickerUtils _utils = EmojiPickerUtils();
  List<Emoji> _results = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Auto focus textfield
      FocusScope.of(context).requestFocus(_focusNode);
      // Load recent emojis initially
      _utils.getRecentEmojis().then(
            (value) => setState(
              () {
                _results = value.map((e) => e.emoji).toList();
              },
            ),
          );
    });
    super.initState();
  }

  void _onTextInputChanged(String text) {
    _utils.searchEmoji(text, widget.state.categoryEmoji).then(
          (value) => setState(
            () {
              _results = value;
            },
          ),
        );
  }

  EmojiCell _buildEmoji(Emoji emoji, double emojiSize) {
    return EmojiCell.fromConfig(
      emoji: emoji,
      emojiSize: emojiSize,
      onEmojiSelected: widget.state.onEmojiSelected,
      config: widget.config,
      onSkinToneDialogRequested: (emoji, emojiSize, category, index) {
        closeSkinToneOverlay();
        if (!emoji.hasSkinTone || !widget.config.skinToneConfig.enabled) {
          return;
        }
        showSkinToneOverlay(
          emoji,
          emojiSize,
          null,
          index,
          widget.config,
          0.0,
          0.0,
          _onSkinTonedEmojiSelected,
        );
      },
    );
  }

  void _onSkinTonedEmojiSelected(Category? category, Emoji emoji) {
    widget.state.onEmojiSelected(category, emoji);
    closeSkinToneOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final emojiSize =
          widget.config.emojiViewConfig.getEmojiSize(constraints.maxWidth);
      return Container(
        color: widget.config.searchViewConfig.backgroundColor,
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: emojiSize + 8,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: _results.length,
                separatorBuilder: (context, _) {
                  return const SizedBox(width: 8.0);
                },
                itemBuilder: (context, index) {
                  return _buildEmoji(_results[index], emojiSize);
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: widget.showEmojiView,
                  color: widget.config.searchViewConfig.buttonColor,
                  icon: Icon(
                    Icons.arrow_back,
                    color: widget.config.searchViewConfig.buttonIconColor,
                    size: 20.0,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: _onTextInputChanged,
                    focusNode: _focusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
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
