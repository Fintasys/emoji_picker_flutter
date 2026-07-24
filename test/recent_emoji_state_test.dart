import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/emoji_picker_internal_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Test harness that lets us trigger a rebuild of [EmojiPicker] from its
/// parent, mimicking an unrelated `setState()` higher up in the widget tree.
class _RebuildHarness extends StatefulWidget {
  const _RebuildHarness({
    super.key,
    required this.pickerKey,
    required this.config,
  });

  final GlobalKey<EmojiPickerState> pickerKey;
  final Config config;

  @override
  State<_RebuildHarness> createState() => _RebuildHarnessState();
}

class _RebuildHarnessState extends State<_RebuildHarness> {
  int _rebuildCounter = 0;

  /// Force the parent to rebuild without touching the picker's own state.
  void forceRebuild() => setState(() => _rebuildCounter++);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Reference the counter so the framework actually rebuilds the subtree.
        body: Column(
          children: [
            Text('rebuilds: $_rebuildCounter'),
            Expanded(
              child: EmojiPicker(
                key: widget.pickerKey,
                config: widget.config,
                onEmojiSelected: (_, _) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const config = Config(
    height: 400,
    categoryViewConfig: CategoryViewConfig(
      initCategory: Category.RECENT,
      recentTabBehavior: RecentTabBehavior.RECENT,
    ),
  );

  const emoji = Emoji('😀', 'grinning face');

  setUp(() {
    // Start every test with an empty recent-emoji store.
    SharedPreferences.setMockInitialValues({});
    // The internal caches are static and would otherwise leak the recent
    // emoji added by one test into the next.
    EmojiPickerInternalUtils.resetCaches();
  });

  testWidgets(
    'A recent update with refresh:false must not leak into the UI on an '
    'unrelated parent rebuild',
    (tester) async {
      final pickerKey = GlobalKey<EmojiPickerState>();
      final harnessKey = GlobalKey<_RebuildHarnessState>();

      await tester.pumpWidget(
        _RebuildHarness(key: harnessKey, pickerKey: pickerKey, config: config),
      );
      await tester.pumpAndSettle();

      // Recent tab starts empty.
      expect(find.text('No Recents'), findsOneWidget);
      expect(find.text(emoji.emoji), findsNothing);

      // Persist a recent emoji through the public API. This calls
      // `updateRecentEmoji(..., refresh: false)` under the hood - the same
      // path taken when an emoji is tapped while the RECENT tab is visible.
      await EmojiPickerUtils().addEmojiToRecentlyUsed(
        key: pickerKey,
        emoji: emoji,
        config: config,
      );
      await tester.pumpAndSettle();

      // refresh:false means the visible list must NOT change yet.
      expect(
        find.text('No Recents'),
        findsOneWidget,
        reason: 'refresh:false should not update the UI immediately',
      );
      expect(find.text(emoji.emoji), findsNothing);

      // Now an unrelated part of the app rebuilds the widget tree.
      harnessKey.currentState!.forceRebuild();
      await tester.pumpAndSettle();

      // The recent list must STILL be unchanged: a refresh:false update is not
      // allowed to surface on a stray rebuild triggered from a parent widget.
      expect(
        find.text('No Recents'),
        findsOneWidget,
        reason: 'a refresh:false update must not leak in on a parent rebuild',
      );
      expect(find.text(emoji.emoji), findsNothing);
    },
  );

  testWidgets('A recent update with refresh:true updates the UI immediately', (
    tester,
  ) async {
    final pickerKey = GlobalKey<EmojiPickerState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiPicker(
            key: pickerKey,
            config: config,
            onEmojiSelected: (_, _) {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No Recents'), findsOneWidget);

    // An explicit refresh must render the new recent emoji right away.
    pickerKey.currentState!.updateRecentEmoji([
      RecentEmoji(emoji, 1),
    ], refresh: true);
    await tester.pumpAndSettle();

    expect(find.text('No Recents'), findsNothing);
    expect(find.text(emoji.emoji), findsOneWidget);
  });
}
