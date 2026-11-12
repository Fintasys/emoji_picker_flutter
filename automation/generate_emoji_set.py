#!/usr/bin/env python3
"""Generate Dart keyword datasets from the pinned Unicode CLDR 48.1 release.

Uses annotations and annotationsDerived, resolving CLDR parent locales and
inheritance markers before falling back to English for untranslated entries.
Only names change; the template controls glyphs, categories and skin-tone flags.
"""

import argparse
import ast
from functools import lru_cache
from pathlib import Path
import re
import unicodedata
from urllib.error import HTTPError
from urllib.request import urlopen
import xml.etree.ElementTree as ET

CLDR_REVISION = '225136a3bd3eff573f3d64c8fa25d6f9afa974ad'  # release-48-1
CLDR_BASE = f'https://raw.githubusercontent.com/unicode-org/cldr/{CLDR_REVISION}/common'
INHERIT = '↑↑↑'
NO_INHERIT = '∅∅∅'
ROOT = Path(__file__).resolve().parents[1]
EMOJI = re.compile(r"(\bEmoji\(\s*('(?:\\.|[^'\\])*')\s*,\s*)('(?:\\.|[^'\\])*')", re.S)


def normalized_glyph(glyph):
    return unicodedata.normalize('NFC', glyph).replace('\ufe0f', '').replace('\ufe0e', '')


def dart_string(value):
    return "'" + value.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$').replace('\n', '\\n').replace('\r', '\\r') + "'"


class Cldr:
    def __init__(self, directory=None):
        self.directory = Path(directory) if directory else None

    @lru_cache(maxsize=None)
    def document(self, path):
        if self.directory:
            file = self.directory / path
            return ET.parse(file).getroot() if file.exists() else None
        try:
            with urlopen(f'{CLDR_BASE}/{path}', timeout=30) as response:
                return ET.fromstring(response.read())
        except HTTPError as error:
            if error.code == 404:
                return None
            raise

    @lru_cache(maxsize=None)
    def parents(self):
        result = {}
        document = self.document('supplemental/supplementalData.xml')
        if document is not None:
            for group in document.findall('.//parentLocales'):
                if group.get('component'):
                    continue
                for parent in group.findall('parentLocale'):
                    for locale in parent.get('locales', '').split():
                        result[locale] = parent.attrib['parent']
        return result

    @lru_cache(maxsize=None)
    def annotations(self, locale):
        result = {}
        for folder in ('annotations', 'annotationsDerived'):
            document = self.document(f'{folder}/{locale}.xml')
            if document is None:
                continue
            for annotation in document.findall('.//annotation'):
                if 'alt' in annotation.attrib:
                    continue
                key = (normalized_glyph(annotation.attrib['cp']), annotation.get('type', 'keywords'))
                text = ''.join(annotation.itertext()).strip()
                if text and text != INHERIT:
                    result[key] = text
        return result

    def inherited_annotation(self, locale, key):
        seen = set()
        while locale not in seen:
            seen.add(locale)
            value = self.annotations(locale).get(key)
            if value == NO_INHERIT:
                return ''
            if value:
                return value
            if locale == 'root':
                break
            locale = self.parents().get(locale, locale.rsplit('_', 1)[0] if '_' in locale else 'root')
        return ''

    def keywords(self, locale, glyph, fallback):
        values = []
        for kind in ('keywords', 'tts'):
            key = (normalized_glyph(glyph), kind)
            value = self.inherited_annotation(locale, key) or self.inherited_annotation('en', key)
            values.extend(part.strip() for part in value.split('|') if part.strip())
        return ' | '.join(dict.fromkeys(values)) or fallback


def generate(locale, const_name, cldr, template):
    def replace(match):
        glyph = ast.literal_eval(match[2])
        fallback = ast.literal_eval(match[3])
        return match[1] + dart_string(cldr.keywords(locale, glyph, fallback))

    body = EMOJI.sub(replace, template).replace('defaultEmojiSet', f'emojiSet{const_name}')
    return '// Generated from Unicode CLDR 48.1. See automation/README.md.\n' + body


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('locale')
    parser.add_argument('const_name')
    parser.add_argument('--cldr-dir', help='Local CLDR common/ directory, for offline generation')
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    if not re.fullmatch(r'[a-z]{2,3}(?:_[A-Za-z0-9]+)*', args.locale):
        parser.error('invalid locale')
    if not re.fullmatch(r'[A-Za-z][A-Za-z0-9]*', args.const_name):
        parser.error('invalid const name')
    output = args.output or ROOT / 'lib' / 'locales' / f'emoji_set_{args.locale}.dart'
    template = (ROOT / 'lib' / 'src' / 'default_emoji_set.dart').read_text()
    output.write_text(generate(args.locale, args.const_name, Cldr(args.cldr_dir), template))
    print(f'Generated {output}')


if __name__ == '__main__':
    main()
