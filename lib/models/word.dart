part of "models.dart";

class Word implements SearchType {
  final Furigana word;
  List<Definition> definitions = [];
  List<OtherForm> otherForms = [];

  bool commonWord = false;
  List<int> wanikaniLevels = [];
  JLPTLevel jlptLevel = JLPTLevel.none;

  String audioUrl = "";

  List<Note> notes = [];

  List<Kanji> kanji = [];

  // Form of word used to get details page
  String? id;

  String inflectionId = "";
  InflectionType? get inflectionType => inflectionId.isNotEmpty
      ? Inflection.getType(word.getText(), inflectionId)
      : null;

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

  const WikipediaPage(this.title, this.url);
}

class OtherForm {
  final String form;
  final String reading;

  const OtherForm(this.form, this.reading);

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

  const Collocation(this.word, this.meaning);
}

class Note {
  final String form;
  final String note;

  const Note(this.form, this.note);

  @override
  String toString() => "$form: $note";

  static Note parse(String text) {
    final split = text.split(": ");
    return Note(split.first, split.last);
  }

  static List<Note> parseAll(String text) {
    return text
        .trim()
        .replaceFirst(RegExp(r"\.$"), "")
        .split(". ")
        .deduplicate<String>()
        .map(Note.parse)
        .toList();
  }
}
