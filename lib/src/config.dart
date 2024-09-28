import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Number of skin tone icons
const kSkinToneCount = 6;

/// Config for customizations
class Config {
  /// Constructor
  const Config({
    this.height = 256,
    this.checkPlatformCompatibility = true,
    this.emojiSet = defaultEmojiSet,
    this.emojiTextStyle,
    this.customBackspaceIcon,
    this.customSearchIcon,
    this.viewOrderConfig = const ViewOrderConfig(),
    this.emojiViewConfig = const EmojiViewConfig(),
    this.skinToneConfig = const SkinToneConfig(),
    this.categoryViewConfig = const CategoryViewConfig(),
    this.bottomActionBarConfig = const BottomActionBarConfig(),
    this.searchViewConfig = const SearchViewConfig(),
  });

  /// Max Height of the Emoji's view
  final double height;

  /// Verify that emoji glyph is supported by the platform (Android only)
  final bool checkPlatformCompatibility;

  /// Custom emojis; if set, overrides default emojis provided by the library
  final List<CategoryEmoji> emojiSet;

  /// Custom emoji text style to apply to emoji characters in the grid
  ///
  /// If you define a custom fontFamily or use GoogleFonts to set this property
  /// you can consider to set [checkPlatformCompatibility] to false. It will
  /// improve initalization performance and prevent technically supported glyphs
  /// from being filtered out.
  ///
  /// This has priority over [EmojiViewConfig.emojiSizeMax] if font size is set.
  final TextStyle? emojiTextStyle;

  ///  Custom backspace icon
  final Icon? customBackspaceIcon;

  /// Custom search icon
  final Icon? customSearchIcon;

  /// Config the order of the views displayed in the UI
  /// (category bar, emoji view, search bar)
  final ViewOrderConfig viewOrderConfig;

  /// Emoji view config
  final EmojiViewConfig emojiViewConfig;

  /// Skin tone config
  final SkinToneConfig skinToneConfig;

  /// Category view config
  final CategoryViewConfig categoryViewConfig;

  /// Search bar config
  final BottomActionBarConfig bottomActionBarConfig;

  /// Search View config
  final SearchViewConfig searchViewConfig;

  @override
  bool operator ==(other) {
    return (other is Config) &&
        other.viewOrderConfig == viewOrderConfig &&
        other.checkPlatformCompatibility == checkPlatformCompatibility &&
        other.emojiSet == emojiSet &&
        other.emojiTextStyle == emojiTextStyle &&
        other.customBackspaceIcon == customBackspaceIcon &&
        other.customSearchIcon == customSearchIcon &&
        other.emojiViewConfig == emojiViewConfig &&
        other.skinToneConfig == skinToneConfig &&
        other.bottomActionBarConfig == bottomActionBarConfig &&
        other.searchViewConfig == searchViewConfig;
  }

  @override
  int get hashCode =>
      viewOrderConfig.hashCode ^
      checkPlatformCompatibility.hashCode ^
      emojiSet.hashCode ^
      (emojiTextStyle?.hashCode ?? 0) ^
      customBackspaceIcon.hashCode ^
      customSearchIcon.hashCode ^
      categoryViewConfig.hashCode ^
      emojiViewConfig.hashCode ^
      skinToneConfig.hashCode ^
      bottomActionBarConfig.hashCode ^
      searchViewConfig.hashCode;
}
