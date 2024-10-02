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
  final kanji =
      element.querySelector("div.literal_block > span > a")!.trimmedText;

  final strokeCount = element
      .querySelector(".strokes")!
      .transform((e) => int.parse(e.text.split(" ").first));

  final type = element.querySelector("div.info")?.transform(_getKanjiType);

  final jlptLevel = element
      .querySelector("div.info")
      ?.trimmedText
      .transform(JLPTLevel.fromText);

  final meanings = element
      .querySelectorAll("div.meanings > span")
      .allTrimmedText
      .map((e) => e.replaceAll(",", ""))
      .toList();

  final kunReadings = element
      .querySelectorAll("div.kun > span.japanese_gothic > a")
      .allTrimmedText;

  final onReadings = element
      .querySelectorAll("div.on > span.japanese_gothic > a")
      .allTrimmedText;

  return Kanji(
    kanji: kanji,
    strokeCount: strokeCount,
    type: type,
    jlptLevel: jlptLevel,
    meanings: meanings,
    kunReadings: kunReadings,
    onReadings: onReadings,
  );
}

Kanji _parseKanjiDetailsEntry(Element element) {
  final kanji = element.querySelector("h1.character")!.trimmedText;

  final meanings = element
      .querySelector(".kanji-details__main-meanings")!
      .trimmedText
      .split(", ");

  final strokeCount = element
      .querySelector(".kanji-details__stroke_count > strong")!
      .trimmedText
      .transform(int.parse);

  final jlptLevel = element
      .querySelector("div.jlpt > strong")
      ?.trimmedText
      .transform(JLPTLevel.fromString);

  final type = element.querySelector("div.grade")?.transform(_getKanjiType);

  final kunReadings = element
      .querySelectorAll(
        "div.kanji-details__main-readings > dl.kun_yomi > dd > a",
      )
      .allTrimmedText;

  final onReadings = element
      .querySelectorAll(".kanji-details__main-readings > dl.on_yomi > dd > a")
      .allTrimmedText;

  final details = _parseKanjiDetails(element);

  return Kanji(
    kanji: kanji,
    strokeCount: strokeCount,
    type: type,
    jlptLevel: jlptLevel,
    meanings: meanings,
    kunReadings: kunReadings,
    onReadings: onReadings,
    details: details,
  );
}

KanjiDetails _parseKanjiDetails(Element element) {
  final parts =
      element.querySelectorAll("div.radicals > dl > dd > a").allTrimmedText;

  final variants =
      element.querySelectorAll("dl.variants > dd > a").allTrimmedText;

  final frequency = element
      .querySelector("div.frequency > strong")
      ?.trimmedText
      .transform(int.parse);

  final radical = element
      .querySelector("div.radicals > dl > dd > span")
      ?.transform(_parseRadical);

  final onCompounds = _findCompounds(element, "On");
  final kunCompounds = _findCompounds(element, "Kun");

  return KanjiDetails(
    parts: parts,
    variants: variants,
    radical: radical,
    frequency: frequency,
    onCompounds: onCompounds,
    kunCompounds: kunCompounds,
  );
}

Radical _parseRadical(Element element) => Radical(
      character: element.nodes.allTrimmedText.firstWhere(
        (text) => text.isNotEmpty,
      ),
      meanings: element
          .querySelector("span.radical_meaning")!
          .trimmedText
          .split(", "),
    );

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
    return const Jinmeiyou();
  }

  return null;
}

List<Compound> _findCompounds(Element element, String type) =>
    element
        .querySelectorAll("div.row.compounds > div.columns")
        .firstWhereOrNull(
          (e) =>
              e.querySelector("h2")!.text.contains("$type reading compounds"),
        )
        ?.transform(_parseCompounds) ??
    [];

List<Compound> _parseCompounds(Element column) =>
    column.querySelectorAll("ul > li").map((e) {
      final lines = e.trimmedText.split("\n");
      assert(lines.length == 3);

      return Compound(
        compound: lines[0].trim(),
        reading: lines[1].trim().replaceAll("【", "").replaceAll("】", ""),
        meanings: lines[2].trim().split(", "),
      );
    }).toList();
