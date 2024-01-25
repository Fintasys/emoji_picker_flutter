## 1.6.4

- Add long-press backspace support (thx @vedasjad)
- Fix Auto-Scroll issue in TextField (thx @starfreck)

## 1.6.3

- Added new Config parameter `customSkinColorOverlayHorizontalOffset` to fix issue with SkinColorOverlay in ShellRoute or other horizontal adjustments
- Add Jack-O-Lantern emoji 🎃

## 1.6.2

- remove nullability from `OverlayState`
- Compatible with Flutter 3.13.6 🚀
- Various code improvements

## 1.6.1

- Fix issue with RecentsLimit not working
- Add example for dynamic emoji columns based on screen width (thx to @timmaffett)

## 1.6.0

- Breaking Change: Fix behavior of recent tab, choose behavior (None, Recent, Popular) with `recentTabBehavior`. `showRecentsTab` was removed.
- Fix typo in ReadMe (thx @nathanbacon)

## 1.5.4

- Restore compatibility of older Flutter versions

## 1.5.3

- Add Unicode 14 Emoji 🫡

## 1.5.2

- Fix issue with hiding backspace button (set null to hide)
- Migrate jcenter to mavenCentral (thx @duyjack)

## 1.5.1

- Update ReadMe and example 📃
- Add method `clearRecentEmojis` in EmojiPickerUtils to clear the recent Emojis

## 1.5.0

- Add support for Web Platform
- Add support for Windows Platform
- Add support for Linux Platform

## 1.4.1

- Code cleanup and optimizations in DefaultEmojiPickerView (thx @PankovSerge)

## 1.4.0

- Add support for custom fonts ✍️ (thx @yendacoder)
- Refactor to make components reusable and add example for search (thx @yendacoder)
- Breaking: Remove `progressIndicatorColor` in favor of `loadingIndicator` in Config

## 1.3.1

- Add direct support for TextEditingController (thx @LostInDarkMath)
- Fix Koala face position in emoji lists (thx @nathandud)

## 1.3.0

- Compatibility for Flutter 3 and update dependencies 💙
- Introduce property `replaceEmojiOnLimitExceed` to replace least used emoji in Recents when the list is full
- Add property `gridPadding` to make GridView padding configurable
- Add same background color of emoji view to background of loading indicator
- Improvements for usage of custom view

## 1.2.1

- Compatibility for Flutter 2.10 and update Android and Kotlin versions
- Add Mate Emoji 🧉

## 1.2.0

- Breaking Change: `noRecentsText` of type `String` was changed to `noRecents` of type `Widget` and `noRecentsStyle` was removed from `Config`

## 1.1.2

- Fix a issue with macos platform 👨‍🔧
- Close Skin-Tone dialog on several other timings

## 1.1.1

- Fix parsing of legacy Emoji Recent-List 😵

## 1.1.0

- New feature: EmojiPickerUtils provide access to recent emojis, search emoji and adding emoji to recently-used list
- New feature: Skin-Tone Support
- New feature: Emoji-List Versioning (force update users cached emoji's if necessary between versions)
- Add Support for MacOS platform 🖥

## 1.0.8

- Fix to avoid unnecessary rebuilds
- Re-add Activities Category

## 1.0.7

- Align center NoRecent-Text
- Enable Hot Reload for config changes
- Add hint to example code how to fix emoji size issue for iOS
- Add attribute tabIndicatorAnimDuration to config to control tab indicator animation duration
- Fix issue with iOS hover effect
- Format & Cleanup

## 1.0.6

- Fix appearance of emoji when device display size is not default 👀
- Fix issue with GridView padding at the top when no AppBar exist in Scaffold

## 1.0.5

- Fix appearance of emoji when device font size is not default 🖥
- Add Backspace-Button & OnBackspacePressed-Callback for easier deletion of added Emoji's

## 1.0.4

- Make Emoji class accessible 🙌

## 1.0.3

- Organize imports

## 1.0.2

- Bug fix

## 1.0.1

- Update Readme 📚

## 1.0.0

- Inital release of this package 🎉
