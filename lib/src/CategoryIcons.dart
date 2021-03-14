import 'package:emoji_picker_flutter/src/CategoryIcon.dart';
import 'package:flutter/material.dart';

/// Class used to define all the [CategoryIcon] shown for each [Category]
///
/// This allows the keyboard to be personalized by changing icons shown.
/// If a [CategoryIcon] is set as null or not defined during initialization, the default icons will be used instead
class CategoryIcons {
  /// Icon for [Category.RECOMMENDED]
  final IconData recommendationIcon;

  /// Icon for [Category.RECENT]
  final IconData recentIcon;

  /// Icon for [Category.SMILEYS]
  final IconData smileyIcon;

  /// Icon for [Category.ANIMALS]
  final IconData animalIcon;

  /// Icon for [Category.FOODS]
  final IconData foodIcon;

  /// Icon for [Category.TRAVEL]
  final IconData travelIcon;

  /// Icon for [Category.ACTIVITIES]
  final IconData activityIcon;

  /// Icon for [Category.OBJECTS]
  final IconData objectIcon;

  /// Icon for [Category.SYMBOLS]
  final IconData symbolIcon;

  /// Icon for [Category.FLAGS]
  final IconData flagIcon;

  const CategoryIcons({
    this.recommendationIcon = Icons.search,
    this.recentIcon = Icons.access_time,
    this.smileyIcon = Icons.tag_faces,
    this.animalIcon = Icons.pets,
    this.foodIcon = Icons.fastfood,
    this.travelIcon = Icons.location_city,
    this.activityIcon = Icons.directions_run,
    this.objectIcon = Icons.lightbulb_outline,
    this.symbolIcon = Icons.euro_symbol,
    this.flagIcon = Icons.flag,
  });
}
