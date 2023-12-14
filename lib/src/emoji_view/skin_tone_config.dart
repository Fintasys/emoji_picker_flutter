import 'package:flutter/material.dart';

/// Emoji View Config
class SkinToneConfig {
  /// Constructor
  const SkinToneConfig({
    this.skinToneDialogBgColor = Colors.white,
    this.skinToneIndicatorColor = Colors.grey,
    this.enableSkinTones = true,
  });

  /// The background color of the skin tone dialog
  final Color skinToneDialogBgColor;

  /// Color of the small triangle next to multiple skin tone emoji
  final Color skinToneIndicatorColor;

  /// Enable feature to select a skin tone of certain emoji's
  final bool enableSkinTones;

  @override
  bool operator ==(other) {
    return (other is SkinToneConfig) &&
        other.skinToneDialogBgColor == skinToneDialogBgColor &&
        other.skinToneIndicatorColor == skinToneIndicatorColor &&
        other.enableSkinTones == enableSkinTones;
  }

  @override
  int get hashCode =>
      skinToneDialogBgColor.hashCode ^
      skinToneIndicatorColor.hashCode ^
      enableSkinTones.hashCode;
}
