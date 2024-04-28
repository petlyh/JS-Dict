part of "models.dart";

class Word implements SearchType {
  final Furigana word;

  final List<Definition> definitions;
  final List<OtherForm> otherForms;

  final bool commonWord;
  final List<int> wanikaniLevels;
  final JLPTLevel jlptLevel;

  final String? audioUrl;

  final List<Note> notes;
  final List<Collocation> collocations;

  // Form of word used to get details page
  final String? id;

  final String inflectionId;
  final bool hasWikipedia;

  final WordDetails? details;

  const Word(
      {required this.word,
      required this.definitions,
      this.otherForms = const [],
      this.commonWord = false,
      this.wanikaniLevels = const [],
      this.jlptLevel = JLPTLevel.none,
      this.audioUrl,
      this.notes = const [],
      this.collocations = const [],
      this.id,
      this.inflectionId = "",
      this.hasWikipedia = false,
      this.details});

  Word withDetails(WordDetails details) => Word(
      details: details,
      word: word,
      definitions: definitions,
      otherForms: otherForms,
      commonWord: commonWord,
      wanikaniLevels: wanikaniLevels,
      jlptLevel: jlptLevel,
      audioUrl: audioUrl,
      notes: notes,
      collocations: collocations,
      id: id,
      inflectionId: inflectionId,
      hasWikipedia: hasWikipedia);

  InflectionType? get inflectionType => inflectionId.isNotEmpty
      ? Inflection.getType(word.text, inflectionId)
      : null;

  /// whether there is any point in loading details
  bool get shouldLoadDetails => hasWikipedia || !isNonKanji(word.text);

  String get url =>
      "https://jisho.org/word/${Uri.encodeComponent(id ?? word.text)}";
}

class WordDetails {
  final List<Kanji> kanji;
  final WikipediaInfo? wikipedia;

  const WordDetails({this.kanji = const [], this.wikipedia});
}

class Definition {
  final List<String> meanings;
  final List<String> types;
  final List<String> tags;
  final List<String> seeAlso;

  final Sentence? exampleSentence;

  const Definition(
      {required this.meanings,
      this.types = const [],
      this.tags = const [],
      this.seeAlso = const [],
      this.exampleSentence});

  @override
  String toString() {
    return meanings.join(", ");
  }
}

class WikipediaInfo {
  final String title;
  final String? textAbstract;
  final WikipediaPage? wikipediaEnglish;
  final WikipediaPage? wikipediaJapanese;
  final WikipediaPage? dbpedia;

  const WikipediaInfo(this.title,
      {this.textAbstract,
      this.wikipediaEnglish,
      this.wikipediaJapanese,
      this.dbpedia});
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
