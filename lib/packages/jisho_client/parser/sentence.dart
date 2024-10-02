part of "parser.dart";

Sentence parseSentenceDetails(Document document) {
  final sentence = document
      .querySelector("li.entry.sentence")
      ?.transform(_parseSentenceEntry);

  if (sentence == null) {
    throw Exception("Sentence not found");
  }

  final kanji = document
      .querySelectorAll("div.kanji_light_block > div.entry.kanji_light")
      .map(_parseKanjiEntry)
      .toList();

  return kanji.isNotEmpty ? sentence.copyWith(kanji: kanji) : sentence;
}

Sentence _parseSentenceEntry(Element element) {
  final english = element.querySelector("span.english")!.trimmedText;

  final japanese = _parseSentenceFurigana(element);

  final copyright = element.querySelector("span.inline_copyright a")?.transform(
        (e) => SentenceCopyright(
          name: e.trimmedText,
          url: e.attributes["href"]!,
        ),
      );

  final id = element
      .querySelector("a.light-details_link")
      ?.transform((e) => e.attributes["href"]!.split("/").last);

  return Sentence(
    japanese: japanese,
    english: english,
    id: id,
    copyright: copyright,
  );
}
