import 'package:flutter/material.dart';

/// Callback function for custom search view
typedef SearchViewBuilder = Widget Function(
  SearchViewConfig config,
  VoidCallback showEmojiView,
);

/// Search view Config
class SearchViewConfig {
  /// Constructor
  const SearchViewConfig({
    this.backgroundColor = Colors.blue,
    this.buttonColor = Colors.blue,
    this.buttonIconColor = Colors.white,
    this.customSearchView,
  });

  /// Background color of search bar
  final Color? backgroundColor;

  /// Search Button color
  final Color buttonColor;

  /// Search Button Icon color
  final Color buttonIconColor;

  /// Custom search bar
  final SearchViewBuilder? customSearchView;

  @override
  bool operator ==(other) {
    return (other is SearchViewConfig) &&
        other.backgroundColor == backgroundColor &&
        other.buttonColor == buttonColor &&
        other.buttonIconColor == buttonIconColor &&
        other.customSearchView == customSearchView;
  }

  @override
  int get hashCode =>
      backgroundColor.hashCode ^
      buttonColor.hashCode ^
      buttonIconColor.hashCode ^
      customSearchView.hashCode;
}
