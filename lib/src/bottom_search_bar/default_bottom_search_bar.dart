import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default Bottom Search Bar implementation
class DefaultBottomSearchBar extends BottomSearchBar {
  /// Constructor
  DefaultBottomSearchBar(Config config, VoidCallback showSearchView)
      : super(config, showSearchView);

  @override
  State<StatefulWidget> createState() => _DefaultBottomSearchBarState();
}

class _DefaultBottomSearchBarState extends State<DefaultBottomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.config.bottomSearchBarConfig.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: widget.config.bottomSearchBarConfig.buttonColor,
            onPressed: widget.showSearchView,
            icon: Icon(
              Icons.search,
              color: widget.config.bottomSearchBarConfig.buttonIconColor,
            ),
          )
        ],
      ),
    );
  }
}
