import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Example for EmojiPicker with EmojiPickerController
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  // Create the emoji picker controller
  late final EmojiPickerController _emojiController;

  bool _emojiShowing = false;
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();

    // Initialize with SMILEYS category
    _emojiController = EmojiPickerController(initialCategory: Category.SMILEYS);

    // Listen to category changes
    _emojiController.addListener(_onCategoryChanged);
  }

  void _onCategoryChanged() {
    // This gets called whenever the category changes
    // (either from user interaction or programmatic changes)
    if (foundation.kDebugMode) {
      debugPrint(
          'Category changed to: ${_emojiController.currentCategory.name}');
    }

    // You can perform any additional logic here
    setState(() {}); // Update UI to show current category
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EmojiPicker Controller Example'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isDarkTheme = !_isDarkTheme;
                  // Note: The selected category persists through theme changes!
                });
              },
              icon: Icon(_isDarkTheme ? Icons.light_mode : Icons.dark_mode),
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Category controls section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Current Category: ${_emojiController.currentCategory.name.toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Category control buttons
                    Wrap(
                      spacing: 8,
                      children: [
                        _buildCategoryButton('Recent', Category.RECENT),
                        _buildCategoryButton('Smileys', Category.SMILEYS),
                        _buildCategoryButton('Animals', Category.ANIMALS),
                        _buildCategoryButton('Foods', Category.FOODS),
                        _buildCategoryButton('Travel', Category.TRAVEL),
                        _buildCategoryButton('Activities', Category.ACTIVITIES),
                        _buildCategoryButton('Objects', Category.OBJECTS),
                        _buildCategoryButton('Symbols', Category.SYMBOLS),
                        _buildCategoryButton('Flags', Category.FLAGS),
                      ],
                    ),
                  ],
                ),
              ),

              // Display selected emojis
              Expanded(
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _textController,
                    builder: (context, text, child) {
                      return Text(
                        _textController.text.isEmpty
                            ? 'Select some emojis!'
                            : _textController.text,
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
              ),

              // Text input area
              Container(
                height: 66.0,
                color: _isDarkTheme ? Colors.grey[800] : Colors.blue,
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _emojiShowing = !_emojiShowing;
                          });
                        },
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _textController,
                          scrollController: _scrollController,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                              left: 16.0,
                              bottom: 8.0,
                              top: 8.0,
                              right: 16.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        tooltip: 'Clear',
                      ),
                    ),
                  ],
                ),
              ),

              // Emoji picker
              Offstage(
                offstage: !_emojiShowing,
                child: EmojiPicker(
                  textEditingController: _textController,
                  scrollController: _scrollController,
                  // Use the controller instead of onCategoryChanged callback
                  controller: _emojiController,
                  config: Config(
                    height: 256,
                    checkPlatformCompatibility: true,
                    viewOrderConfig: const ViewOrderConfig(),
                    emojiViewConfig: EmojiViewConfig(
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 28 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.2
                              : 1.0),
                      backgroundColor:
                          _isDarkTheme ? Colors.grey[900]! : Colors.white,
                    ),
                    skinToneConfig: const SkinToneConfig(),
                    categoryViewConfig: CategoryViewConfig(
                      backgroundColor: _isDarkTheme
                          ? Colors.grey[800]!
                          : const Color(0xFFEBEFF2),
                      iconColor: _isDarkTheme ? Colors.white70 : Colors.grey,
                      iconColorSelected:
                          _isDarkTheme ? Colors.white : Colors.blue,
                      indicatorColor: _isDarkTheme ? Colors.white : Colors.blue,
                    ),
                    bottomActionBarConfig: const BottomActionBarConfig(),
                    searchViewConfig: const SearchViewConfig(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label, Category category) {
    final isSelected = _emojiController.currentCategory == category;

    return ElevatedButton(
      onPressed: () {
        // Programmatically change category using the controller
        _emojiController.setCategory(category);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? (_isDarkTheme ? Colors.white : Colors.blue)
            : (_isDarkTheme ? Colors.grey[700] : Colors.grey[300]),
        foregroundColor: isSelected
            ? (_isDarkTheme ? Colors.black : Colors.white)
            : (_isDarkTheme ? Colors.white : Colors.black),
      ),
      child: Text(label),
    );
  }

  @override
  void dispose() {
    _emojiController.removeListener(_onCategoryChanged);
    _emojiController.dispose();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
