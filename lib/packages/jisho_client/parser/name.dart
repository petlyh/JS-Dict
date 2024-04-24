part of "parser.dart";

Name _parseNameEntry(Element element) {
  final japaneseText = element.collect(
      "div.concept_light-readings",
      (e) =>
          e.text.trim().replaceAll("\n", "").replaceAll(RegExp(r" +"), " "))!;

  final japanese = japaneseText.split("【").last.replaceFirst(RegExp(r"】$"), "");

  final reading =
      japaneseText.contains("【") ? japaneseText.split("【").first.trim() : null;

  final english = element
      .collectAll("span.meaning-meaning", (e) => e.text.trim())
      .last
      .replaceFirst(lifespanPattern, "");

  final type =
      element.collect("div.meaning-tags", (e) => _parseNameType(e.text.trim()));

  final wikipediaWord = element.collect("span.meaning-abstract > a",
      (e) => Uri.decodeFull(e.attributes["href"]!).split("/word/").last);

  return Name(japanese, reading, english, type, wikipediaWord);
}

final lifespanPattern = RegExp(r" \(\d+(?:\.\d+){,2}-(?:\d+(?:\.\d+){,2})?\)");

String? _parseNameType(String input) {
  if (input.contains("Unclassified")) {
    return null;
  }

  if (input.contains("gender not specified")) {
    return input.split(", ").first;
  }

  return input;
}
