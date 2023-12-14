import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Backspace Button Widget
class BackspaceButton extends StatelessWidget {
  /// Constructor
  const BackspaceButton(this.config, this.onBackspacePressed, this.iconColor,
      {super.key});

  /// Config
  final Config config;

  /// Backspace callback
  final Function? onBackspacePressed;

  /// Backspace Icon color
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
          padding: const EdgeInsets.only(bottom: 2),
          icon: Icon(
            Icons.backspace,
            color: iconColor,
          ),
          onPressed: () {
            onBackspacePressed?.call();
          }),
    );
  }
}
