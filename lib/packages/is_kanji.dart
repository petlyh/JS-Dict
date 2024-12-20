const _cjkUnifiedIdeographsStart = 0x4E00;
const _cjkUnifiedIdeographsEnd = 0x9FFF;

/// checks whether [text] only contains kanji characters.¨
bool isKanjiOnly(String text) => text
    .trim()
    .codeUnits
    .where(
      (unit) => !(_cjkUnifiedIdeographsStart <= unit &&
          unit <= _cjkUnifiedIdeographsEnd),
    )
    .isEmpty;

/// checks whether [text] doesn't contain any kanji characters.
bool isNonKanji(String text) => text
    .trim()
    .codeUnits
    .where(
      (unit) =>
          _cjkUnifiedIdeographsStart <= unit &&
          unit <= _cjkUnifiedIdeographsEnd,
    )
    .isEmpty;
