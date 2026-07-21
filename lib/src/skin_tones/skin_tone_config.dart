import 'package:flutter/material.dart';

/// Skin tone config Config
class SkinToneConfig {
  /// Constructor
  const SkinToneConfig({
    this.enabled = true,
    this.dialogBackgroundColor = Colors.white,
    this.indicatorColor = Colors.grey,
    this.rememberSkinTone = false,
  });

  /// Enable feature to select a skin tone of certain emoji's
  final bool enabled;

  /// The background color of the skin tone dialog
  final Color dialogBackgroundColor;

  /// Color of the small triangle next to multiple skin tone emoji
  final Color indicatorColor;

  /// Remember the last skin tone the user selected.
  ///
  /// When `true`, the tone chosen via the long-press picker is persisted (in
  /// `SharedPreferences`) and re-applied as the default for every
  /// skin-tone-capable emoji in the grid, recents and search on the next
  /// launch. Selecting the base (no-tone) glyph clears the remembered tone.
  ///
  /// When `false` (default) the base glyph is always shown, which is the
  /// previous behavior.
  final bool rememberSkinTone;

  @override
  bool operator ==(other) {
    return (other is SkinToneConfig) &&
        other.enabled == enabled &&
        other.dialogBackgroundColor == dialogBackgroundColor &&
        other.indicatorColor == indicatorColor &&
        other.rememberSkinTone == rememberSkinTone;
  }

  @override
  int get hashCode =>
      enabled.hashCode ^
      dialogBackgroundColor.hashCode ^
      indicatorColor.hashCode ^
      rememberSkinTone.hashCode;
}
