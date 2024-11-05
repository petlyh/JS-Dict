part of "parser.dart";

SearchResponse<T> parseSearch<T extends ResultType>(Document document) {
  final conversion = document
      .queryOption("#number_conversion, #year_conversion")
      .flatMap(_parseConversion);

  final zenEntries = document
      .querySelectorAll("#zen_bar .japanese_word__text_wrapper > a")
      .map((e) => e.attributes.extract<String>("data-word"))
      .whereSome()
      .toList();

  final limitedZenEntries = zenEntries.length > 1 ? zenEntries : <String>[];

  final noMatchesFor = document
      .queryOption("#no-matches")
      .map(_parseNoMatchesFor)
      .getOrElse(() => []);

  if (noMatchesFor.isNotEmpty) {
    return SearchResponse(
      results: [],
      noMatchesFor: noMatchesFor,
      conversion: conversion.toNullable(),
      zenEntries: limitedZenEntries,
    );
  }

  final correction =
      document.queryOption("#the_corrector").flatMap(_parseCorrection);

  final grammarInfo =
      document.queryOption(".grammar-breakdown").flatMap(_parseGrammarInfo);

  final hasNextPage = document.hasElement("#primary .more");

  final results = switch (T) {
    const (Kanji) => _collectResults(
          document,
          ".kanji.details",
          _parseKanjiDetailsEntry,
        ) +
        _collectResults(
          document,
          ".kanji_light_block > .entry.kanji_light",
          _parseKanjiEntry,
        ),
    const (Word) => _collectResults(
        document,
        ".concepts > .concept_light, .exact_block > .concept_light",
        _parseWordEntry,
      ),
    const (Sentence) => _collectResults(
        document,
        ".sentences_block > ul > .entry.sentence",
        _parseSentenceEntry,
      ),
    const (Name) => _collectResults(
        document,
        ".names_block > .names > .concept_light",
        _parseNameEntry,
      ),
    _ => <T>[],
  } as List<T>;

  return SearchResponse(
    results: results,
    hasNextPage: hasNextPage,
    zenEntries: limitedZenEntries,
    correction: correction.toNullable(),
    noMatchesFor: noMatchesFor,
    grammarInfo: grammarInfo.toNullable(),
    conversion: conversion.toNullable(),
  );
}

List<T> _collectResults<T extends ResultType>(
  Document document,
  String selector,
  Option<T> Function(Element) handler,
) =>
    document.querySelectorAll(selector).map(handler).whereSome().toList();

Option<Conversion> _parseConversion(Element element) => Option.Do(($) {
      final split = element.text.trim().split(" is ");

      return Conversion(
        original: removeTags($(split.firstOption)),
        converted: $(split.getOption(1)),
      );
    });

List<String> _parseNoMatchesFor(Element element) => element.text
    .trim()
    .replaceFirst(RegExp(r"\.$"), "")
    .split(RegExp(", | or |matching "))
    .sublist(2);

Option<Correction> _parseCorrection(Element element) => Option.Do(($) {
      final effective = $(element.queryOption("p > strong > span")).text.trim();

      final meantCorrection = element
          .queryOption(".meant > a")
          .map((e) => removeTypeTags(e.text.trim()))
          .map(
            (original) => Correction(
              effective: effective,
              original: original,
              noMatchesForOriginal: false,
            ),
          );

      final noMatchesCorrection = element
          .queryOption("p")
          .map((e) => e.text.trim())
          .flatMap(RegExp(r"No matches for (.+?)\.").firstMatchOption)
          .flatMap((match) => match.groupOption(1))
          .map(
            (noMatchesOriginal) => Correction(
              effective: effective,
              original: noMatchesOriginal,
              noMatchesForOriginal: true,
            ),
          );

      return $(meantCorrection.alt(() => noMatchesCorrection));
    });

Option<GrammarInfo> _parseGrammarInfo(Element element) => Option.Do(($) {
      final wordElement = $(element.queryOption("h6"));

      final word =
          $(wordElement.text.split(" could be an inflection").firstOption);

      final possibleInflectionOf = $(element.queryOption("h6 > a")).text.trim();

      final formInfos = element.querySelectorAll("ul > li").allTrimmedText;

      return GrammarInfo(
        word: word,
        possibleInflectionOf: possibleInflectionOf,
        formInfos: formInfos,
      );
    });
