import 'package:html/dom.dart';
import 'package:jsdict/models.dart';

import 'furigana.dart';

class Parser {
  SearchResponse search(final Document document) {
    if (document.getElementById("no-matches") != null) {
      return SearchResponse(false);
    }

    return _createSearchResponse(document);
  }

  SearchResponse _createSearchResponse(final Document document) {
    var searchResponse = SearchResponse(true);

    searchResponse.kanjiResults = _findEntries(document, _kanjiDetailsEntry, "div.kanji.details");
    if (searchResponse.kanjiResults.isNotEmpty) {
      return searchResponse;
    }

    searchResponse.kanjiResults = _findEntries(document, _kanjiEntry, "div.kanji_light_block > div.entry.kanji_light");
    searchResponse.sentenceResults = _findEntries(document, _sentenceEntry, "div.sentences_block > ul > li.entry.sentence");
    searchResponse.nameResults = _findEntries(document, _nameEntry, "div.names_block > div.names > div.concept_light");
    searchResponse.wordResults = _findEntries(document, _wordEntry, "div.concepts > .concept_light, div.exact_block > .concept_light");

    return searchResponse;
  }

  List<T> _findEntries<T>(Document document, T Function(Element) handler, String selector) {
    return document.querySelectorAll(selector).map(handler).toList();
  }

  Name _nameEntry(final Element element) {
    final readingElement = element.querySelector("div.concept_light-readings");
    final reading = readingElement!.text.trim().replaceAll("\n", "").replaceAll(RegExp(r" +"), " ");

    final meaningElements = element.querySelectorAll("span.meaning-meaning");
    final meanings = meaningElements.map((e) => e.text.trim()).toList();

    return Name(reading, meanings);
  }

  Kanji _kanjiEntry(final Element element) {
    final literal = element.querySelector("div.literal_block > span > a")!.innerHtml.trim();
    var kanji = Kanji(literal);

    final meaningElements = element.querySelectorAll("div.meanings > span");
    kanji.meanings = meaningElements.map((e) => e.innerHtml.trim().replaceAll(",", "")).toList();

    final kunElements = element.querySelectorAll("div.kun > span.japanese_gothic > a");
    kanji.kunReadings = kunElements.map((e) => e.innerHtml.trim()).toList();

    final onElements = element.querySelectorAll("div.on > span.japanese_gothic > a");
    kanji.onReadings = onElements.map((e) => e.innerHtml.trim()).toList();

    kanji.strokeCount = int.parse(element.querySelector(".strokes")!.innerHtml.split(" ").first);

    final info = element.querySelector("div.info")!.innerHtml;
    kanji.jlptLevel = JLPTLevel.findInText(info);

    kanji.type = _getKanjiType(info);

    return kanji;
  }


  Sentence sentenceDetails(final Document document) {
    final sentenceElement = document.querySelector("div.sentence_content")!;
    var sentence = _sentenceEntry(sentenceElement);
    sentence.kanji = _findEntries(document, _kanjiEntry, "div.kanji_light_block > div.entry.kanji_light");
    return sentence;
  }

  Sentence _sentenceEntry(final Element element) {
    final english = element.querySelector("span.english")!.innerHtml.trim();
    final japanese = parseSentenceFurigana(element);

    final copyrightElement = element.querySelector("span.inline_copyright a");
    final copyright = SentenceCopyright(copyrightElement!.innerHtml.trim(), copyrightElement.attributes["href"]!);

    final linkElement = element.querySelector("a.light-details_link");
    final id = linkElement != null ? linkElement.attributes["href"]!.split("/").last : "";

    return Sentence.copyright(id, japanese, english, copyright);
  }

  Kanji kanjiDetails(final Document document) {
    final kanjiDetailElement = document.querySelector("div.kanji.details");

    if (kanjiDetailElement == null) {
      throw Exception("Kanji not found");
    }

    return _kanjiDetailsEntry(kanjiDetailElement);
  }

  Kanji _kanjiDetailsEntry(final Element element) {
    var kanji = element.querySelector("h1.character")!.innerHtml;
    var kanjiDetails = Kanji(kanji);

    var meanings = element.querySelector(".kanji-details__main-meanings")!.innerHtml;
    kanjiDetails.meanings = meanings.trim().split(", ");

    var strokeCount = element.querySelector(".kanji-details__stroke_count > strong")!.innerHtml;
    kanjiDetails.strokeCount = int.parse(strokeCount);

    var jlptLevelElement = element.querySelector("div.jlpt > strong");
    if (jlptLevelElement != null) {
      kanjiDetails.jlptLevel = JLPTLevel.fromString(jlptLevelElement.innerHtml);
    }

    kanjiDetails.type = _getKanjiType(element.querySelector("div.grade")!.text);

    var kunElements = element.querySelectorAll("div.kanji-details__main-readings > dl.kun_yomi > dd > a");
    if (kunElements.isNotEmpty) {
      kanjiDetails.kunReadings = kunElements.map((e) => e.innerHtml).toList();
    }

    var onElements = element.querySelectorAll("div.kanji-details__main-readings > dl.on_yomi > dd > a");
    if (onElements.isNotEmpty) {
      kanjiDetails.onReadings = onElements.map((e) => e.innerHtml).toList();
    }

    var partsElements = element.querySelectorAll("div.radicals > dl > dd > a");
    if (partsElements.isNotEmpty) {
      kanjiDetails.parts = partsElements.map((e) => e.innerHtml).toList();
    }

    var variantsElements = element.querySelectorAll("dl.variants > dd > a");
    if (variantsElements.isNotEmpty) {
      kanjiDetails.variants = variantsElements.map((e) => e.innerHtml).toList();
    }

    var frequencyElement = element.querySelector("div.frequency > strong");
    if (frequencyElement != null) {
      kanjiDetails.frequency = int.parse(frequencyElement.innerHtml);
    }

    var radicalElement = element.querySelector("div.radicals > dl > dd > span");
    if (radicalElement != null) {
      var character = radicalElement.nodes.firstWhere((node) => node.nodeType == Node.TEXT_NODE && node.text!.trim().isNotEmpty).text!.trim();
      var meanings = radicalElement.querySelector("span.radical_meaning")!.text.trim().split(", ");
      kanjiDetails.radical = Radical(character, meanings);
    }

    kanjiDetails.onCompounds = _findCompounds(element, "On");
    kanjiDetails.kunCompounds = _findCompounds(element, "Kun");

    return kanjiDetails;
  }

  KanjiType? _getKanjiType(String text) {
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

  List<Compound> _findCompounds(Element element, String type) {
    var compoundColumns = element.querySelectorAll("div.row.compounds > div.columns");

    try {
      final column = compoundColumns.firstWhere((element) => element.querySelector("h2")!.innerHtml.contains("$type reading compounds"));
      final compoundElements = column.querySelectorAll("ul > li");
      assert(compoundElements.isNotEmpty);

      return compoundElements.map((element) {
        final lines = element.text.trim().split("\n");
        assert(lines.length == 3);

        final compound = lines[0].trim();
        final reading = lines[1].trim().replaceAll("【", "").replaceAll("】", "");
        final meanings = lines[2].trim().split(", ");

        return Compound(compound, reading, meanings);
      }).toList();
    } on StateError catch (_) {
      return [];
    }
  }

  List<OtherForm> _parseOtherForms(final Element element) {
    var formElements = element.querySelectorAll("span.break-unit");
    List<OtherForm> otherForms = [];

    for (var formElement in formElements) {
      var formText = formElement.text.trim();
      formText = formText.replaceFirst("】", "");
      var formTextSplit = formText.split(" 【");
      var form = formTextSplit.first;
      var reading = "";
      if (formTextSplit.length == 2) {
        reading = formTextSplit.last;
      }
      otherForms.add(OtherForm(form, reading));
    }

    return otherForms;
  }

  Word _wordEntry(final Element element) {
    final furigana = parseWordFurigana(element);
    var word = Word(furigana);

    var commonElement = element.querySelector("span.concept_light-common");
    if (commonElement != null) {
      word.commonWord = true;
    }

    var audioElement = element.querySelector("audio > source");
    if (audioElement != null) {
      word.audioUrl = "https:${audioElement.attributes["src"]!}";
    }

    var tagElements = element.querySelectorAll("span.concept_light-tag");

    for (var tagElement in tagElements) {
      if (tagElement.innerHtml.contains("JLPT")) {
        word.jlptLevel = JLPTLevel.fromString(tagElement.innerHtml.split(" ")[1]);
        continue;
      }

      if (tagElement.children.isNotEmpty) {
        word.wanikaniLevel = int.parse(tagElement.children.first.innerHtml.split(" ")[2]);
        continue;
      }
    }

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

      word.definitions.add(definition);
    }

    var detailsLink = element.querySelector("a.light-details_link");
    if (detailsLink != null) {
      var detailsUrl = detailsLink.attributes["href"]!;
      word.id = Uri.decodeComponent(detailsUrl.split("/").last);
    }

    var inflectionElement = element.querySelector("a.show_inflection_table");
    if (inflectionElement != null) {
      word.inflectionId = inflectionElement.attributes["data-pos"]!;
    }

    try {
      var collocationsElement = element.querySelectorAll(".concept_light-status_link").firstWhere((e) => e.text.contains("collocation"));
      var collocationsModalId = collocationsElement.attributes["data-reveal-id"]!;
      var collocationElements = element.querySelectorAll("#$collocationsModalId > ul > li > a");

      word.collocations = collocationElements.map((e) {
        var split = e.text.trim().split(" - ");
        assert(split.length == 2);
        return Collocation(split[0], split[1]);
      }).toList();
    } on StateError catch (_) {}

    return word;
  }

  Word wordDetails(final Document document) {
    var wordEntryElement = document.querySelector("div.concept_light");

    if (wordEntryElement == null) {
      throw Exception("Word not found");
    }

    var word = _wordEntry(wordEntryElement);
    word.kanji = _findEntries(document, _kanjiEntry, "div.kanji_light_block > div.entry.kanji_light");
    return word;
  }
}