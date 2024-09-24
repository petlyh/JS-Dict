part of "parser.dart";

SearchResponse<T> parseSearch<T extends SearchType>(Document document) {
  final conversion = document
      .querySelector("#number_conversion, #year_conversion")
      ?.transform(_parseConversion);

  final zenEntries = document
      .querySelectorAll("#zen_bar span.japanese_word__text_wrapper > a")
      .map((e) => e.attributes["data-word"]!)
      .toList();

  final limitedZenEntries = zenEntries.length > 1 ? zenEntries : <String>[];

  final noMatchesFor =
      document.querySelector("#no-matches")?.transform(_parseNoMatchesFor) ??
          [];

  if (noMatchesFor.isNotEmpty) {
    return SearchResponse.noMatches(
      noMatchesFor,
      conversion: conversion,
      zenEntries: limitedZenEntries,
    );
  }

  final correction =
      document.querySelector("#the_corrector")?.transform(_parseCorrection);

  final grammarInfo = document
      .querySelector("div.grammar-breakdown")
      ?.transform(_parseGrammarInfo);

  final hasNextPage = document.querySelector("a.more") != null;

  List<U> collectResults<U extends SearchType>(
    String selector,
    U Function(Element) handler,
  ) =>
      document.querySelectorAll(selector).map(handler).toList();

  final results = switch (T) {
    const (Kanji) => collectResults(
          ".kanji.details",
          _parseKanjiDetailsEntry,
        ) +
        collectResults(
          ".kanji_light_block > .entry.kanji_light",
          _parseKanjiEntry,
        ),
    const (Word) => collectResults(
        ".concepts > .concept_light, .exact_block > .concept_light",
        _parseWordEntry,
      ),
    const (Sentence) => collectResults(
        ".sentences_block > ul > li.entry.sentence",
        _parseSentenceEntry,
      ),
    const (Name) => collectResults(
        ".names_block > .names > .concept_light",
        _parseNameEntry,
      ),
    _ => <T>[],
  } as List<T>;

  return SearchResponse(
    results: results,
    hasNextPage: hasNextPage,
    zenEntries: limitedZenEntries,
    correction: correction,
    noMatchesFor: noMatchesFor,
    grammarInfo: grammarInfo,
    conversion: conversion,
  );
}

Conversion _parseConversion(Element e) => e.trimmedText
    .split(" is ")
    .transform((data) => (original: removeTags(data[0]), converted: data[1]));

List<String> _parseNoMatchesFor(Element e) => e.trimmedText
    .replaceFirst(RegExp(r"\.$"), "")
    .split(RegExp(", | or |matching "))
    .sublist(2);

Correction _parseCorrection(Element e) {
  final effective = e.querySelector("p > strong > span")?.trimmedText ?? "";

  final original =
      removeTypeTags(e.querySelector("span.meant > a")?.trimmedText ?? "");

  if (original.isNotEmpty) {
    return Correction(effective, original, false);
  }

  final noMatchesOriginal = e
      .querySelector("p")!
      .trimmedText
      .transform(RegExp(r"No matches for (.+?)\.").firstMatch)!
      .group(1)!;

  return Correction(
    effective,
    noMatchesOriginal,
    true,
  );
}

GrammarInfo _parseGrammarInfo(Element e) {
  final word = e
      .querySelector("h6")!
      .transform((e2) => e2.text.split(" could be an inflection").first);

  final possibleInflectionOf = e.querySelector("h6 > a")!.trimmedText;

  final formInfos = e.querySelectorAll("ul > li").allTrimmedText;

  return GrammarInfo(
    word,
    possibleInflectionOf,
    formInfos,
  );
}
