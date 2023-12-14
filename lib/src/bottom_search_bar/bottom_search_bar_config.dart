import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Callback function for custom bottom search bar
typedef BottomSearchBarBuilder = Widget Function(
  Config config,
  VoidCallback showSearchView,
);

/// Search Bar Config
class BottomSearchBarConfig {
  /// Constructor
  const BottomSearchBarConfig({
    this.backgroundColor = Colors.blue,
    this.buttonColor = Colors.blue,
    this.buttonIconColor = Colors.white,
    this.customBottomSearchBar,
  });

  /// Background color of search bar
  final Color? backgroundColor;

  /// Search Button color
  final Color buttonColor;

  /// Search Button Icon color
  final Color buttonIconColor;

  /// Custom search bar
  final BottomSearchBarBuilder? customBottomSearchBar;

  @override
  bool operator ==(other) {
    return (other is BottomSearchBarConfig) &&
        other.backgroundColor == backgroundColor &&
        other.buttonColor == buttonColor &&
        other.buttonIconColor == buttonIconColor &&
        other.customBottomSearchBar == customBottomSearchBar;
  }

  @override
  int get hashCode =>
      backgroundColor.hashCode ^
      buttonColor.hashCode ^
      buttonIconColor.hashCode ^
      customBottomSearchBar.hashCode;
}
