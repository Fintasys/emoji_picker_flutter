import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/CategoryIcons.dart';
import 'package:flutter/material.dart';

/// Default values
const Color _defaultBgColor = Color.fromRGBO(242, 242, 242, 1);

class Config {
  /// Number of columns in keyboard grid
  final int columns;

  /// Number of rows in keyboard grid
  final int rows;

  /// Width and height the emoji will be maximal displayed
  /// Can be smaller due to screen size and amount of columns
  final double emojiSizeMax;

  /// Verical spacing between icons
  final double verticalSpacing;

  /// Horizontal spacing between icon
  final double horizontalSpacing;

  /// The initial [Category] that will be selected
  /// This [Category] will have its button in the bottombar darkened
  final Category initCategory;

  /// The background color of the keyboard
  final Color bgColor;

  /// The color of the category indicator
  final Color indicatorColor;

  /// The color the category icon
  final Color iconColor;

  /// The color of the category icon when selelected
  final Color iconColorSelected;

  /// The color of the loading indicator when icons get initalized
  final Color progressIndicatorColor;

  /// A list of keywords that are used to provide the user with recommended emojis in [Category.RECOMMENDED]
  final List<String> recommendKeywords;

  /// The maximum number of emojis to be recommended
  final int numRecommended;

  /// The string to be displayed if no recommendations found
  final String noRecommendationsText;

  /// The text style for the [noRecommendationsText]
  final TextStyle noRecommendationsStyle;

  /// The string to be displayed if no recent emojis to display
  final String noRecentsText;

  /// The text style for the [noRecentsText]
  final TextStyle noRecentsStyle;

  /// Determines the icon to display for each [Category]
  final CategoryIcons categoryIcons;

  /// Determines the style given to the keyboard keys
  final ButtonMode buttonMode;

  const Config(
      {this.columns = 7,
      this.rows = 3,
      this.emojiSizeMax = 32.0,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.initCategory,
      this.bgColor = _defaultBgColor,
      this.indicatorColor = Colors.blue,
      this.iconColor = Colors.blue,
      this.iconColorSelected = Colors.white,
      this.progressIndicatorColor = Colors.blue,
      this.recommendKeywords,
      this.numRecommended = 10,
      this.noRecommendationsText = "No Recommendations",
      this.noRecommendationsStyle =
          const TextStyle(fontSize: 20, color: Colors.black26),
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
