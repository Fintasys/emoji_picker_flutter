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
    this.backgroundColor = const Color(0xFFEBEFF2),
    this.buttonColor = Colors.transparent,
    this.buttonIconColor = Colors.black26,
    this.customSearchView,
  });

  /// Background color of search bar
  final Color backgroundColor;

  /// Fill color of hide search view button
  final Color buttonColor;

  /// Icon color of hide search view button
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
      buttonIconColor.hashCode ^
      customSearchView.hashCode;
}
