echo "Generating all locales"
echo "====================="
echo "en - English"
./create_emoji_set.sh en English > /dev/null 2>&1
echo "de - German"
./create_emoji_set.sh de German > /dev/null 2>&1
echo "es - Spanish"
./create_emoji_set.sh es Spanish > /dev/null 2>&1
echo "fr - France"
./create_emoji_set.sh fr France > /dev/null 2>&1
echo "ja - Japanese"
./create_emoji_set.sh ja Japanese > /dev/null 2>&1
echo "it - Italian"
./create_emoji_set.sh it Italian > /dev/null 2>&1
echo "zh - Chinese"
./create_emoji_set.sh zh Chinese > /dev/null 2>&1
echo "====================="
echo "All locales generated"