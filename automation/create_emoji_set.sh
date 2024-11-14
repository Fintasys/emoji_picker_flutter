#!/bin/bash

# Check for locale and const name arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <locale> <const_name>"
  exit 1
fi

locale="$1"
const_name="$2" # New variable to store the const name
url="https://raw.githubusercontent.com/unicode-org/cldr/main/common/annotations/${locale}.xml"
template_file="../lib/src/default_emoji_set.dart"

output_dir="../lib/locales"
output_file="$output_dir/emoji_set_${locale}.dart"

# Function to decode HTML entities
decode_html_entities() {
  local input="$1"

  # Replace common HTML entities with their ASCII equivalents
  local decoded=$(echo "$input" | sed -e 's/&amp;/\&/g' \
    -e 's/&lt;/</g' \
    -e 's/&gt;/>/g' \
    -e 's/&quot;/"/g' \
    -e "s/&apos;/'/g" \
    -e 's/&nbsp;/ /g')

  echo "$decoded"
}

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Fetch the XML file (corrected)
curl -s "$url" >temp.xml

# Check if curl was successful
if [[ $? -ne 0 ]]; then
  echo "Error downloading XML file for locale: $locale"
  rm temp.xml # Cleanup even if there was an error.
  exit 1      # Exit with an error code.
fi

# Extract descriptions into a temporary file
grep '<annotation cp="' temp.xml | perl -CSD -ne 'print "$1:$2\n" if /<annotation cp="([^"]+)"[^>]*>([^<]+)<\/annotation>/;' >descriptions.txt

# Create the output file based on the template
cat "$template_file" | sed "s/defaultEmojiSet/emojiSet$const_name/" | while read line; do

  if [[ "$line" == *"Emoji("* ]] && [[ "$line" != *"CategoryEmoji("* ]]; then
    #emoji=$(echo "$line" | cut -d "'" -f 2)
    emoji=$(echo "$line" | sed "s/.*Emoji('\([^']*\)'.*/\1/")
    original_description=$(echo "$line" | sed "s/.*Emoji('\(.*\)', '\(.*\)'.*/\2/")
    indent=$(echo "$line" | sed 's/[^[:space:]].*//')
    hasSkinTone=$(echo "$line" | grep -q "hasSkinTone: true" && echo "hasSkinTone: true" || echo "")

    get_description() {
      local emoji="$1"
      local description=$(awk -F':' -v emoji="$emoji" '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1); gsub(/^[[:space:]]+|[[:space:]]+$/, "", emoji)} $1 == emoji {print $2; exit}' descriptions.txt)
      local decodedDescription=$(decode_html_entities "$description")
      echo "$decodedDescription"
    }

    description=$(get_description "$emoji")

    # If description is empty, try component-wise search for combined emoji
    if [[ -z "$description" ]]; then
      # Split into components, handling ZWJ correctly for splitting
      emoji_parts=($(echo "$emoji" | perl -CSD -ne 's/\x{200D}/ /g; s/[\x{FE0E}\x{FE0F}\x{200C}\x{200D}]//g; print for split //, $_'))

      # Combine component descriptions
      description=""
      for part in "${emoji_parts[@]}"; do

        part_description=$(get_description "$part")
        if [[ -n "$part_description" ]]; then
          description+="$part_description "
        fi
      done

      if [[ -n "$description" ]]; then
        echo "Processed combined emoji: $emoji (Description: $description)" >&2
      else
        description="$original_description"
        #Output bytes of emoji for debugging
        #echo -n "$emoji" | xxd -p >&2
        echo "Emoji $emoji not found in locale $locale - using default description" >&2
      fi

    else
      echo "Processed emoji: $emoji (Description: $description)" >&2
    fi

    printf "%sEmoji('%s', '%s', %s),\n" "$indent" "$emoji" "$description" "$hasSkinTone"

  else
    echo "$line"
  fi

done >"$output_file"

# Clean up temporary files
rm temp.xml
rm temp
rm descriptions.txt

# Format file
dart format "$output_file"

echo "Generated $output_file"
