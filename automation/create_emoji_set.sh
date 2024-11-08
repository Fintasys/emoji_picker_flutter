#!/bin/bash
LC_ALL=C.UTF-8 LANG=C.UTF-8

# Check if a locale is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <locale>"
  exit 1
fi

locale="$1"
url="https://raw.githubusercontent.com/unicode-org/cldr/main/common/annotations/${locale}.xml" # Corrected URL
template_file="emoji_set_template.dart"
output_file="emoji_set_${locale}.dart"

# Fetch the XML file (corrected)
curl -s "$url" > temp.xml  

# Check if curl was successful
if [[ $? -ne 0 ]]; then
  echo "Error downloading XML file for locale: $locale"
  rm temp.xml # Cleanup even if there was an error.
  exit 1  # Exit with an error code.
fi

# Extract descriptions into a temporary file 
#grep '<annotation cp="' temp.xml | sed 's/<annotation cp="\([^"]*\)">\([^<]*\)<\/annotation>/\1:\2/' | tr -d '\r' > descriptions.txt
sed -n 's/.*<annotation cp="\([^"]*\)">\([^<]*\)<\/annotation>.*/\1:\2/p' temp.xml > descriptions.txt

# Create the output file based on the template
cat "$template_file" | while read line; do
  if [[ "$line" == *"Emoji("* ]] && [[ "$line" != *"CategoryEmoji("* ]]; then
    #emoji=$(echo "$line" | cut -d "'" -f 2)
    emoji=$(echo "$line" | sed "s/.*Emoji('\([^']*\)'.*/\1/")
    indent=$(echo "$line" | sed 's/[^[:space:]].*//')
    hasSkinTone=$(echo "$line" | grep -q "hasSkinTone: true" && echo "hasSkinTone: true" || echo "")

    # Remove BOM (using tail)
    tail -n +2 descriptions.txt > temp && mv temp descriptions.txt

    # Search for the description (Corrected awk)
    #description=$(awk -F':' -v emoji="$emoji" '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1); gsub(/^[[:space:]]+|[[:space:]]+$/, "", emoji)} $1 == emoji {print $2; exit}' descriptions.txt)
    description=$(awk -F':' -v emoji="$emoji" '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1); gsub(/^[[:space:]]+|[[:space:]]+$/, "", emoji)} $1 == emoji {print $2; exit}' descriptions.txt)


    if [[ -z "$description" ]]; then
        # If not found, try again *with* FE0F appended (if it's not already there)
        if [[ ! "$emoji" =~ $'\xef\xb8\x8f'$ ]]; then # check if FE0F is not already present
            emoji_with_fe0f="$emoji"$'\xef\xb8\x8f'
            description=$(awk -F':' -v emoji="$emoji_with_fe0f" '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1); gsub(/^[[:space:]]+|[[:space:]]+$/, "", emoji)} $1 == emoji {print $2; exit}' descriptions.txt)

            if [[ -n "$description" ]]; then
                echo "Processed emoji: $emoji (with FE0F) (Description: $description)" >&2
            fi
        fi

        # If still not found, use empty description
        if [[ -z "$description" ]]; then  # Check again after potentially adding FE0F
            description=""
            echo "Emoji $emoji not found in locale $locale - using empty description" >&2
        fi
    else
        echo "Processed emoji: $emoji (Description: $description)" >&2
    fi

    printf "%sEmoji('%s', '%s', %s),\n" "$indent" "$emoji" "$description" "$hasSkinTone"

  else
    echo "$line"
  fi
done > "$output_file"

# Clean up temporary files
#rm temp.xml
#rm descriptions.txt

echo "Generated $output_file"