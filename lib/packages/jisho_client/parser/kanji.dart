part of "parser.dart";

Kanji parseKanjiDetails(Document document) {
  final kanji =
      document.body!.collect("div.kanji.details", _parseKanjiDetailsEntry);

  if (kanji == null) {
    throw Exception("Kanji not found");
  }

  return kanji;
}

Kanji _parseKanjiEntry(Element element) {
  final literal =
      element.collect("div.literal_block > span > a", (e) => e.text.trim())!;
  final kanji = Kanji(literal);

  kanji.meanings = element.collectAll(
      "div.meanings > span", (e) => e.text.trim().replaceAll(",", ""));
  kanji.kunReadings = element.collectAll(
      "div.kun > span.japanese_gothic > a", (e) => e.text.trim());
  kanji.onReadings = element.collectAll(
      "div.on > span.japanese_gothic > a", (e) => e.text.trim());

  kanji.strokeCount =
      element.collect(".strokes", (e) => int.parse(e.text.split(" ").first))!;
  kanji.jlptLevel =
      element.collect("div.info", (e) => JLPTLevel.findInText(e.text)) ??
          JLPTLevel.none;
  kanji.type = element.collect<KanjiType?>("div.info", _getKanjiType);

  return kanji;
}

Kanji _parseKanjiDetailsEntry(Element element) {
  final kanji = Kanji(element.collect("h1.character", (e) => e.text.trim())!);

  kanji.meanings = element.collect(
      ".kanji-details__main-meanings", (e) => e.text.trim().split(", "))!;

  kanji.strokeCount = element.collect(".kanji-details__stroke_count > strong",
      (e) => int.parse(e.text.trim()))!;
  kanji.jlptLevel = element.collect(
          "div.jlpt > strong", (e) => JLPTLevel.fromString(e.text.trim())) ??
      JLPTLevel.none;
  kanji.type = element.collect<KanjiType?>("div.grade", _getKanjiType);

  kanji.kunReadings = element.collectAll(
      "div.kanji-details__main-readings > dl.kun_yomi > dd > a",
      (e) => e.text.trim());
  kanji.onReadings = element.collectAll(
      "div.kanji-details__main-readings > dl.on_yomi > dd > a",
      (e) => e.text.trim());

  final details = KanjiDetails();

  details.parts =
      element.collectAll("div.radicals > dl > dd > a", (e) => e.text.trim());
  details.variants =
      element.collectAll("dl.variants > dd > a", (e) => e.text.trim());

  details.frequency = element.collect(
      "div.frequency > strong", (e) => int.parse(e.text.trim()));

  details.radical = element.collect("div.radicals > dl > dd > span", (e) {
    final character = e.nodes
        .firstWhere((node) =>
            node.nodeType == Node.TEXT_NODE && node.text!.trim().isNotEmpty)
        .text!
        .trim();
    final meanings =
        e.querySelector("span.radical_meaning")!.text.trim().split(", ");
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
    element.collectFirstWhere(
      "div.row.compounds > div.columns",
      (e) => e.querySelector("h2")!.text.contains("$type reading compounds"),
      (column) => column.collectAll("ul > li", (e) {
        final lines = e.text.trim().split("\n");
        assert(lines.length == 3);

        final compound = lines[0].trim();
        final reading = lines[1].trim().replaceAll("【", "").replaceAll("】", "");
        final meanings = lines[2].trim().split(", ");

        return Compound(compound, reading, meanings);
      }),
    ) ??
    [];
