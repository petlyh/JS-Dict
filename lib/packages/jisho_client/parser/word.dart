part of "parser.dart";

Option<Word> parseWordDetails(Document document) => document
    .queryOption(".concept_light")
    .flatMap(_parseWordEntry)
    .map(
      (word) => word.copyWith(
        details: WordDetails(
          kanji: document
              .querySelectorAll(".kanji_light_block > .entry.kanji_light")
              .map(_parseKanjiEntry)
              .whereSome()
              .toList(),
          wikipedia: document
              .querySelectorAll(".meaning-tags")
              .where((element) => element.text.contains("Wikipedia definition"))
              .firstOption
              .flatMap((element) => element.nextElementSiblingOption)
              .flatMap(_parseWikipediaInfo)
              .toNullable(),
        ),
      ),
    );

Option<Word> _parseWordEntry(Element element) => Option.Do(($) {
      final word = $(_parseWordFurigana(element));

      final isCommon = element.hasElement(".concept_light-common");

      final audioUrl = element
          .queryOption("audio > source")
          .flatMap((e) => e.attributes.extract<String>("src"))
          .map((src) => "https:$src");

      final jlptLevel = element
          .querySelectorAll(".concept_light-tag")
          .where((e) => e.text.contains("JLPT"))
          .firstOption
          .flatMap((e) => e.text.trim().split(" ").lastOption)
          .flatMap(_parseJlptLevel);

      final wanikaniLevels = element
          .querySelectorAll("a[href='http://wanikani.com/']")
          .map(
            (e) => e.text
                .trim()
                .split(" ")
                .getOption(2)
                .flatMap((text) => text.toIntOption),
          )
          .whereSome()
          .toList();

      final notes = element
          .queryOption(".meaning-representation_notes > span")
          .map((e) => e.text.trim())
          .map(_parseNotes)
          .getOrElse(() => []);

      final definitionElements = element.querySelectorAll(".meaning-wrapper");

      final otherForms = definitionElements
          .where((e) => e.previousElementSibling?.text == "Other forms")
          .firstOption
          .flatMap(_parseOtherForms)
          .getOrElse(() => []);

      final wikipediaElement = element
          .querySelectorAll(".meaning-tags")
          .where((e) => e.text.contains("Wikipedia definition"))
          .firstOption
          .flatMap((e) => e.nextElementSiblingOption);

      final hasWikipedia =
          wikipediaElement.map((e) => e.hasElement("a")).getOrElse(() => false);

      final definitions = $(
        definitionElements
            .where(
              (e) =>
                  e.previousElementSiblingOption
                      .map(
                        (previousElement) => ![
                          "Other forms",
                          "Wikipedia definition",
                        ].contains(previousElement.text),
                      )
                      .getOrElse(() => true) &&
                  !e.hasElement(".meaning-representation_notes"),
            )
            .fold(some(<Definition>[]), _parseDefinition)
            .flatMap((defs) => Option.fromPredicate(defs, (l) => l.isNotEmpty))
            .alt(
              () => wikipediaElement
                  .flatMap((e) => _parseWikipediaDefinition(e).map((d) => [d])),
            ),
      );

      final id = element
          .queryOption(".light-details_link")
          .flatMap((e) => e.attributes.extract<String>("href"))
          .flatMap((text) => text.split("/").lastOption)
          .map(Uri.decodeComponent);

      final inflectionCode = element
          .queryOption(".show_inflection_table")
          .flatMap((e) => e.attributes.extract<String>("data-pos"));

      final collocations = element
          .querySelectorAll(".concept_light-status_link")
          .where((e) => e.text.contains("collocation"))
          .firstOption
          .flatMap((e) => e.attributes.extract<String>("data-reveal-id"))
          .map(_parseCollocations.curry(element))
          .getOrElse(() => []);

      return Word(
        word: word,
        definitions: definitions,
        otherForms: otherForms,
        isCommon: isCommon,
        wanikaniLevels: wanikaniLevels,
        jlptLevel: jlptLevel.toNullable(),
        audioUrl: audioUrl.toNullable(),
        notes: notes,
        collocations: collocations,
        id: id.toNullable(),
        inflectionCode: inflectionCode.toNullable(),
        hasWikipedia: hasWikipedia,
      );
    });

List<Collocation> _parseCollocations(Element element, String revealId) =>
    element
        .querySelectorAll("#$revealId > ul > li > a")
        .map(
          (e) => Option.Do(($) {
            final split = e.text.trim().split(" - ");

            return Collocation(
              word: $(split.firstOption),
              meaning: $(split.getOption(1)),
            );
          }),
        )
        .whereSome()
        .toList();

List<Note> _parseNotes(String text) => text
    .trim()
    .replaceFirst(RegExp(r"\.$"), "")
    .split(". ")
    .deduplicated
    .map(_parseNote)
    .whereSome()
    .toList();

Option<Note> _parseNote(String text) => Option.Do(($) {
      final split = text.split(": ");
      return Note(form: $(split.firstOption), note: $(split.lastOption));
    });

Option<Definition> _parseWikipediaDefinition(Element element) => element
    .queryOption(".meaning-meaning")
    .map((e) => Definition(meanings: [e.text.trim()], types: ["Word"]));

Option<List<Definition>> _parseDefinition(
  Option<List<Definition>> previousOption,
  Element element,
) =>
    previousOption.flatMap(
      (previous) => Option.Do(($) {
        final meanings = $(
          element.queryOption(".meaning-meaning"),
        ).text.trim().split("; ");

        final types = element.previousElementSiblingOption
            .flatMap(
              (previousElement) => Option.fromPredicate(
                previousElement,
                (e) => e.classes.contains("meaning-tags"),
              ),
            )
            .map(
              (previousElement) => previousElement.text
                  .split(", ")
                  .map((text) => text.trim())
                  .toList()
                  .deduplicated,
            )
            .alt(
              () => previous.lastOption
                  .map((previousDefinition) => previousDefinition.types),
            )
            .getOrElse(() => []);

        final tags = element
            .querySelectorAll(".tag-tag, .tag-info, .tag-source")
            .allTrimmedText;

        final seeAlso = element
            .querySelectorAll(".tag-see_also > a")
            .allTrimmedText
            .deduplicated;

        final exampleSentence = element.queryOption(".sentence").flatMap(
              (e) => Option.Do(
                ($) => Sentence(
                  japanese: $(_parseSentenceFurigana(e)),
                  english: $(e.queryOption(".english")).text.trim(),
                ),
              ),
            );

        return [
          ...previous,
          Definition(
            meanings: meanings,
            types: types.toList(),
            tags: tags,
            seeAlso: seeAlso.toList(),
            exampleSentence: exampleSentence.toNullable(),
          ),
        ];
      }),
    );

Option<List<OtherForm>> _parseOtherForms(Element element) => Option.Do(
      ($) => element.querySelectorAll(".break-unit").map((e) {
        final split = e.text.trim().replaceFirst("】", "").split(" 【");

        return OtherForm(
          form: $(split.firstOption),
          reading: split.getOption(1).getOrElse(() => ""),
        );
      }).toList(),
    );
