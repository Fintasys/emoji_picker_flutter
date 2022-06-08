import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:flutter/material.dart';

/// Template class for custom implementation
/// Inhert this class to create your own EmojiPicker
abstract class EmojiPickerBuilder extends StatefulWidget {
  /// Constructor
  EmojiPickerBuilder(
    this.config,
    this.state, {
    Key? key,
  }) : super(key: key);

  /// Config for customizations
  final Config config;

  /// State that holds current emoji data
  final EmojiViewState state;
}
