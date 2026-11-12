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
    case 'hi':
      return emojiSetHindi;
    case 'it':
      return emojiSetItalian;
    case 'ja':
      return emojiSetJapanese;
    case 'nl':
      return emojiSetDutch;
    case 'pt':
      return emojiSetPortuguese;
    case 'ru':
      return emojiSetRussian;
    case 'zh':
      return emojiSetChinese;
    case 'da':
      return emojiSetDanish;
    case 'fi':
      return emojiSetFinnish;
    case 'is':
      return emojiSetIcelandic;
    case 'nb':
      return emojiSetNorwegianBokmal;
    case 'nn':
      return emojiSetNorwegianNynorsk;
    case 'no':
      return emojiSetNorwegianBokmal;
    case 'pl':
      return emojiSetPolish;
    case 'sv':
      return emojiSetSwedish;
    default:
      return emojiSetEnglish;
  }
}
