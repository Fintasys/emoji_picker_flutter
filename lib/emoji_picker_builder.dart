import 'package:emoji_picker_flutter/src/config.dart';
import 'package:emoji_picker_flutter/src/emoji_view_state.dart';
import 'package:flutter/material.dart';

abstract class EmojiPickerBuilder extends StatefulWidget {
  final Config config;
  final EmojiViewState state;
  EmojiPickerBuilder(this.config, this.state);
}
