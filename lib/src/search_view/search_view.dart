import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Template class for custom implementation
/// Inhert this class to create your own search view
abstract class SearchView extends StatefulWidget {
  /// Constructor
  const SearchView(this.config, this.state, this.showEmojiView, {super.key});

  /// Config for customizations
  final Config config;

  /// State that holds current emoji data
  final EmojiViewState state;

  /// Return to emoji view
  final VoidCallback showEmojiView;
}

/// Template class for custom implementation
/// Inhert this class to create your own search view state
class SearchViewState<T extends SearchView> extends State<T>
    with SkinToneOverlayStateMixin {
  /// Emoji picker utils
  final utils = EmojiPickerUtils();

  /// Focus node for textfield
  final focusNode = FocusNode();

  /// Search results
  final results = List<Emoji>.empty(growable: true);

  /// Last remembered skin tone, applied to skin-tone-capable emoji for display
  /// and selection when [SkinToneConfig.rememberSkinTone] is enabled.
  String? _rememberedSkinTone;

  @override
  void initState() {
    super.initState();
    _loadRememberedSkinTone();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // Auto focus textfield
      FocusScope.of(context).requestFocus(focusNode);
      // Load recent emojis initially
      utils.getRecentEmojis().then((value) {
        if (!mounted) return;
        setState(() => _updateResults(value.map((e) => e.emoji).toList()));
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _loadRememberedSkinTone() {
    if (!widget.config.skinToneConfig.rememberSkinTone) {
      return;
    }
    utils.getRememberedSkinTone().then((tone) {
      if (!mounted || tone == null) {
        return;
      }
      setState(() => _rememberedSkinTone = tone);
    });
  }

  /// On text input changed callback
  void onTextInputChanged(String text) {
    links.clear();
    results.clear();
    utils.searchEmoji(text, widget.state.categoryEmoji).then((value) {
      if (!mounted) return;
      setState(() => _updateResults(value));
    });
  }

  void _updateResults(List<Emoji> emojis) {
    results
      ..clear()
      ..addAll(emojis);
    results.asMap().entries.forEach((e) {
      final displayEmoji = utils.applyDisplaySkinTone(
        e.value,
        widget.config.skinToneConfig,
        _rememberedSkinTone,
      );
      links[displayEmoji.emoji] = LayerLink();
    });
  }

  /// Build emoji cell
  Widget buildEmoji(Emoji emoji, double emojiSize, double emojiBoxSize) {
    // Apply a remembered skin tone for display and selection.
    // Falls back to the base glyph when no tone is remembered.
    final displayEmoji = utils.applyDisplaySkinTone(
      emoji,
      widget.config.skinToneConfig,
      _rememberedSkinTone,
    );
    return addSkinToneTargetIfAvailable(
      hasSkinTone: displayEmoji.hasSkinTone,
      linkKey: displayEmoji.emoji,
      child: EmojiCell.fromConfig(
        emoji: displayEmoji,
        emojiSize: emojiSize,
        emojiBoxSize: emojiBoxSize,
        onEmojiSelected: widget.state.onEmojiSelected,
        config: widget.config,
        onSkinToneDialogRequested:
            (emojiBoxPosition, emoji, emojiSize, category) {
              closeSkinToneOverlay();
              if (!emoji.hasSkinTone || !widget.config.skinToneConfig.enabled) {
                return;
              }
              showSkinToneOverlay(
                emojiBoxPosition,
                emoji,
                emojiSize,
                null, // Todo: check if we can provide the category
                widget.config,
                _onSkinTonedEmojiSelected,
                links[emoji.emoji]!,
              );
            },
      ),
    );
  }

  void _onSkinTonedEmojiSelected(Category? category, Emoji emoji) {
    _rememberSkinToneIfEnabled(emoji);
    widget.state.onEmojiSelected(category, emoji);
    closeSkinToneOverlay();
  }

  /// Persists and re-applies the skin tone of the selected [emoji] when
  /// [SkinToneConfig.rememberSkinTone] is enabled. Selecting a
  /// skin-tone-capable base glyph (no modifier) clears the remembered tone.
  void _rememberSkinToneIfEnabled(Emoji emoji) {
    if (!widget.config.skinToneConfig.rememberSkinTone || !emoji.hasSkinTone) {
      return;
    }
    final tone = utils.extractSkinTone(emoji);
    if (tone == _rememberedSkinTone) {
      return;
    }
    utils.setRememberedSkinTone(tone);
    setState(() => _rememberedSkinTone = tone);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('Search View implementation missing');
  }
}
