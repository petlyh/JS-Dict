part of "parser.dart";

SearchResponse<T> parseSearch<T extends SearchType>(Document document) {
  final response = SearchResponse<T>();
  final body = document.body!;

  response.conversion =
      body.collect("#number_conversion, #year_conversion", (e) {
    final data = e.text.trim().split(" is ");
    assert(data.length == 2);
    final original = removeTags(data[0]);
    final converted = data[1];
    return (original: original, converted: converted);
  });

  response.zenEntries = body.collectAll(
    "#zen_bar span.japanese_word__text_wrapper > a",
    (e) => e.attributes["data-word"]!,
  );

  if (response.zenEntries.length == 1) {
    response.zenEntries.clear();
  }

  response.noMatchesFor = body.collect("#no-matches", (e) {
        final noMatchesText = e.text.trim().replaceFirst(RegExp(r"\.$"), "");
        return noMatchesText.split(RegExp(", | or |matching ")).sublist(2);
      }) ??
      [];

  if (response.noMatchesFor.isNotEmpty) {
    return response;
  }

  response.correction = body.collect("#the_corrector", (e) {
    final effective =
        e.collect("p > strong > span", (e2) => e2.text.trim()) ?? "";
    final original = removeTypeTags(
        e.collect("span.meant > a", (e2) => e2.text.trim()) ?? "");

    if (original.isNotEmpty) {
      return Correction(effective, original, false);
    }

    return Correction(
      effective,
      e
          .collect(
              "p",
              (e2) =>
                  RegExp(r"No matches for (.+?)\.").firstMatch(e2.text.trim()))!
          .group(1)!,
      true,
    );
  });

  response.grammarInfo = body.collect(
      "div.grammar-breakdown",
      (e) => GrammarInfo(
            e.collect(
                "h6", (e2) => e2.text.split(" could be an inflection").first)!,
            e.collect("h6 > a", (e2) => e2.text.trim())!,
            e.collectAll("ul > li", (e2) => e2.text.trim()),
          ));

  response.hasNextPage = document.querySelector("a.more") != null;

  switch (T) {
    case const (Kanji):
      response.addResults(
          body.collectAll<Kanji>("div.kanji.details", _parseKanjiDetailsEntry));
      if (response.results.isNotEmpty) break;
      response.addResults(body.collectAll<Kanji>(
          "div.kanji_light_block > div.entry.kanji_light", _parseKanjiEntry));
      break;
    case const (Word):
      response.addResults(body.collectAll<Word>(
          "div.concepts > .concept_light, div.exact_block > .concept_light",
          _parseWordEntry));
      break;
    case const (Sentence):
      response.addResults(body.collectAll<Sentence>(
          "div.sentences_block > ul > li.entry.sentence", _parseSentenceEntry));
      break;
    case const (Name):
      response.addResults(body.collectAll<Name>(
          "div.names_block > div.names > div.concept_light", _parseNameEntry));
  }

  return response;
}
