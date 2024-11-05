part of "parser.dart";

Option<Sentence> parseSentenceDetails(Document document) =>
    document.queryOption(".entry.sentence").flatMap(_parseSentenceEntry).map(
          (sentence) => sentence.copyWith(
            kanji: document
                .querySelectorAll(".kanji_light_block > .entry.kanji_light")
                .map(_parseKanjiEntry)
                .whereSome()
                .toList(),
          ),
        );

Option<Sentence> _parseSentenceEntry(Element element) => Option.Do(($) {
      final english = $(element.queryOption(".english")).text.trim();
      final japanese = $(_parseSentenceFurigana(element));

      final copyright = element.queryOption(".inline_copyright a").flatMap(
            (element) => element.attributes.extract<String>("href").map(
                  (url) => SentenceCopyright(
                    name: element.text.trim(),
                    url: url,
                  ),
                ),
          );

      final id = element
          .queryOption(".light-details_link")
          .flatMap((element) => element.attributes.extract<String>("href"))
          .flatMap((url) => url.split("/").lastOption);

      return Sentence(
        japanese: japanese,
        english: english,
        id: id.toNullable(),
        copyright: copyright.toNullable(),
      );
    });
