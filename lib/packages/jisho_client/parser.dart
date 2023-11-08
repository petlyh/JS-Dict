import "package:html/dom.dart";
import "package:jsdict/packages/remove_tags.dart";
import "package:jsdict/packages/jisho_client/parsing_helper.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/list_extensions.dart";

import "furigana.dart";

class Parser {
  static SearchResponse<T> search<T extends SearchType>(Document document) {
    final response = SearchResponse<T>();
    final body = document.body!;

    response.conversion =
        body.collect("#number_conversion, #year_conversion", (e) {
      final data = e.text.trim().split(" is ");
      assert(data.length == 2);
      return (original: data[0], converted: data[1]);
    });

    response.zenEntries = body.collectAll(
      "#zen_bar span.japanese_word__text_wrapper > a",
      (e) => e.attributes["data-word"]!,
    );

    response.noMatchesFor = body.collect("#no-matches", (e) {
          final noMatchesText = e.text.trim().replaceFirst(RegExp(r"\.$"), "");
          return noMatchesText.split(RegExp(", | or |matching ")).sublist(2);
        }) ??
        [];

    if (response.noMatchesFor.isNotEmpty) {
      return response;
    }

    response.correction = body.collect("#the_corrector", (e) {
      final effective =
          e.collect("p > strong > span", (e2) => e2.text.trim()) ?? "";
      final original = removeTypeTags(
          e.collect("span.meant > a", (e2) => e2.text.trim()) ?? "");

      if (original.isNotEmpty) {
        return Correction(effective, original, false);
      }

      return Correction(
        effective,
        e
            .collect(
                "p",
                (e2) => RegExp(r"No matches for (.+?)\.")
                    .firstMatch(e2.text.trim()))!
            .group(1)!,
        true,
      );
    });

    response.grammarInfo = body.collect(
        "div.grammar-breakdown",
        (e) => GrammarInfo(
              e.collect("h6",
                  (e2) => e2.text.split(" could be an inflection").first)!,
              e.collect("h6 > a", (e2) => e2.text.trim())!,
              e.collectAll("ul > li", (e2) => e2.text.trim()),
            ));

    response.hasNextPage = document.querySelector("a.more") != null;

    switch (T) {
      case Kanji:
        response.addResults(
            body.collectAll<Kanji>("div.kanji.details", _kanjiDetailsEntry));
        if (response.results.isNotEmpty) break;
        response.addResults(body.collectAll<Kanji>(
            "div.kanji_light_block > div.entry.kanji_light", _kanjiEntry));
        break;
      case Word:
        response.addResults(body.collectAll<Word>(
            "div.concepts > .concept_light, div.exact_block > .concept_light",
            _wordEntry));
        break;
      case Sentence:
        response.addResults(body.collectAll<Sentence>(
            "div.sentences_block > ul > li.entry.sentence", _sentenceEntry));
        break;
      case Name:
        response.addResults(body.collectAll<Name>(
            "div.names_block > div.names > div.concept_light", _nameEntry));
    }

    return response;
  }

  static Name _nameEntry(Element element) {
    final japaneseText = element.collect(
        "div.concept_light-readings",
        (e) =>
            e.text.trim().replaceAll("\n", "").replaceAll(RegExp(r" +"), " "))!;

    final japanese =
        japaneseText.split("【").last.replaceFirst(RegExp(r"】$"), "");

    final reading = japaneseText.contains("【")
        ? japaneseText.split("【").first.trim()
        : null;

    final english =
        element.collectAll("span.meaning-meaning", (e) => e.text.trim()).last;

    final type = element.collect("div.meaning-tags",
        (e) => !e.text.contains("Unclassified") ? e.text.trim() : null);

    final wikipediaWord = element.collect("span.meaning-abstract > a",
        (e) => Uri.decodeFull(e.attributes["href"]!).split("/word/").last);

    return Name(japanese, reading, english, type, wikipediaWord);
  }

  static Kanji _kanjiEntry(Element element) {
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

  static Sentence _sentenceEntry(Element element) {
    final english = element.collect("span.english", (e) => e.text.trim())!;
    final japanese = parseSentenceFurigana(element);

    final copyright = element.collect("span.inline_copyright a",
        (e) => SentenceCopyright(e.text.trim(), e.attributes["href"]!));
    final id = element.collect("a.light-details_link",
            (e) => e.attributes["href"]!.split("/").last) ??
        "";

    return Sentence.copyright(id, japanese, english, copyright);
  }

  static final strokeDiagramUrlRegex = RegExp(r"var url = '(.+?)';");

  static Kanji kanjiDetails(Document document) {
    final kanji =
        document.body!.collect("div.kanji.details", _kanjiDetailsEntry);

    if (kanji == null) {
      throw Exception("Kanji not found");
    }

    final strokeDiagramUrl = document.body!.collectFirstWhere(
        "script",
        (e) => strokeDiagramUrlRegex.firstMatch(e.text) != null,
        (e) => strokeDiagramUrlRegex.firstMatch(e.text)!.group(1));

    if (strokeDiagramUrl != null) {
      kanji.strokeDiagramUrl = "https:$strokeDiagramUrl";
    }

    return kanji;
  }

  static Kanji _kanjiDetailsEntry(Element element) {
    final kanjiDetails =
        Kanji(element.collect("h1.character", (e) => e.text.trim())!);

    kanjiDetails.meanings = element.collect(
        ".kanji-details__main-meanings", (e) => e.text.trim().split(", "))!;

    kanjiDetails.strokeCount = element.collect(
        ".kanji-details__stroke_count > strong",
        (e) => int.parse(e.text.trim()))!;
    kanjiDetails.jlptLevel = element.collect(
            "div.jlpt > strong", (e) => JLPTLevel.fromString(e.text.trim())) ??
        JLPTLevel.none;
    kanjiDetails.type = element.collect<KanjiType?>("div.grade", _getKanjiType);

    kanjiDetails.kunReadings = element.collectAll(
        "div.kanji-details__main-readings > dl.kun_yomi > dd > a",
        (e) => e.text.trim());
    kanjiDetails.onReadings = element.collectAll(
        "div.kanji-details__main-readings > dl.on_yomi > dd > a",
        (e) => e.text.trim());

    kanjiDetails.parts =
        element.collectAll("div.radicals > dl > dd > a", (e) => e.text.trim());
    kanjiDetails.variants =
        element.collectAll("dl.variants > dd > a", (e) => e.text.trim());

    kanjiDetails.frequency = element.collect(
        "div.frequency > strong", (e) => int.parse(e.text.trim()));

    kanjiDetails.radical =
        element.collect("div.radicals > dl > dd > span", (e) {
      final character = e.nodes
          .firstWhere((node) =>
              node.nodeType == Node.TEXT_NODE && node.text!.trim().isNotEmpty)
          .text!
          .trim();
      final meanings =
          e.querySelector("span.radical_meaning")!.text.trim().split(", ");
      return Radical(character, meanings);
    });

    kanjiDetails.onCompounds = _findCompounds(element, "On");
    kanjiDetails.kunCompounds = _findCompounds(element, "Kun");

    return kanjiDetails;
  }

  static KanjiType? _getKanjiType(Element element) {
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

  static List<Compound> _findCompounds(Element element, String type) {
    return element.collectFirstWhere(
          "div.row.compounds > div.columns",
          (e) =>
              e.querySelector("h2")!.text.contains("$type reading compounds"),
          (column) => column.collectAll("ul > li", (e) {
            final lines = e.text.trim().split("\n");
            assert(lines.length == 3);

            final compound = lines[0].trim();
            final reading =
                lines[1].trim().replaceAll("【", "").replaceAll("】", "");
            final meanings = lines[2].trim().split(", ");

            return Compound(compound, reading, meanings);
          }),
        ) ??
        [];
  }

  static List<OtherForm> _parseOtherForms(Element element) {
    return element.collectAll("span.break-unit", (e) {
      final split = e.text.trim().replaceFirst("】", "").split(" 【");
      final form = split.first;
      final reading = split.length == 2 ? split.last : "";
      return OtherForm(form, reading);
    });
  }

  static Word _wordEntry(Element element) {
    final furigana = parseWordFurigana(element);
    final word = Word(furigana);

    word.commonWord =
        element.querySelector("span.concept_light-common") != null;

    word.audioUrl = element.collect(
            "audio > source", (e) => "https:${e.attributes["src"]!}") ??
        "";

    word.jlptLevel = element.collectFirstWhere(
          "span.concept_light-tag",
          (e) => e.text.contains("JLPT"),
          (e) => JLPTLevel.fromString(e.text.trim().split(" ")[1]),
        ) ??
        JLPTLevel.none;

    word.wanikaniLevels = element.collectWhere(
      "span.concept_light-tag",
      (e) => e.text.contains("Wanikani"),
      (e) => int.parse(e.children.first.text.trim().split(" ")[2]),
    );

    final definitionElements = element.querySelectorAll("div.meaning-wrapper");

    for (final definitionElement in definitionElements) {
      final previousElement = definitionElement.previousElementSibling;
      if (previousElement?.text == "Other forms") {
        word.otherForms = _parseOtherForms(definitionElement);
        continue;
      }

      final notesElement = definitionElement
          .querySelector("div.meaning-representation_notes > span");
      if (notesElement != null) {
        word.notes = Note.parseAll(notesElement.text.trim());
        continue;
      }

      final definition = Definition();

      if (previousElement != null &&
          previousElement.classes.contains("meaning-tags")) {
        final tagsText = definitionElement.previousElementSibling!.text;
        definition.types =
            tagsText.split(", ").map((e) => e.trim()).toList().deduplicate();
      }

      if (definition.types.isEmpty && word.definitions.isNotEmpty) {
        definition.types = word.definitions.last.types;
      }

      final meaningsElement =
          definitionElement.querySelector("span.meaning-meaning");
      definition.meanings = meaningsElement!.text.trim().split("; ");

      definition.tags = definitionElement.collectAll(
          "span.tag-tag, span.tag-info, span.tag-source", (e) => e.text.trim());
      definition.seeAlso = definitionElement.collectAll(
          "span.tag-see_also > a", (e) => e.text.trim());
      // deduplicate
      definition.seeAlso = definition.seeAlso.deduplicate();

      if (definition.types.contains("Wikipedia definition") &&
          definitionElement.querySelector("span.meaning-abstract") != null) {
        final wikipediaDefinition =
            WikipediaDefinition(definition.meanings.first);
        wikipediaDefinition.textAbstract = definitionElement.collect(
            "span.meaning-abstract", (e) => e.nodes.first.text!);
        wikipediaDefinition.wikipediaEnglish =
            _wikipediaPage(definitionElement, "English Wikipedia");
        wikipediaDefinition.wikipediaJapanese =
            _wikipediaPage(definitionElement, "Japanese Wikipedia");
        wikipediaDefinition.dbpedia =
            _wikipediaPage(definitionElement, "DBpedia");
        definition.wikipedia = wikipediaDefinition;
      }

      definition.exampleSentence = definitionElement.collect(
          "div.sentence",
          (e) => Sentence.example(parseSentenceFurigana(e),
              e.querySelector("span.english")!.text.trim()));

      word.definitions.add(definition);
    }

    word.id = element.collect("a.light-details_link",
        (e) => Uri.decodeComponent(e.attributes["href"]!.split("/").last));

    word.inflectionId = element.collect(
            "a.show_inflection_table", (e) => e.attributes["data-pos"]!) ??
        "";

    word.collocations = element.collectFirstWhere(
          ".concept_light-status_link",
          (e) => e.text.contains("collocation"),
          (e) {
            final selector =
                "#${e.attributes["data-reveal-id"]!} > ul > li > a";
            return element.collectAll(selector, (e2) {
              final split = e2.text.trim().split(" - ");
              assert(split.length == 2);
              return Collocation(split[0], split[1]);
            });
          },
        ) ??
        [];

    return word;
  }

  static WikipediaPage? _wikipediaPage(Element definitionElement, String name) {
    return definitionElement.collectFirstWhere(
      "span.meaning-abstract > a",
      (e) => e.text.contains(name),
      (e) => WikipediaPage(RegExp("“(.+?)”").firstMatch(e.text)!.group(1)!,
          e.attributes["href"]!),
    );
  }

  static Word wordDetails(Document document) {
    final word = document.body!.collect("div.concept_light", _wordEntry);

    if (word == null) {
      throw Exception("Word not found");
    }

    word.kanji = document.body!.collectAll(
        "div.kanji_light_block > div.entry.kanji_light", _kanjiEntry);
    return word;
  }
}
