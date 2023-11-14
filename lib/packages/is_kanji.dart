import "package:collection/collection.dart";

/// checks whether [text] only contains kanji characters.
bool isKanji(String text) {
  const cjkUnifiedIdeographsStart = 0x4E00;
  const cjkUnifiedIdeographsEnd = 0x9FFF;

  final codeUnits = text.trim().codeUnits;
  final nonKanji = codeUnits.firstWhereOrNull((unit) =>
      !(cjkUnifiedIdeographsStart <= unit && unit <= cjkUnifiedIdeographsEnd));

  return nonKanji == null;
}

/// checks whether [text] doesn't contain any kanji characters.
bool isNonKanji(String text) {
  const cjkUnifiedIdeographsStart = 0x4E00;
  const cjkUnifiedIdeographsEnd = 0x9FFF;

  final codeUnits = text.trim().codeUnits;
  final firstKanji = codeUnits.firstWhereOrNull((unit) =>
      cjkUnifiedIdeographsStart <= unit && unit <= cjkUnifiedIdeographsEnd);

  return firstKanji == null;
}
