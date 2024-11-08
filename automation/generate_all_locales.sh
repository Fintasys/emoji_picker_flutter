outputDir="../lib/locales"

echo "Generating all locales"
> "$outputDir/emoji_set.dart"
echo "====================="

locales=(
  "de German"
  "en English"
  "es Spanish"
  "fr France"
  "it Italian"
  "ja Japanese"
  "zh Chinese"
)

for locale in "${locales[@]}"; do
  IFS=" " read code lang <<< "$locale" # Split the locale string into code and language
  echo "$lang - $code"
  ./create_emoji_set.sh "$code" "$lang" > /dev/null 2>&1
  echo "export 'package:emoji_picker_flutter/locales/emoji_set_$code.dart';" >> "$outputDir/emoji_set.dart"
done

echo "====================="
echo "All locales generated"
