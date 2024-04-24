part of "parser.dart";

Sentence parseSentenceDetails(Document document) {
  final sentence =
      document.body!.collect("li.entry.sentence", _parseSentenceEntry);

  if (sentence == null) {
    throw Exception("Sentence not found");
  }

  final kanji = document.body!.collectAll(
      "div.kanji_light_block > div.entry.kanji_light", _parseKanjiEntry);

  if (kanji.isNotEmpty) {
    return sentence.withKanji(kanji);
  }

  return sentence;
}

Sentence _parseSentenceEntry(Element element) {
  final english = element.collect("span.english", (e) => e.text.trim())!;
  final japanese = _parseSentenceFurigana(element);

  final copyright = element.collect("span.inline_copyright a",
      (e) => SentenceCopyright(e.text.trim(), e.attributes["href"]!));
  final id = element.collect("a.light-details_link",
          (e) => e.attributes["href"]!.split("/").last) ??
      "";

  return Sentence.copyright(id, japanese, english, copyright);
}
