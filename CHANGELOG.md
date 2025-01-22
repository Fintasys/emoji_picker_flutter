## 4.3.0
- Separate 'Cross-eye' and 'Spiral-eye' emojis (Thx to @echogit)
- Add 'Heart on Fire' emoji (Thx to @Yotamho)

## 4.2.0
- Migrate to Swift Package Manager for MacOS

## 4.1.0
- Migrate to Swift Package Manager for iOS

## 4.0.0
- Add localization support for following languages: en, de, es, fr, hi it, ja, pt, ru, zh
- Add script to generate language files for any language based on the official unucode organization translations
- Improve search feature to match new emoji name pattern based on keywords
- Update dependencies
- Replace dart:io with universal_io to support wasm
- Added filterUnsupported method to EmojiPickerUtils (thx to @maeddin)

## 3.1.0
- Added Emoji for Transgender Flag and Hugging People (thx to @everypizza1)
- Replace `swapCategoryAndBottomBar` with `viewOrderConfig` to give more control over the order of each view (thx to coder-with-a-bushido)

## 3.0.0
- Upgrade to Flutter `3.24.0`, Dart `3.4.0` and dependencies e.g. `web: 1.0.0` (thx to @diegotori)
- Allow custom icon for Backspace and Search button
- Replace `showBackspaceButton` in `CategoryViewConfig` with `extraTab` to allow choosing between Backspace, Search or no extra button in category tab bar
- Fix scroll issue on Linux
- Remove `buttonColor` property in `SearchViewConfig` because it had no effect
- Add `inputTextStyle` and `hintTextStyle` in `SearchViewConfig` for better customization
- Fix issue with dark mode support in search view

## 2.2.0

- Downgrade Kotlin to 1.7.10
- Migrate to DSL syntax for gradle setup
- Migrate from from `dart:html` to `package:web` (thx @GleammerRay)
- Minimum Flutter version `3.19.3`

## 2.1.1

- Address issue with inconsistent JVM-target compatibility (thx @GleammerRay)
- Fix issue with ScrollController

## 2.1.0

- Add option to hide SearchView-Button in bottom navigation
- Be able to change HintText in SearchView (thx @akvus)

## 2.0.0 🚀

- Better customization
- Better support for emoji and custom font
- Restructure of configurations
- Added Search View feature
- Update examples (Also added WhatsApp example)
- Add auto-scroll support
- Add long-press backspace support
- Improve SkinTone Overlay
- Updated Readme
- Update License to MIT
- Add tests

## 2.0.0-dev.7

- Improve emoji regex and its performance
- Fix rendering issue with some emoji due to TextStyle handling
- Add tests

## 2.0.0-dev.6

- Fix issue with `EmojiTextEditingController` during selection
- Fix issue with onBackspacePressed logic
- Fix example for custom font

## 2.0.0-dev.5

- Improve documentation
- Improve examples
- prioritize emojiTextStyle over emojiSizeMax
- improve onBackspacePressed logic (trigger controller and callback method)

## 2.0.0-dev.4

- Improve SkinTone Overlay logic
- Add WhatsApp example
- Update min Flutter version to 3.16.0
- Update deprecated API's

## 2.0.0-dev.3

- Add auto-scroll support by using `ScrollController`
- Add long-press backspace support

## 2.0.0-dev.2

- Improve `EmojiTextEditingController` to ensure consistent appearance in Text and TextInput
- Update examples code
- Todo: Update ReadMe, Improve Search UI

## 2.0.0-dev.1

- Added search feature 🔎
- Add more customization possibilities
- Restructure & rename files

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
