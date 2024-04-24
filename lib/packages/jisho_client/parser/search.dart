part of "parser.dart";

SearchResponse<T> parseSearch<T extends SearchType>(Document document) {
  final response = SearchResponse<T>();

  response.conversion = document
      .querySelector("#number_conversion, #year_conversion")
      ?.transform((e) {
    final data = e.text.trim().split(" is ");
    assert(data.length == 2);
    final original = removeTags(data[0]);
    final converted = data[1];
    return (original: original, converted: converted);
  });

  response.zenEntries = document
      .querySelectorAll("#zen_bar span.japanese_word__text_wrapper > a")
      .map((e) => e.attributes["data-word"]!)
      .toList();

  if (response.zenEntries.length == 1) {
    response.zenEntries.clear();
  }

  response.noMatchesFor = document.querySelector("#no-matches")?.transform((e) {
        final noMatchesText = e.text.trim().replaceFirst(RegExp(r"\.$"), "");
        return noMatchesText.split(RegExp(", | or |matching ")).sublist(2);
      }) ??
      [];

  if (response.noMatchesFor.isNotEmpty) {
    return response;
  }

  response.correction =
      document.querySelector("#the_corrector")?.transform((e) {
    final effective = e
            .querySelector("p > strong > span")
            ?.transform((e2) => e2.text.trim()) ??
        "";
    final original = removeTypeTags(
        e.querySelector("span.meant > a")?.transform((e2) => e2.text.trim()) ??
            "");

    if (original.isNotEmpty) {
      return Correction(effective, original, false);
    }

    return Correction(
      effective,
      e
          .querySelector("p")!
          .transform((e2) =>
              RegExp(r"No matches for (.+?)\.").firstMatch(e2.text.trim()))!
          .group(1)!,
      true,
    );
  });

  response.grammarInfo = document
      .querySelector("div.grammar-breakdown")
      ?.transform((e) => GrammarInfo(
            e.querySelector("h6")!.transform(
                (e2) => e2.text.split(" could be an inflection").first),
            e.querySelector("h6 > a")!.transform((e2) => e2.text.trim()),
            e.querySelectorAll("ul > li").map((e2) => e2.text.trim()).toList(),
          ));

  response.hasNextPage = document.querySelector("a.more") != null;

  switch (T) {
    case const (Kanji):
      response.addResults(document
          .querySelectorAll("div.kanji.details")
          .map(_parseKanjiDetailsEntry)
          .toList());
      if (response.results.isNotEmpty) break;
      response.addResults(document
          .querySelectorAll("div.kanji_light_block > div.entry.kanji_light")
          .map(_parseKanjiEntry)
          .toList());
      break;
    case const (Word):
      response.addResults(document
          .querySelectorAll(
              "div.concepts > .concept_light, div.exact_block > .concept_light")
          .map(_parseWordEntry)
          .toList());
      break;
    case const (Sentence):
      response.addResults(document
          .querySelectorAll("div.sentences_block > ul > li.entry.sentence")
          .map(_parseSentenceEntry)
          .toList());
      break;
    case const (Name):
      response.addResults(document
          .querySelectorAll("div.names_block > div.names > div.concept_light")
          .map(_parseNameEntry)
          .toList());
  }

  return response;
}
