import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/category_icons.dart';
import 'package:flutter/material.dart';

class Config {
  /// Number of emojis per row
  final int columns;

  /// Width and height the emoji will be maximal displayed
  /// Can be smaller due to screen size and amount of columns
  final double emojiSizeMax;

  /// Verical spacing between emojis
  final double verticalSpacing;

  /// Horizontal spacing between emojis
  final double horizontalSpacing;

  /// The initial [Category] that will be selected
  /// This [Category] will have its button in the bottombar darkened
  final Category initCategory;

  /// The background color of the Widget
  final Color bgColor;

  /// The color of the category indicator
  final Color indicatorColor;

  /// The color of the category icons
  final Color iconColor;

  /// The color of the category icon when selected
  final Color iconColorSelected;

  /// The color of the loading indicator during initalization
  final Color progressIndicatorColor;

  /// Show extra tab with recently used emoji
  final bool showRecentsTab;

  /// Limit of recently used emoji that will be saved
  final int recentsLimit;

  /// The text to be displayed if no recent emojis to display
  final String noRecentsText;

  /// The text style for [noRecentsText]
  final TextStyle noRecentsStyle;

  /// Determines the icon to display for each [Category]
  final CategoryIcons categoryIcons;

  /// Change between Material and Cupertino button style
  final ButtonMode buttonMode;

  const Config(
      {this.columns = 7,
      this.emojiSizeMax = 32.0,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.initCategory = Category.RECENT,
      this.bgColor = const Color(0xFFEBEFF2),
      this.indicatorColor = Colors.blue,
      this.iconColor = Colors.grey,
      this.iconColorSelected = Colors.blue,
      this.progressIndicatorColor = Colors.blue,
      this.showRecentsTab = true,
      this.recentsLimit = 28,
      this.noRecentsText = "No Recents",
      this.noRecentsStyle =
          const TextStyle(fontSize: 20, color: Colors.black26),
      this.categoryIcons = const CategoryIcons(),
      this.buttonMode = ButtonMode.MATERIAL});

  double getEmojiSize(double width) {
    final maxSize = width / this.columns;
    return min(maxSize, this.emojiSizeMax);
  }

  IconData getIconForCategory(Category category) {
    switch (category) {
      case Category.RECENT:
        return this.categoryIcons.recentIcon;
      case Category.SMILEYS:
        return this.categoryIcons.smileyIcon;
      case Category.ANIMALS:
        return this.categoryIcons.animalIcon;
      case Category.FOODS:
        return this.categoryIcons.foodIcon;
      case Category.TRAVEL:
        return this.categoryIcons.travelIcon;
      case Category.ACTIVITIES:
        return this.categoryIcons.activityIcon;
      case Category.OBJECTS:
        return this.categoryIcons.objectIcon;
      case Category.SYMBOLS:
        return this.categoryIcons.symbolIcon;
      case Category.FLAGS:
        return this.categoryIcons.flagIcon;
      default:
        throw Exception("Unsupported Category");
    }
  }
}
