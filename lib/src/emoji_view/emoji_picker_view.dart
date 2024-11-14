import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:flutter/material.dart';

/// Template class for custom implementation
/// Inhert this class to create your own EmojiPicker
abstract class EmojiPickerView extends StatefulWidget {
  /// Constructor
  const EmojiPickerView(
    this.config,
    this.state,
    this.showSearchBar, {
    super.key,
  });

  /// Config for customizations
  final Config config;

  /// State that holds current emoji data
  final EmojiViewState state;

  /// Show Search Bar
  final VoidCallback showSearchBar;
}
