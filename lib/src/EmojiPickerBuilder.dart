import 'package:emoji_picker_flutter/src/Config.dart';
import 'package:emoji_picker_flutter/src/EmojiViewState.dart';
import 'package:flutter/material.dart';

abstract class EmojiPickerBuilder extends StatefulWidget {
  final Config config;
  final EmojiViewState state;
  EmojiPickerBuilder(this.config, this.state);
}
