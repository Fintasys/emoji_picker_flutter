import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Callback function for custom bottom action bar
typedef BottomActionBarBuilder = Widget Function(
  Config config,
  EmojiViewState state,
  VoidCallback showSearchView,
);

/// Bottom Action Bar Config
class BottomActionBarConfig {
  /// Constructor
  const BottomActionBarConfig({
    this.enabled = true,
    this.showBackspaceButton = true,
    this.backgroundColor = Colors.blue,
    this.buttonColor = Colors.blue,
    this.buttonIconColor = Colors.white,
    this.customBottomActionBar,
  });

  /// Enable Bottom Action Bar
  final bool enabled;

  /// Show Backspace button
  final bool showBackspaceButton;

  /// Background color of search bar
  final Color? backgroundColor;

  /// Search Button color
  final Color buttonColor;

  /// Search Button Icon color
  final Color buttonIconColor;

  /// Custom search bar
  /// Hot reload is not supported
  final BottomActionBarBuilder? customBottomActionBar;

  @override
  bool operator ==(other) {
    return (other is BottomActionBarConfig) &&
        other.enabled == enabled &&
        other.showBackspaceButton == showBackspaceButton &&
        other.backgroundColor == backgroundColor &&
        other.buttonColor == buttonColor &&
        other.buttonIconColor == buttonIconColor;
  }

  @override
  int get hashCode =>
      enabled.hashCode ^
      showBackspaceButton.hashCode ^
      backgroundColor.hashCode ^
      buttonColor.hashCode ^
      buttonIconColor.hashCode;
}
