part of "parser.dart";

Word parseWordDetails(Document document) {
  final word =
      document.querySelector("div.concept_light")?.transform(_parseWordEntry);

  if (word == null) {
    throw Exception("Word not found");
  }

  final kanji = document
      .querySelectorAll("div.kanji_light_block > div.entry.kanji_light")
      .map(_parseKanjiEntry)
      .toList();

  final wikipedia = document
      .querySelectorAll("div.meaning-tags")
      .firstWhereOrNull((e) => e.text.contains("Wikipedia definition"))
      ?.transform((w) => _parseWikipediaInfo(w.nextElementSibling!));

  return word.withDetails(
    WordDetails(
      kanji: kanji,
      wikipedia: wikipedia,
    ),
  );
}

Word _parseWordEntry(Element element) {
  final word = _parseWordFurigana(element);

  final commonWord = element.querySelector("span.concept_light-common") != null;

  final audioUrl = element
      .querySelector("audio > source")
      ?.transform((e) => "https:${e.attributes["src"]!}");

  final jlptLevel = element
          .querySelectorAll("span.concept_light-tag")
          .firstWhereOrNull((e) => e.text.contains("JLPT"))
          ?.trimmedText
          .transform((e) => e.split(" ")[1])
          .transform(JLPTLevel.fromString) ??
      JLPTLevel.none;

  final wanikaniLevels = element
      .querySelectorAll("span.concept_light-tag")
      .where((e) => e.text.contains("Wanikani"))
      .map((e) => e.children.first.trimmedText.split(" ")[2])
      .map(int.parse)
      .toList();

  final notes = element
          .querySelector("div.meaning-representation_notes > span")
          ?.transform((e) => e.trimmedText)
          .transform(_parseNotes) ??
      [];

  final definitionElements = element.querySelectorAll("div.meaning-wrapper");

  final otherForms = definitionElements
          .firstWhereOrNull(
            (e) => e.previousElementSibling?.text == "Other forms",
          )
          ?.transform(_parseOtherForms) ??
      [];

  final sourceDefinitions = definitionElements
      .where(
    (e) =>
        e.previousElementSibling?.text != "Other forms" &&
        e.previousElementSibling?.text != "Wikipedia definition" &&
        e.querySelector(".meaning-representation_notes") == null,
  )
      .fold(<Definition>[], _parseDefinition).toList();

  final wikipediaElement = element
      .querySelectorAll("div.meaning-tags")
      .firstWhereOrNull((e) => e.text.contains("Wikipedia definition"))
      ?.nextElementSibling;

  final hasWikipedia =
      wikipediaElement?.getElementsByTagName("a").isNotEmpty ?? false;

  final definitions = sourceDefinitions.isEmpty && wikipediaElement != null
      ? _parseWikipediaDefinition(wikipediaElement)
      : sourceDefinitions;

  final id = element
      .querySelector("a.light-details_link")
      ?.transform((e) => e.attributes["href"]!.split("/").last)
      .transform(Uri.decodeComponent);

  final inflectionCode = element
          .querySelector("a.show_inflection_table")
          ?.transform((e) => e.attributes["data-pos"]!) ??
      "";

  final collocations = element
          .querySelectorAll(".concept_light-status_link")
          .firstWhereOrNull((e) => e.text.contains("collocation"))
          ?.transform(
            (e) => element
                .querySelectorAll(
                  "#${e.attributes["data-reveal-id"]!} > ul > li > a",
                )
                .map(
                  (e2) => e2.text
                      .trim()
                      .split(" - ")
                      .transform((split) => Collocation(split[0], split[1])),
                )
                .toList(),
          ) ??
      [];

  return Word(
    word: word,
    definitions: definitions,
    otherForms: otherForms,
    commonWord: commonWord,
    wanikaniLevels: wanikaniLevels,
    jlptLevel: jlptLevel,
    audioUrl: audioUrl,
    notes: notes,
    collocations: collocations,
    id: id,
    inflectionCode: inflectionCode,
    hasWikipedia: hasWikipedia,
  );
}

List<Note> _parseNotes(String text) => text
    .trim()
    .replaceFirst(RegExp(r"\.$"), "")
    .split(". ")
    .deduplicate<String>()
    .map(Note.parse)
    .toList();

List<Definition> _parseWikipediaDefinition(Element e) => [
      Definition(
        meanings: [e.querySelector(".meaning-meaning")!.text],
        types: ["Word"],
      ),
    ];

List<Definition> _parseDefinition(List<Definition> previous, Element element) {
  final previousElement = element.previousElementSibling;

  final thisTypes = previousElement?.classes.contains("meaning-tags") ?? false
      ? previousElement!.text
          .split(", ")
          .map((e) => e.trim())
          .toList()
          .deduplicate<String>()
      : const <String>[];

  final types = thisTypes.isEmpty && previous.isNotEmpty
      ? previous.last.types
      : thisTypes;

  final meanings = element
      .querySelector("span.meaning-meaning")!
      .trimmedText
      .transform((e) => e.split("; "));

  final tags = element
      .querySelectorAll("span.tag-tag, span.tag-info, span.tag-source")
      .allTrimmedText;

  final seeAlso = element
      .querySelectorAll("span.tag-see_also > a")
      .allTrimmedText
      .deduplicate<String>();

  final exampleSentence = element.querySelector("div.sentence")?.transform(
        (e) => Sentence(
          japanese: _parseSentenceFurigana(e),
          english: e.querySelector("span.english")!.trimmedText,
        ),
      );

  final definition = Definition(
    meanings: meanings,
    types: types,
    tags: tags,
    seeAlso: seeAlso,
    exampleSentence: exampleSentence,
  );

  return previous + [definition];
}

List<OtherForm> _parseOtherForms(Element element) =>
    element.querySelectorAll("span.break-unit").map((e) {
      final split = e.trimmedText.replaceFirst("】", "").split(" 【");
      final form = split.first;
      final reading = split.length == 2 ? split.last : "";
      return OtherForm(form, reading);
    }).toList();
