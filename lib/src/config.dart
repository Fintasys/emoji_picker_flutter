import 'package:emoji_picker_flutter/src/bottom_search_bar/bottom_search_bar_config.dart';
import 'package:emoji_picker_flutter/src/category_view/category_emoji.dart';
import 'package:emoji_picker_flutter/src/category_view/category_view_config.dart';
import 'package:emoji_picker_flutter/src/emoji_view/emoji_view_config.dart';
import 'package:emoji_picker_flutter/src/emoji_view/skin_tone_config.dart';
import 'package:emoji_picker_flutter/src/search_view/search_view_config.dart';
import 'package:flutter/material.dart';

/// Number of skin tone icons
const kSkinToneCount = 6;

/// Default Widget if no recent is available
const DefaultNoRecentsWidget = Text(
  'No Recents',
  style: TextStyle(fontSize: 20, color: Colors.black26),
  textAlign: TextAlign.center,
);

/// Config for customizations
class Config {
  /// Constructor
  const Config({
    this.height = 252,
    this.bgColor = const Color(0xFFEBEFF2),
    this.checkPlatformCompatibility = true,
    this.emojiSet,
    this.emojiTextStyle,
    this.customSkinColorOverlayHorizontalOffset,
    this.emojiViewConfig = const EmojiViewConfig(),
    this.skinToneConfig = const SkinToneConfig(),
    this.categoryViewConfig = const CategoryViewConfig(),
    this.bottomSearchBarConfig = const BottomSearchBarConfig(),
    this.searchViewConfig = const SearchViewConfig(),
  });

  /// Max Height of the Emoji's view
  final double height;

  /// The background color of the Widget
  final Color bgColor;

  /// Verify that emoji glyph is supported by the platform (Android only)
  final bool checkPlatformCompatibility;

  /// Custom emojis; if set, overrides default emojis provided by the library
  final List<CategoryEmoji>? emojiSet;

  /// Custom emoji text style to apply to emoji characters in the grid
  ///
  /// If you define a custom fontFamily or use GoogleFonts to set this property
  /// be sure to set [checkPlatformCompatibility] to false. It will improve
  /// initalization performance and prevent technically supported glyphs from
  /// being filtered out.
  final TextStyle? emojiTextStyle;

  /// Customize skin color overlay horizontal offset in case of ShellRoute or
  /// other cases, when EmojiPicker is not aligned to the left border of the
  /// screen.
  /// Reference: https://github.com/Fintasys/emoji_picker_flutter/issues/148
  final double? customSkinColorOverlayHorizontalOffset;

  /// Category view config
  final CategoryViewConfig categoryViewConfig;

  /// Emoji view config
  final EmojiViewConfig emojiViewConfig;

  /// Skin tone config
  final SkinToneConfig skinToneConfig;

  /// Search bar config
  final BottomSearchBarConfig bottomSearchBarConfig;

  /// Search View config
  final SearchViewConfig searchViewConfig;

  @override
  bool operator ==(other) {
    return (other is Config) &&
        other.bgColor == bgColor &&
        other.checkPlatformCompatibility == checkPlatformCompatibility &&
        other.emojiSet == emojiSet &&
        other.emojiTextStyle == emojiTextStyle &&
        other.customSkinColorOverlayHorizontalOffset ==
            customSkinColorOverlayHorizontalOffset &&
        other.emojiViewConfig == emojiViewConfig &&
        other.skinToneConfig == skinToneConfig &&
        other.bottomSearchBarConfig == bottomSearchBarConfig &&
        other.searchViewConfig == searchViewConfig;
  }

  @override
  int get hashCode =>
      bgColor.hashCode ^
      checkPlatformCompatibility.hashCode ^
      (emojiSet?.hashCode ?? 0) ^
      (emojiTextStyle?.hashCode ?? 0) ^
      (customSkinColorOverlayHorizontalOffset?.hashCode ?? 0) ^
      categoryViewConfig.hashCode ^
      emojiViewConfig.hashCode ^
      skinToneConfig.hashCode ^
      bottomSearchBarConfig.hashCode ^
      searchViewConfig.hashCode;
}
