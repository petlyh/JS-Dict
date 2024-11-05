part of "parser.dart";

Option<Kanji> parseKanjiDetails(Document document) =>
    document.queryOption(".kanji.details").flatMap(_parseKanjiDetailsEntry);

Option<Kanji> _parseKanjiEntry(Element element) => Option.Do(($) {
      final kanji = $(
        element.queryOption(".literal_block > span > a"),
      ).text.trim();

      final strokeCountElement = $(element.queryOption(".strokes"));
      final strokeCountText = $(strokeCountElement.text.split(" ").firstOption);
      final strokeCount = $(strokeCountText.toIntOption);

      final infoText = element.queryOption(".info").map((e) => e.text.trim());

      final type = infoText.flatMap(_getKanjiType);

      final jlptLevel = infoText.flatMap(_parseJlptLevelText);

      final meanings = element
          .querySelectorAll(".meanings > span")
          .allTrimmedText
          .map((e) => e.replaceAll(",", ""))
          .toList();

      final kunReadings = _findReadings(element, "kun");
      final onReadings = _findReadings(element, "on");

      return Kanji(
        kanji: kanji,
        strokeCount: strokeCount,
        type: type.toNullable(),
        jlptLevel: jlptLevel.toNullable(),
        meanings: meanings,
        kunReadings: kunReadings,
        onReadings: onReadings,
      );
    });

Option<Kanji> _parseKanjiDetailsEntry(Element element) => Option.Do(($) {
      final kanji = $(element.queryOption(".character")).text.trim();

      final meanings = $(element.queryOption(".kanji-details__main-meanings"))
          .text
          .trim()
          .split(", ");

      final strokeCountElement = $(
        element.queryOption(".kanji-details__stroke_count > strong"),
      );

      final strokeCount = $(strokeCountElement.text.trim().toIntOption);

      final jlptLevel = element
          .queryOption(".jlpt > strong")
          .map((element) => element.text.trim())
          .flatMap(_parseJlptLevel);

      final type = element
          .queryOption(".grade")
          .map((element) => element.text.trim())
          .flatMap(_getKanjiType);

      final kunReadings = _findDetailReadings(element, "kun");
      final onReadings = _findDetailReadings(element, "on");

      final details = _parseKanjiDetails(element);

      return Kanji(
        kanji: kanji,
        strokeCount: strokeCount,
        type: type.toNullable(),
        jlptLevel: jlptLevel.toNullable(),
        meanings: meanings,
        kunReadings: kunReadings,
        onReadings: onReadings,
        details: details,
      );
    });

List<String> _findReadings(Element element, String type) =>
    element.querySelectorAll(".$type > .japanese_gothic > a").allTrimmedText;

List<String> _findDetailReadings(Element element, String type) => element
    .querySelectorAll(".kanji-details__main-readings > .${type}_yomi > dd > a")
    .allTrimmedText;

Option<JLPTLevel> _parseJlptLevel(String text) =>
    Option.fromNullable(JLPTLevel.fromString(text));

Option<JLPTLevel> _parseJlptLevelText(String text) => RegExp(r"JLPT (N\d)")
    .firstMatchOption(text.toUpperCase())
    .flatMap((match) => match.groupOption(1))
    .flatMap(_parseJlptLevel);

KanjiDetails _parseKanjiDetails(Element element) {
  final parts =
      element.querySelectorAll(".radicals > dl > dd > a").allTrimmedText;

  final variants =
      element.querySelectorAll(".variants > dd > a").allTrimmedText;

  final frequency = element
      .queryOption(".frequency > strong")
      .map((element) => element.text.trim())
      .flatMap((text) => text.toIntOption);

  final radical = element
      .queryOption(
        ".radicals > dl > dd > span",
      )
      .flatMap(_parseRadical);

  final onCompounds = _findCompounds(element, "On");
  final kunCompounds = _findCompounds(element, "Kun");

  return KanjiDetails(
    parts: parts,
    variants: variants,
    radical: radical.toNullable(),
    frequency: frequency.toNullable(),
    onCompounds: onCompounds,
    kunCompounds: kunCompounds,
  );
}

Option<Radical> _parseRadical(Element element) => Option.Do(
      ($) => Radical(
        character: $(
          element.nodes
              .where((node) => node.nodeType == Node.TEXT_NODE)
              .map((node) => node.textOption.getOrElse(() => "").trim())
              .where((text) => text.isNotEmpty)
              .firstOption,
        ),
        meanings: $(
          element.queryOption(".radical_meaning"),
        ).text.trim().split(", "),
      ),
    );

Option<KanjiType> _getKanjiType(String text) => text.contains("Jōyō")
    ? text.contains("junior high")
        ? some(const Jouyou.juniorHigh())
        : RegExp(r"grade (\d+)")
            .firstMatchOption(text)
            .flatMap((match) => match.groupOption(1))
            .flatMap((matchText) => matchText.toIntOption)
            .map(Jouyou.new)
    : text.contains("Jinmeiyō")
        ? some(const Jinmeiyou())
        : none();

List<Compound> _findCompounds(Element element, String type) => element
    .querySelectorAll(".row.compounds > .columns")
    .where(
      (columnElement) => columnElement
          .queryOption("h2")
          .map(
            (headerElement) =>
                headerElement.text.contains("$type reading compounds"),
          )
          .getOrElse(() => false),
    )
    .firstOption
    .map(_parseCompounds)
    .getOrElse(() => []);

List<Compound> _parseCompounds(Element column) => column
    .querySelectorAll("ul > li")
    .map(
      (element) => Option.Do(($) {
        final lines = element.text.trim().split("\n");

        return Compound(
          compound: $(lines.getOption(0)).trim(),
          reading: $(lines.getOption(1))
              .trim()
              .replaceAll("【", "")
              .replaceAll("】", ""),
          meanings: $(lines.getOption(2)).trim().split(", "),
        );
      }),
    )
    .whereSome()
    .toList();
