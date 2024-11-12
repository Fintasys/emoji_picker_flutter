outputDir="../lib/locales"
outputFile="$outputDir/default_emoji_set_locale.dart"

echo "Generating all locales"
>"$outputDir/emoji_set.dart"
echo "====================="

locales=(
    "de German"
    "en English"
    "es Spanish"
    "fr France"
    "hi Hindi"
    "it Italian"
    "ja Japanese"
    "pt Portuguese"
    "ru Russian"
    "zh Chinese"
)

for locale in "${locales[@]}"; do
    IFS=" " read code lang <<<"$locale" # Split the locale string into code and language
    echo "$lang - $code"
    ./create_emoji_set.sh "$code" "$lang" >/dev/null 2>&1
    echo "export 'package:emoji_picker_flutter/locales/emoji_set_$code.dart';" >>"$outputDir/emoji_set.dart"
done

# Create the default emoji set locale file and add the import statement
>"$outputFile"
echo "import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';" >>"$outputFile"
echo "import 'package:flutter/material.dart';" >>"$outputFile"

# Start writing the getDefaultEmojiLocale method
echo >>"$outputFile"
echo "/// Default method for locale selection" >>"$outputFile"
echo "List<CategoryEmoji> getDefaultEmojiLocale(Locale locale) {" >>"$outputFile"
echo "  switch (locale.languageCode) {" >>"$outputFile"

# Dynamically add case statements
for locale in "${locales[@]}"; do
    IFS=" " read code lang <<<"$locale" # Split the locale string into code and language
    emojiSetVar="emojiSet$lang"
    echo "    case '$code':" >>"$outputFile"
    echo "      return $emojiSetVar;" >>"$outputFile"
done

# Default case
echo "    default:" >>"$outputFile"
echo "      return emojiSetEnglish;" >>"$outputFile"
echo "  }" >>"$outputFile"
echo "}" >>"$outputFile"

echo "====================="
echo "All locales generated"
