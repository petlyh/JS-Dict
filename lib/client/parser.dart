import 'package:html/dom.dart';
import 'package:jsdict/client/parsing_helper.dart';
import 'package:jsdict/models.dart';

import 'furigana.dart';

class Parser {
  static SearchResponse<T> search<T>(final Document document) {
    var response = SearchResponse<T>();
    final body = document.body!;

    response.hasNextPage = document.querySelector("a.more") != null;

    switch (T) {
      case Kanji:
        response.addResults(body.collectAll<Kanji>("div.kanji.details", _kanjiDetailsEntry));
        if (response.results.isNotEmpty) break;
        response.addResults(body.collectAll<Kanji>("div.kanji_light_block > div.entry.kanji_light", _kanjiEntry));
        break;
      case Word:
        response.addResults(body.collectAll<Word>("div.concepts > .concept_light, div.exact_block > .concept_light", _wordEntry));
        break;
      case Sentence:
        response.addResults(body.collectAll<Sentence>("div.sentences_block > ul > li.entry.sentence", _sentenceEntry));
        break;
      case Name:
        response.addResults(body.collectAll<Name>("div.names_block > div.names > div.concept_light", _nameEntry));
    }

    return response;
  }

  static Name _nameEntry(final Element element) {
    final reading = element.collect("div.concept_light-readings", (e) => e.text.trim().replaceAll("\n", "").replaceAll(RegExp(r" +"), " "))!;
    final meanings = element.collectAll("span.meaning-meaning", (e) => e.text.trim());

    return Name(reading, meanings);
  }

  static Kanji _kanjiEntry(final Element element) {
    final literal = element.collect("div.literal_block > span > a", (e) => e.innerHtml.trim())!;
    var kanji = Kanji(literal);

    kanji.meanings = element.collectAll("div.meanings > span", (e) => e.innerHtml.trim().replaceAll(",", ""));
    kanji.kunReadings = element.collectAll("div.kun > span.japanese_gothic > a", (e) => e.innerHtml.trim());
    kanji.onReadings = element.collectAll("div.on > span.japanese_gothic > a", (e) => e.innerHtml.trim());

    kanji.strokeCount = element.collect(".strokes", (e) => int.parse(e.innerHtml.split(" ").first))!;
    kanji.jlptLevel = element.collect("div.info", (e) => JLPTLevel.findInText(e.innerHtml)) ?? JLPTLevel.none;
    kanji.type = element.collect<KanjiType?>("div.info", _getKanjiType);

    return kanji;
  }


  static Sentence sentenceDetails(final Document document) {
    final sentence = document.body!.collect("div.sentence_content", _sentenceEntry)!;
    sentence.kanji = document.body!.collectAll("div.kanji_light_block > div.entry.kanji_light", _kanjiEntry);

    return sentence;
  }

  static Sentence _sentenceEntry(final Element element) {
    final english = element.collect("span.english", (e) => e.innerHtml.trim())!;
    final japanese = parseSentenceFurigana(element);

    final copyright = element.collect("span.inline_copyright a", (e) => SentenceCopyright(e.innerHtml.trim(), e.attributes["href"]!));
    final id = element.collect("a.light-details_link", (e) => e.attributes["href"]!.split("/").last) ?? "";

    return Sentence.copyright(id, japanese, english, copyright);
  }

  static Kanji kanjiDetails(final Document document) {
    final kanji = document.body!.collect("div.kanji.details", _kanjiDetailsEntry);

    if (kanji == null) {
      throw Exception("Kanji not found");
    }

    return kanji;
  }

  static Kanji _kanjiDetailsEntry(final Element element) {
    final kanjiDetails = Kanji(element.collect("h1.character", (e) => e.innerHtml.trim())!);

    kanjiDetails.meanings = element.collect(".kanji-details__main-meanings", (e) => e.innerHtml.trim().split(", "))!;

    kanjiDetails.strokeCount = element.collect(".kanji-details__stroke_count > strong", (e) => int.parse(e.innerHtml.trim()))!;
    kanjiDetails.jlptLevel = element.collect("div.jlpt > strong", (e) => JLPTLevel.fromString(e.innerHtml.trim())) ?? JLPTLevel.none;
    kanjiDetails.type = element.collect<KanjiType?>("div.grade", _getKanjiType);

    kanjiDetails.kunReadings = element.collectAll("div.kanji-details__main-readings > dl.kun_yomi > dd > a", (e) => e.innerHtml.trim());
    kanjiDetails.onReadings = element.collectAll("div.kanji-details__main-readings > dl.on_yomi > dd > a", (e) => e.innerHtml.trim());

    kanjiDetails.parts = element.collectAll("div.radicals > dl > dd > a", (e) => e.innerHtml.trim());
    kanjiDetails.variants = element.collectAll("dl.variants > dd > a", (e) => e.innerHtml.trim());

    kanjiDetails.frequency = element.collect("div.frequency > strong", (e) => int.parse(e.innerHtml.trim()));

    kanjiDetails.radical = element.collect("div.radicals > dl > dd > span", (e) {
      final character = e.nodes.firstWhere((node) => node.nodeType == Node.TEXT_NODE && node.text!.trim().isNotEmpty).text!.trim();
      final meanings = e.querySelector("span.radical_meaning")!.text.trim().split(", ");
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
        return Jouyou.juniorHigh();
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
    return element.collectWhere(
      "div.row.compounds > div.columns",
      (e) => e.querySelector("h2")!.innerHtml.contains("$type reading compounds"),
      (column) => column.collectAll("ul > li", (e) {
        final lines = e.text.trim().split("\n");
        assert(lines.length == 3);

        final compound = lines[0].trim();
        final reading = lines[1].trim().replaceAll("【", "").replaceAll("】", "");
        final meanings = lines[2].trim().split(", ");

        return Compound(compound, reading, meanings);
      }),
    ) ?? [];
  }

  static List<OtherForm> _parseOtherForms(final Element element) {
    return element.collectAll("span.break-unit", (e) {
      final split = e.text.trim().replaceFirst("】", "").split(" 【");
      final form = split.first;
      final reading = split.length == 2 ? split.last : "";
      return OtherForm(form, reading);
    });
  }

  static Word _wordEntry(final Element element) {
    final furigana = parseWordFurigana(element);
    final word = Word(furigana);

    word.commonWord = element.querySelector("span.concept_light-common") != null;

    word.audioUrl = element.collect("audio > source", (e) => "https:${e.attributes["src"]!}") ?? "";

    word.jlptLevel = element.collectWhere(
      "span.concept_light-tag",
      (e) => e.innerHtml.contains("JLPT"),
      (e) => JLPTLevel.fromString(e.innerHtml.trim().split(" ")[1]),
    ) ?? JLPTLevel.none;

    word.wanikaniLevel = element.collectWhere(
      "span.concept_light-tag",
      (e) => e.innerHtml.contains("Wanikani"),
      (e) => int.parse(e.children.first.innerHtml.trim().split(" ")[2]),
    ) ?? -1;

    var definitionElements = element.querySelectorAll("div.meaning-wrapper");

    for (var definitionElement in definitionElements) {
      var previousElement = definitionElement.previousElementSibling;
      if (previousElement?.text == "Other forms") {
        word.otherForms = _parseOtherForms(definitionElement);
        continue;
      }

      var notesElement = definitionElement.querySelector("div.meaning-representation_notes > span");
      if (notesElement != null) {
        word.notes = notesElement.text.trim();
        continue;
      }

      var definition = Definition();

      if (previousElement != null && previousElement.classes.contains("meaning-tags")) {
        var tagsText = definitionElement.previousElementSibling!.text;
        definition.types = tagsText.split(", ").map((e) => e.trim()).toList();
      }

      if (definition.types.isEmpty && word.definitions.isNotEmpty) {
        definition.types = word.definitions.last.types;
      }

      var meaningsElement = definitionElement.querySelector("span.meaning-meaning");
      definition.meanings = meaningsElement!.innerHtml.trim().split("; ");

      definition.tags = definitionElement.collectAll("span.tag-tag, span.tag-info, span.tag-source", (e) => e.text.trim());
      definition.seeAlso = definitionElement.collectAll("span.tag-see_also > a", (e) => e.text.trim());
      // deduplicate
      definition.seeAlso = definition.seeAlso.toSet().toList();

      word.definitions.add(definition);
    }

    word.id = element.collect("a.light-details_link", (e) => Uri.decodeComponent(e.attributes["href"]!.split("/").last));

    word.inflectionId = element.collect("a.show_inflection_table", (e) => e.attributes["data-pos"]!) ?? "";

    word.collocations = element.collectWhere(
      ".concept_light-status_link",
      (e) => e.text.contains("collocation"),
      (e) {
        final selector = "#${e.attributes["data-reveal-id"]!} > ul > li > a";
        return element.collectAll(selector, (e2) {
          final split = e2.text.trim().split(" - ");
          assert(split.length == 2);
          return Collocation(split[0], split[1]);
        });
      },
    ) ?? [];

    return word;
  }

  static Word wordDetails(final Document document) {
    final word = document.body!.collect("div.concept_light", _wordEntry);

    if (word == null) {
      throw Exception("Word not found");
    }

    word.kanji = document.body!.collectAll("div.kanji_light_block > div.entry.kanji_light", _kanjiEntry);
    return word;
  }
}