# Emoji keyword generation

Run `python3 automation/generate_emoji_set.py nb NorwegianBokmal` from any
working directory, or use the compatible `create_emoji_set.sh` wrapper.
Python 3 is the only generation dependency. Format generated Dart files using
the project's Flutter/Dart SDK after generation. `generate_all_locales.sh`
regenerates all registered datasets and locale exports.

The source is Unicode CLDR **48.1**, pinned to commit
`225136a3bd3eff573f3d64c8fa25d6f9afa974ad`. Both `common/annotations` and
`common/annotationsDerived` are read. Names and keywords are combined and
deduplicated. Parent locales from `supplementalData.xml` and explicit `↑↑↑`
inheritance are resolved per annotation. In particular, Bokmål (`nb`) inherits
`no`, while Nynorsk (`nn`) overrides `no`. Missing entries fall back to English,
then to the original template description. Portuguese (`pt`, including `pt_BR`)
uses CLDR's default Portuguese data; `pt_PT` is a separate locale.

The original Dart template controls category order, glyphs and skin-tone flags.
Variation selectors are ignored only when joining CLDR data; emitted glyphs
remain unchanged. Derived data supplies names for combined emoji. Generated
Dart strings escape quotes, backslashes, dollar signs and newlines.

Pass `--cldr-dir /path/to/cldr/common` for offline generation and
`--output /path/to/file.dart` to select a destination. To upgrade CLDR, update
the pinned revision, regenerate and review the output. Unicode's license is
included in `NOTICES`.

Run generator tests without network access:

```sh
python3 -m unittest discover -s automation -p 'test_*.py'
```
