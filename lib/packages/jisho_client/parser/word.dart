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

  word.details = WordDetails(
    kanji: kanji,
    wikipedia: wikipedia,
  );

  return word;
}

Word _parseWordEntry(Element element) {
  final furigana = _parseWordFurigana(element);
  final word = Word(furigana);

  word.commonWord = element.querySelector("span.concept_light-common") != null;

  word.audioUrl = element
      .querySelector("audio > source")
      ?.transform((e) => "https:${e.attributes["src"]!}");

  word.jlptLevel = element
          .querySelectorAll("span.concept_light-tag")
          .firstWhereOrNull((e) => e.text.contains("JLPT"))
          ?.trimmedText
          .transform((e) => e.split(" ")[1])
          .transform(JLPTLevel.fromString) ??
      JLPTLevel.none;

  word.wanikaniLevels = element
      .querySelectorAll("span.concept_light-tag")
      .where((e) => e.text.contains("Wanikani"))
      .map((e) => e.children.first.trimmedText.split(" ")[2])
      .map(int.parse)
      .toList();

  final definitionElements = element.querySelectorAll("div.meaning-wrapper");

  for (final definitionElement in definitionElements) {
    final previousElement = definitionElement.previousElementSibling;
    if (previousElement?.text == "Other forms") {
      word.otherForms = _parseOtherForms(definitionElement);
      continue;
    }

    final notesElement = definitionElement
        .querySelector("div.meaning-representation_notes > span");
    if (notesElement != null) {
      word.notes = Note.parseAll(notesElement.trimmedText);
      continue;
    }

    final definition = Definition();

    if (previousElement != null &&
        previousElement.classes.contains("meaning-tags")) {
      final tagsText = definitionElement.previousElementSibling!.text;
      definition.types =
          tagsText.split(", ").map((e) => e.trim()).toList().deduplicate();
    }

    if (definition.types.isEmpty && word.definitions.isNotEmpty) {
      definition.types = word.definitions.last.types;
    }

    definition.meanings = definitionElement
        .querySelector("span.meaning-meaning")!
        .trimmedText
        .transform((e) => e.split("; "));

    definition.tags = definitionElement
        .querySelectorAll("span.tag-tag, span.tag-info, span.tag-source")
        .allTrimmedText;

    definition.seeAlso = definitionElement
        .querySelectorAll("span.tag-see_also > a")
        .allTrimmedText
        .deduplicate();

    // don't add wikipedia definition since it's handled separately
    if (definition.types.contains("Wikipedia definition")) {
      // except if there are no other definitions
      if (word.definitions.isEmpty) {
        definition.types = ["Word"];
        word.definitions.add(definition);
      }

      continue;
    }

    definition.exampleSentence = definitionElement
        .querySelector("div.sentence")
        ?.transform((e) => Sentence.example(
              _parseSentenceFurigana(e),
              e.querySelector("span.english")!.trimmedText,
            ));

    word.definitions.add(definition);
  }

  word.id = element
      .querySelector("a.light-details_link")
      ?.transform((e) => e.attributes["href"]!.split("/").last)
      .transform(Uri.decodeComponent);

  word.inflectionId = element
          .querySelector("a.show_inflection_table")
          ?.transform((e) => e.attributes["data-pos"]!) ??
      "";

  word.collocations = element
          .querySelectorAll(".concept_light-status_link")
          .firstWhereOrNull((e) => e.text.contains("collocation"))
          ?.transform(
            (e) => element
                .querySelectorAll(
                    "#${e.attributes["data-reveal-id"]!} > ul > li > a")
                .map((e2) => e2.text
                    .trim()
                    .split(" - ")
                    .transform((split) => Collocation(split[0], split[1])))
                .toList(),
          ) ??
      [];

  final wikipediaTagElement = element
      .querySelectorAll("div.meaning-tags")
      .firstWhereOrNull((e) => e.text.contains("Wikipedia definition"));

  if (wikipediaTagElement != null) {
    final wikipediaElement = wikipediaTagElement.nextElementSibling!;

    if (wikipediaElement.getElementsByTagName("a").isNotEmpty) {
      word.hasWikipedia = true;
    }
  }

  return word;
}

List<OtherForm> _parseOtherForms(Element element) =>
    element.querySelectorAll("span.break-unit").map((e) {
      final split = e.trimmedText.replaceFirst("】", "").split(" 【");
      final form = split.first;
      final reading = split.length == 2 ? split.last : "";
      return OtherForm(form, reading);
    }).toList();
