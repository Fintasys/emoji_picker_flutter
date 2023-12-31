import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:flutter/material.dart';

/// Template class for custom implementation
/// Inhert this class to create your own search view
abstract class SearchView extends StatefulWidget {
  /// Constructor
  const SearchView(
    this.config,
    this.state,
    this.showEmojiView, {
    Key? key,
  }) : super(key: key);

  /// Config for customizations
  final Config config;

  /// State that holds current emoji data
  final EmojiViewState state;

  /// Return to emoji view
  final VoidCallback showEmojiView;
}
