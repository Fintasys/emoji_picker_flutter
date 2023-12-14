import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Template class for custom implementation
abstract class BottomSearchBar extends StatefulWidget {
  /// Constructor
  BottomSearchBar(
    this.config,
    this.showSearchView, {
    Key? key,
  }) : super(key: key);

  /// Config for customizations
  final Config config;

  /// Show Search Bar
  final VoidCallback showSearchView;
}
