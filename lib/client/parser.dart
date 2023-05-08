import 'package:html/dom.dart';
import 'package:jsdict/models.dart';

class Parser {
  SearchResponse search(final Document document) {
    if (document.getElementById("no-matches") != null) {
      return SearchResponse(false);
    }

    return _createSearchResponse(document);
  }

  SearchResponse _createSearchResponse(final Document document) {
    var searchResponse = SearchResponse(true);

    final kanjiDetailElements = document.querySelectorAll("div.kanji.details");

    if (kanjiDetailElements.isNotEmpty) {
      for (final kanjiDetailElement in kanjiDetailElements) {
        final kanji = _kanjiDetailsEntry(kanjiDetailElement);
        searchResponse.kanjiResults.add(kanji);
      }
      return searchResponse;
    }

    final kanjiElements = document.querySelectorAll("div.kanji_light_block > div.entry.kanji_light");

    if (kanjiElements.isNotEmpty) {
      for (final kanjiElement in kanjiElements) {
        final kanji = _kanjiEntry(kanjiElement);
        searchResponse.kanjiResults.add(kanji);
      }
    }

    final sentenceElements = document.querySelectorAll("div.sentences_block > ul > li.entry.sentence");

    if (sentenceElements.isNotEmpty) {
      for (final sentenceElement in sentenceElements) {
        final sentence = _sentenceEntry(sentenceElement);
        searchResponse.sentenceResults.add(sentence);
      }
    }

    final nameElements = document.querySelectorAll("div.names_block > div.names > div.concept_light");

    if (nameElements.isNotEmpty) {
      for (final nameElement in nameElements) {
        final name = _nameEntry(nameElement);
        searchResponse.nameResults.add(name);
      }
    }

    final wordElements = document.querySelectorAll("div.concepts > div.concept_light");

    if (wordElements.isNotEmpty) {
      for (final wordElement in wordElements) {
        final word = _wordEntry(wordElement);
        searchResponse.wordResults.add(word);
      }
    }

    return searchResponse;
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

    return kanji;
  }

  Sentence _sentenceEntry(final Element element) {
    final english = element.querySelector("span.english")!.innerHtml.trim();
    final japaneseNodes = element.querySelector("ul.japanese_sentence")!.nodes;
    final japanese = _createFurigana(japaneseNodes);

    final copyrightElement = element.querySelector("span.inline_copyright a");
    final copyright = SentenceCopyright(copyrightElement!.innerHtml.trim(), copyrightElement.attributes["href"]!);

    final link = element.querySelector("a.light-details_link")!.attributes["href"]!;
    final id = link.split("/").last;

    return Sentence.copyright(id, japanese, english, copyright);
  }

  Furigana _createFurigana(final NodeList nodes) {
    Furigana furigana = [];

    for (var node in nodes) {
      if (node.nodeType == Node.TEXT_NODE) {
        furigana.add(FuriganaPart.textOnly(node.text!.trim()));
      } else if (node.nodeType == Node.ELEMENT_NODE) {
        final element = (node as Element);
        final text = element.querySelector("span.unlinked")!.innerHtml.trim();
        final furiganaElement = element.querySelector("span.furigana");
        if (furiganaElement == null) {
          furigana.add(FuriganaPart.textOnly(text));
        } else {
          final furiganaText = furiganaElement.innerHtml.trim();
          furigana.add(FuriganaPart(text, furiganaText));
        }
      }
    }

    return furigana;
  }

  Kanji? kanjiDetails(final Document document) {
    final kanjiDetailElement = document.querySelector("div.kanji.details");

    if (kanjiDetailElement == null) {
      return null;
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

    var gradeElement = element.querySelector("div.grade > strong");
    if (gradeElement != null && gradeElement.innerHtml.contains("grade")) {
      kanjiDetails.grade = int.parse(gradeElement.innerHtml.split(" ")[1]);
    }

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

    return kanjiDetails;
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
    var wordElement = element.querySelector("div.concept_light-representation > span.text");
    var wordText = wordElement!.nodes.map((node) => FuriganaPart.textOnly(node.text!.trim())).toList();
    var word = Word(wordText);

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
      if (definitionElement.previousElementSibling!.text == "Other forms") {
        word.otherForms = _parseOtherForms(definitionElement);
        continue;
      }

      var indexElement = definitionElement.querySelector("span.meaning-definition-section_divider");
      if (indexElement == null) {
        continue;
      }

      var definition = Definition();
      var tagsText = definitionElement.previousElementSibling!.text;
      definition.types = tagsText.replaceAll("\\(.+=\\)", "").split(", ").map((e) => e.trim()).toList();
      var meaningsElement = definitionElement.querySelector("span.meaning-meaning");
      definition.meanings = meaningsElement!.innerHtml.trim().split("; ");
      word.definitions.add(definition);
    }

    var notesElement = element.querySelector("div.meaning-representation_notes > span");
    if (notesElement != null) {
      word.notes = notesElement.text.trim();
    }

    return word;
  }

  Word wordDetails(final Document document) {
    var wordEntryElement = document.querySelector("div.concept_light");
    return _wordEntry(wordEntryElement!);
  }
}