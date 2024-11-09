import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default method for locale selection
List<CategoryEmoji> getDefaultEmojiLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'de':
      return emojiSetGerman;
    case 'en':
      return emojiSetEnglish;
    case 'es':
      return emojiSetSpanish;
    case 'fr':
      return emojiSetFrance;
    case 'it':
      return emojiSetItalian;
    case 'ja':
      return emojiSetJapanese;
    case 'zh':
      return emojiSetChinese;
    default:
      return emojiSetEnglish;
  }
}
