part of "parser.dart";

Name _parseNameEntry(Element element) {
  final japaneseText = element
      .querySelector("div.concept_light-readings")!
      .transform((e) =>
          e.text.trim().replaceAll("\n", "").replaceAll(RegExp(r" +"), " "));

  final japanese = japaneseText.split("【").last.replaceFirst(RegExp(r"】$"), "");

  final reading =
      japaneseText.contains("【") ? japaneseText.split("【").first.trim() : null;

  final english = element
      .querySelectorAll("span.meaning-meaning")
      .map((e) => e.text.trim())
      .last
      .replaceFirst(_lifespanPattern, "");

  final type = element
      .querySelector("div.meaning-tags")
      ?.transform((e) => e.text.trim())
      .transform(_parseNameType);

  final wikipediaWord = element
      .querySelector("span.meaning-abstract > a")
      ?.transform((e) => e.attributes["href"])
      ?.transform(Uri.decodeFull)
      .transform((e) => e.split("/word/").last);

  return Name(japanese, reading, english, type, wikipediaWord);
}

final _lifespanPattern = RegExp(r" \(\d+(?:\.\d+){,2}-(?:\d+(?:\.\d+){,2})?\)");

String? _parseNameType(String input) {
  if (input.contains("Unclassified")) {
    return null;
  }

  if (input.contains("gender not specified")) {
    return input.split(", ").first;
  }

  return input;
}
