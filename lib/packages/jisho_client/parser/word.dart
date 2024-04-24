part of "parser.dart";

Word parseWordDetails(Document document) {
  final word = document.body!.collect("div.concept_light", _parseWordEntry);

  if (word == null) {
    throw Exception("Word not found");
  }

  final wikipediaTagElement = document.body!.collectFirstWhere(
      "div.meaning-tags",
      (e) => e.text.contains("Wikipedia definition"),
      (e) => e);

  word.details = WordDetails(
    kanji: document.body!.collectAll(
        "div.kanji_light_block > div.entry.kanji_light", _parseKanjiEntry),
    wikipedia: wikipediaTagElement != null
        ? _parseWikipediaInfo(wikipediaTagElement.nextElementSibling!)
        : null,
  );

  return word;
}

Word _parseWordEntry(Element element) {
  final furigana = _parseWordFurigana(element);
  final word = Word(furigana);

  word.commonWord = element.querySelector("span.concept_light-common") != null;

  word.audioUrl =
      element.collect("audio > source", (e) => "https:${e.attributes["src"]!}");

  word.jlptLevel = element.collectFirstWhere(
        "span.concept_light-tag",
        (e) => e.text.contains("JLPT"),
        (e) => JLPTLevel.fromString(e.text.trim().split(" ")[1]),
      ) ??
      JLPTLevel.none;

  word.wanikaniLevels = element.collectWhere(
    "span.concept_light-tag",
    (e) => e.text.contains("Wanikani"),
    (e) => int.parse(e.children.first.text.trim().split(" ")[2]),
  );

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
      word.notes = Note.parseAll(notesElement.text.trim());
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

    final meaningsElement =
        definitionElement.querySelector("span.meaning-meaning");
    definition.meanings = meaningsElement!.text.trim().split("; ");

    definition.tags = definitionElement.collectAll(
        "span.tag-tag, span.tag-info, span.tag-source", (e) => e.text.trim());
    definition.seeAlso = definitionElement.collectAll(
        "span.tag-see_also > a", (e) => e.text.trim());
    definition.seeAlso = definition.seeAlso.deduplicate();

    // don't add wikipedia definition since it's handled separately
    if (definition.types.contains("Wikipedia definition")) {
      // except if there are no other definitions
      if (word.definitions.isEmpty) {
        definition.types = ["Word"];
        word.definitions.add(definition);
      }

      continue;
    }

    definition.exampleSentence = definitionElement.collect(
        "div.sentence",
        (e) => Sentence.example(_parseSentenceFurigana(e),
            e.querySelector("span.english")!.text.trim()));

    word.definitions.add(definition);
  }

  word.id = element.collect("a.light-details_link",
      (e) => Uri.decodeComponent(e.attributes["href"]!.split("/").last));

  word.inflectionId = element.collect(
          "a.show_inflection_table", (e) => e.attributes["data-pos"]!) ??
      "";

  word.collocations = element.collectFirstWhere(
        ".concept_light-status_link",
        (e) => e.text.contains("collocation"),
        (e) {
          final selector = "#${e.attributes["data-reveal-id"]!} > ul > li > a";
          return element.collectAll(selector, (e2) {
            final split = e2.text.trim().split(" - ");
            assert(split.length == 2);
            return Collocation(split[0], split[1]);
          });
        },
      ) ??
      [];

  final wikipediaTagElement = element.collectFirstWhere("div.meaning-tags",
      (e) => e.text.contains("Wikipedia definition"), (e) => e);

  if (wikipediaTagElement != null) {
    final wikipediaElement = wikipediaTagElement.nextElementSibling!;

    if (wikipediaElement.getElementsByTagName("a").isNotEmpty) {
      word.hasWikipedia = true;
    }
  }

  return word;
}

List<OtherForm> _parseOtherForms(Element element) {
  return element.collectAll("span.break-unit", (e) {
    final split = e.text.trim().replaceFirst("】", "").split(" 【");
    final form = split.first;
    final reading = split.length == 2 ? split.last : "";
    return OtherForm(form, reading);
  });
}
