part of "parser.dart";

Option<Name> _parseNameEntry(Element element) => Option.Do(($) {
      final japaneseText = $(element.queryOption(".concept_light-readings"))
          .text
          .trim()
          .replaceAll("\n", "")
          .replaceAll(RegExp(" +"), " ");

      final japanese = $(japaneseText.split("【").lastOption).replaceFirst(
        RegExp(r"】$"),
        "",
      );

      final reading = Option.fromPredicate(
        japaneseText,
        (text) => text.contains("【"),
      )
          .flatMap((text) => text.split("【").firstOption)
          .map((text) => text.trim());

      final english = $(
        element.querySelectorAll(".meaning-meaning").allTrimmedText.lastOption,
      ).replaceFirst(_lifespanPattern, "");

      final type = element
          .queryOption(".meaning-tags")
          .map((element) => element.text.trim())
          .flatMap(_parseNameType);

      final wordId = element
          .queryOption(".meaning-abstract > a")
          .flatMap((element) => element.attributes.extract<String>("href"))
          .map(Uri.decodeFull)
          .flatMap((url) => url.split("/word/").lastOption);

      return Name(
        japanese: japanese,
        english: english,
        reading: reading.toNullable(),
        type: type.toNullable(),
        wordId: wordId.toNullable(),
      );
    });

final _lifespanPattern = RegExp(r" \(\d+(?:\.\d+){,2}-(?:\d+(?:\.\d+){,2})?\)");

Option<String> _parseNameType(String input) {
  if (input.contains("Unclassified")) {
    return none();
  }

  if (input.contains("gender not specified")) {
    return input.split(", ").firstOption;
  }

  return some(input);
}
