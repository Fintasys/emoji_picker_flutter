import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default Bottom Action Bar implementation
class DefaultBottomActionBar extends BottomActionBar {
  /// Constructor
  DefaultBottomActionBar(
      Config config, EmojiViewState state, VoidCallback showSearchView)
      : super(config, state, showSearchView);

  @override
  State<StatefulWidget> createState() => _DefaultBottomActionBarState();
}

class _DefaultBottomActionBarState extends State<DefaultBottomActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.config.bottomActionBarConfig.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: widget.config.bottomActionBarConfig.buttonColor,
            onPressed: widget.showSearchView,
            icon: Icon(
              Icons.search,
              color: widget.config.bottomActionBarConfig.buttonIconColor,
            ),
          ),
          _buildBackspaceButton(),
        ],
      ),
    );
  }

  Widget _buildBackspaceButton() {
    if (widget.config.bottomActionBarConfig.showBackspaceButton) {
      return BackspaceButton(
        widget.config,
        widget.state.onBackspacePressed,
        widget.state.onBackspaceLongPressed,
        widget.config.bottomActionBarConfig.buttonIconColor,
      );
    }
    return const SizedBox.shrink();
  }
}
