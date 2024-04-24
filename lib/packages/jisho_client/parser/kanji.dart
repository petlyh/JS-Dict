part of "parser.dart";

Kanji parseKanjiDetails(Document document) {
  final kanji = document
      .querySelector("div.kanji.details")
      ?.transform(_parseKanjiDetailsEntry);

  if (kanji == null) {
    throw Exception("Kanji not found");
  }

  return kanji;
}

Kanji _parseKanjiEntry(Element element) {
  final literal =
      element.querySelector("div.literal_block > span > a")?.trimmedText;

  final kanji = Kanji(literal!);

  kanji.meanings = element
      .querySelectorAll("div.meanings > span")
      .allTrimmedText
      .map((e) => e.replaceAll(",", ""))
      .toList();

  kanji.kunReadings = element
      .querySelectorAll("div.kun > span.japanese_gothic > a")
      .allTrimmedText;

  kanji.onReadings = element
      .querySelectorAll("div.on > span.japanese_gothic > a")
      .allTrimmedText;

  kanji.strokeCount = element
      .querySelector(".strokes")!
      .transform((e) => int.parse(e.text.split(" ").first))!;

  kanji.jlptLevel = element
          .querySelector("div.info")
          ?.trimmedText
          .transform(JLPTLevel.findInText) ??
      JLPTLevel.none;

  kanji.type = element.querySelector("div.info")?.transform(_getKanjiType);

  return kanji;
}

Kanji _parseKanjiDetailsEntry(Element element) {
  final character = element.querySelector("h1.character")!.trimmedText;

  final kanji = Kanji(character);

  kanji.meanings = element
      .querySelector(".kanji-details__main-meanings")!
      .trimmedText
      .split(", ");

  kanji.strokeCount = element
      .querySelector(".kanji-details__stroke_count > strong")!
      .trimmedText
      .transform(int.parse);

  kanji.jlptLevel = element
          .querySelector("div.jlpt > strong")
          ?.trimmedText
          .transform(JLPTLevel.fromString) ??
      JLPTLevel.none;

  kanji.type = element.querySelector("div.grade")?.transform(_getKanjiType);

  kanji.kunReadings = element
      .querySelectorAll(
          "div.kanji-details__main-readings > dl.kun_yomi > dd > a")
      .allTrimmedText;

  kanji.onReadings = element
      .querySelectorAll(".kanji-details__main-readings > dl.on_yomi > dd > a")
      .allTrimmedText;

  final details = KanjiDetails();

  details.parts =
      element.querySelectorAll("div.radicals > dl > dd > a").allTrimmedText;

  details.variants =
      element.querySelectorAll("dl.variants > dd > a").allTrimmedText;

  details.frequency = element
      .querySelector("div.frequency > strong")
      ?.trimmedText
      .transform(int.parse);

  details.radical =
      element.querySelector("div.radicals > dl > dd > span")?.transform((e) {
    final character = e.nodes
        .firstWhere((node) =>
            node.nodeType == Node.TEXT_NODE && node.text!.trim().isNotEmpty)
        .text!
        .trim();
    final meanings =
        e.querySelector("span.radical_meaning")!.trimmedText.split(", ");
    return Radical(character, meanings);
  });

  details.onCompounds = _findCompounds(element, "On");
  details.kunCompounds = _findCompounds(element, "Kun");

  kanji.details = details;
  return kanji;
}

KanjiType? _getKanjiType(Element element) {
  final text = element.text;

  if (text.contains("Jōyō")) {
    if (text.contains("junior high")) {
      return const Jouyou.juniorHigh();
    }

    final grade = RegExp(r"grade (\d+)").firstMatch(text)!.group(1)!;
    return Jouyou(int.parse(grade));
  }

  if (text.contains("Jinmeiyō")) {
    return Jinmeiyou();
  }

  return null;
}

List<Compound> _findCompounds(Element element, String type) =>
    element
        .querySelectorAll("div.row.compounds > div.columns")
        .firstWhereOrNull((e) =>
            e.querySelector("h2")!.text.contains("$type reading compounds"))
        ?.transform(((column) => column.querySelectorAll("ul > li").map((e) {
              final lines = e.trimmedText.split("\n");
              assert(lines.length == 3);

              final compound = lines[0].trim();
              final reading =
                  lines[1].trim().replaceAll("【", "").replaceAll("】", "");
              final meanings = lines[2].trim().split(", ");

              return Compound(compound, reading, meanings);
            }).toList())) ??
    [];
