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
      final original = removeTags(data[0]);
      final converted = data[1];
      return (original: original, converted: converted);
    });

    response.zenEntries = body.collectAll(
      "#zen_bar span.japanese_word__text_wrapper > a",
      (e) => e.attributes["data-word"]!,
    );

    if (response.zenEntries.length == 1) {
      response.zenEntries.clear();
    }

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
      case const (Kanji):
        response.addResults(
            body.collectAll<Kanji>("div.kanji.details", _kanjiDetailsEntry));
        if (response.results.isNotEmpty) break;
        response.addResults(body.collectAll<Kanji>(
            "div.kanji_light_block > div.entry.kanji_light", _kanjiEntry));
        break;
      case const (Word):
        response.addResults(body.collectAll<Word>(
            "div.concepts > .concept_light, div.exact_block > .concept_light",
            _wordEntry));
        break;
      case const (Sentence):
        response.addResults(body.collectAll<Sentence>(
            "div.sentences_block > ul > li.entry.sentence", _sentenceEntry));
        break;
      case const (Name):
        response.addResults(body.collectAll<Name>(
            "div.names_block > div.names > div.concept_light", _nameEntry));
    }

    return response;
  }

  static final lifespanPattern =
      RegExp(r" \(\d+(?:\.\d+){,2}-(?:\d+(?:\.\d+){,2})?\)");

  static String? _nameType(String input) {
    if (input.contains("Unclassified")) {
      return null;
    }

    if (input.contains("gender not specified")) {
      return input.split(", ").first;
    }

    return input;
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

    final english = element
        .collectAll("span.meaning-meaning", (e) => e.text.trim())
        .last
        .replaceFirst(lifespanPattern, "");

    final type =
        element.collect("div.meaning-tags", (e) => _nameType(e.text.trim()));

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

    return kanji;
  }

  static Kanji _kanjiDetailsEntry(Element element) {
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
        "audio > source", (e) => "https:${e.attributes["src"]!}");

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
      definition.seeAlso = definition.seeAlso.deduplicate();

      // don't add wikipedia definition since it's handled separately
      if (definition.types.contains("Wikipedia definition")) {
        // except if there are no other definitions
        if (word.definitions.isEmpty) {
          definition.types = ["Word"];
          word.definitions.add(definition);
        }

        continue;
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

    final wikipediaTagElement = element.collectFirstWhere("div.meaning-tags",
        (e) => e.text.contains("Wikipedia definition"), (e) => e);

    if (wikipediaTagElement != null) {
      final wikipediaElement = wikipediaTagElement.nextElementSibling!;

      if (wikipediaElement.getElementsByTagName("a").isNotEmpty) {
        word.hasWikipedia = true;
      }
    }

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

    word.details = WordDetails();

    word.details!.kanji = document.body!.collectAll(
        "div.kanji_light_block > div.entry.kanji_light", _kanjiEntry);

    final wikipediaTagElement = document.body!.collectFirstWhere(
        "div.meaning-tags",
        (e) => e.text.contains("Wikipedia definition"),
        (e) => e);

    if (wikipediaTagElement != null) {
      word.details!.wikipedia =
          wikipediaInfo(wikipediaTagElement.nextElementSibling!);
    }

    return word;
  }

  static WikipediaInfo? wikipediaInfo(Element element) {
    if (element.querySelector("span.meaning-abstract") == null) {
      return null;
    }

    final title =
        element.collect("span.meaning-meaning", (e) => e.text.trim())!;
    final wikipedia = WikipediaInfo(title);

    wikipedia.textAbstract = _fixWikipediaAbstract(title,
        element.collect("span.meaning-abstract", (e) => e.nodes.first.text!));

    wikipedia.wikipediaEnglish = _wikipediaPage(element, "English Wikipedia");
    wikipedia.wikipediaJapanese = _wikipediaPage(element, "Japanese Wikipedia");
    wikipedia.dbpedia = _wikipediaPage(element, "DBpedia");

    return wikipedia;
  }

  static final _abstractFixPattern = RegExp(r"^(?:is |was |, |\()");

  static String? _fixWikipediaAbstract(String title, String? text) {
    if (text == null) {
      return null;
    }

    return _abstractFixPattern.hasMatch(text) ? "$title $text" : text;
  }

  static Sentence sentenceDetails(Document document) {
    final sentence =
        document.body!.collect("li.entry.sentence", _sentenceEntry);

    if (sentence == null) {
      throw Exception("Sentence not found");
    }

    final kanji = document.body!.collectAll(
        "div.kanji_light_block > div.entry.kanji_light", _kanjiEntry);

    if (kanji.isNotEmpty) {
      return sentence.withKanji(kanji);
    }

    return sentence;
  }
}
