import tempfile
import unittest
from pathlib import Path

from generate_emoji_set import Cldr, dart_string, generate, normalized_glyph


class GeneratorTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.write('supplemental/supplementalData.xml', '<supplementalData><parentLocales><parentLocale parent="no" locales="nb nn"/></parentLocales></supplementalData>')
        self.write('annotations/no.xml', '<ldml><annotations><annotation cp="❤">hjerte | rødt</annotation><annotation cp="❤" type="tts">rødt hjerte</annotation><annotation cp="😀">glad</annotation></annotations></ldml>')
        self.write('annotations/nn.xml', '<ldml><annotations><annotation cp="❤">hjarte | raudt</annotation><annotation cp="❤" type="tts">↑↑↑</annotation><annotation cp="😀">↑↑↑</annotation></annotations></ldml>')
        self.write('annotations/en.xml', '<ldml><annotations><annotation cp="🍎">apple | fruit</annotation></annotations></ldml>')
        self.write('annotationsDerived/nn.xml', '<ldml><annotations><annotation cp="👩‍⚕">lege | kvinne</annotation></annotations></ldml>')
        self.cldr = Cldr(self.root)

    def write(self, path, text):
        file = self.root / path
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(text)

    def test_bokmal_uses_cldr_norwegian_parent(self):
        self.assertEqual(self.cldr.keywords('nb', '❤️', ''), 'hjerte | rødt | rødt hjerte')

    def test_nynorsk_keeps_own_keywords_and_resolves_inheritance(self):
        self.assertEqual(self.cldr.keywords('nn', '❤', ''), 'hjarte | raudt | rødt hjerte')
        self.assertEqual(self.cldr.keywords('nn', '😀', ''), 'glad')

    def test_derived_combined_emoji_and_variation_selectors(self):
        self.assertEqual(self.cldr.keywords('nn', '👩‍⚕️', ''), 'lege | kvinne')
        self.assertEqual(normalized_glyph('❤️'), '❤')

    def test_missing_translation_falls_back_to_english_then_template(self):
        self.assertEqual(self.cldr.keywords('nn', '🍎', ''), 'apple | fruit')
        self.assertEqual(self.cldr.keywords('nn', '🫠', 'Melting Face'), 'Melting Face')

    def test_valid_dart_escaping(self):
        self.assertEqual(dart_string("a'b\\c$d\ne"), "'a\\'b\\\\c\\$d\\ne'")

    def test_multiline_template_preserves_categories_glyphs_and_skin_tones(self):
        template = "const defaultEmojiSet = [CategoryEmoji(Category.SMILEYS, [Emoji(\n '😀',\n 'Grinning Face',\n hasSkinTone: true,\n), Emoji('🫠', 'Melting Face')])];"
        result = generate('nn', 'NorwegianNynorsk', self.cldr, template)
        self.assertIn('emojiSetNorwegianNynorsk', result)
        self.assertIn("'glad'", result)
        self.assertIn('hasSkinTone: true', result)
        self.assertIn("Emoji('🫠', 'Melting Face')", result)
        self.assertNotIn('↑↑↑', result)


if __name__ == '__main__':
    unittest.main()
