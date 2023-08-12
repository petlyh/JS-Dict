import "package:jsdict/packages/inflection/inflection.dart";

import "furigana.dart";
import "jlpt.dart";
import "kanji.dart";
import "sentence.dart";

class Word {
  final Furigana word;
  List<Definition> definitions = [];
  List<OtherForm> otherForms = [];

  bool commonWord = false;
  int wanikaniLevel = -1;
  JLPTLevel jlptLevel = JLPTLevel.none;

  String audioUrl = "";

  List<String> notes = [];

  List<Kanji> kanji = [];

  // Form of word used to get details page
  String? id;

  String inflectionId = "";
  InflectionType? get inflectionType => inflectionId.isNotEmpty ? Inflection.getType(word.getText(), inflectionId) : null;

  List<Collocation> collocations = [];

  Word(this.word);
}

class Definition {
  List<String> meanings = [];
  List<String> types = [];
  List<String> tags = [];
  List<String> seeAlso = [];

  WikipediaDefinition? wikipedia;

  Sentence? exampleSentence;

  @override
  String toString() {
    return meanings.join(", ");
  }
}

class WikipediaDefinition {
  final String name;
  String? textAbstract;
  WikipediaPage? wikipediaEnglish;
  WikipediaPage? wikipediaJapanese;
  WikipediaPage? dbpedia;

  WikipediaDefinition(this.name);
}

class WikipediaPage {
  final String title;
  final String url;

  WikipediaPage(this.title, this.url);
}

class OtherForm {
  final String form;
  final String reading;
  
  OtherForm(this.form, this.reading);

  @override
  String toString() {
    if (reading.isEmpty) {
      return form;
    }
    return "$form 【$reading】";
  }
}

class Collocation {
  final String word;
  final String meaning;

  Collocation(this.word, this.meaning);
}