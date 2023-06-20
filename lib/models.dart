import 'package:jsdict/inflection.dart';
import 'package:ruby_text/ruby_text.dart';

class SearchResponse<T> {
  String correction = "";
  String suggestion = "";

  bool hasNextPage = false;

  List<T> results = [];

  void addResults(List list) {
    if (list is List<T>) {
      results.addAll(list);
    }
  }
}

enum JLPTLevel {
  n1, n2, n3, n4, n5, none;

  @override
  String toString() {
    return switch (this) {
      n1 => "N1",
      n2 => "N2",
      n3 => "N3",
      n4 => "N4",
      n5 => "N5",
      _ => "",
    };
  }

  static JLPTLevel fromString(final String level) {
    return switch (level.toLowerCase()) {
      "n1" => n1,
      "n2" => n2,
      "n3" => n3,
      "n4" => n4,
      "n5" => n5,
      _ =>  none,
    };
  }

  static JLPTLevel findInText(final String text) {
    final pattern = RegExp(r"JLPT (N\d)");
    final match = pattern.firstMatch(text.toUpperCase());
    if (match == null) return none;
    return fromString(match.group(1)!);
  }
}

class Radical {
  final String character;
  final List<String> meanings;
  
  Radical(this.character, this.meanings);
}

class Compound {
  final String compound;
  final String reading;
  final List<String> meanings;

  Compound(this.compound, this.reading, this.meanings);
}

class KanjiType {}

class Jinmeiyou extends KanjiType {
  @override
  String toString() {
    return "Jinmeiyō";
  }
}

class Jouyou extends KanjiType {
  static const juniorHighGrade = 8;

  final int grade;
  Jouyou(this.grade) : assert((grade >= 1 && grade <= 6) || grade == juniorHighGrade);
  Jouyou.juniorHigh() : grade = juniorHighGrade;

  @override
  String toString() {
    final gradePart = grade == juniorHighGrade ? "junior high" : "grade $grade";
    return "Jōyō $gradePart";
  }
}

class Kanji {
  final String kanji;
  
  List<String> meanings = [];
  List<String> kunReadings = [];
  List<String> onReadings = [];

  KanjiType? type;
  
  int strokeCount = -1;
  JLPTLevel jlptLevel = JLPTLevel.none;

  List<String> parts = [];
  List<String> variants = [];
  
  Radical? radical;
  
  int? frequency;

  List<Compound> onCompounds = [];
  List<Compound> kunCompounds = [];
  
  Kanji(this.kanji);
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

class Definition {
  List<String> meanings = [];
  List<String> types = [];
  List<String> tags = [];
  List<String> seeAlso = [];

  @override
  String toString() {
    return meanings.join(", ");
  }
}

class Word {
  final Furigana word;
  List<Definition> definitions = [];
  List<OtherForm> otherForms = [];

  bool commonWord = false;
  int wanikaniLevel = -1;
  JLPTLevel jlptLevel = JLPTLevel.none;

  String audioUrl = "";

  String notes = "";

  List<Kanji> kanji = [];

  // Form of word used to get details page
  String? id;

  String inflectionId = "";
  InflectionType? get inflectionType => inflectionId.isNotEmpty ? getInflectionType(word.getText(), inflectionId) : null;

  List<Collocation> collocations = [];

  Word(this.word);
}

class Collocation {
  final String word;
  final String meaning;

  Collocation(this.word, this.meaning);
}

class FuriganaPart {
  final String text;
  final String furigana;
  FuriganaPart(this.text, this.furigana);
  FuriganaPart.textOnly(this.text) : furigana = "";
}

typedef Furigana = List<FuriganaPart>;

extension FuriganaMethods on Furigana {
  String getText() {
    return map((part) => part.text.trim()).join().trim();
  }

  String getReading() {
    return map((part) => part.furigana.isNotEmpty ? part.furigana : part.text).join().trim();
  }

  List<RubyTextData> toRubyData() {
    return map((part) => part.furigana.isEmpty ? RubyTextData(part.text) : RubyTextData(part.text, ruby: part.furigana)).toList();
  }
}

Furigana furiganaFromText(String text) => [FuriganaPart.textOnly(text)];

class SentenceCopyright {
  final String name;
  final String url;
  SentenceCopyright(this.name, this.url);
}

class Sentence {
  final String id;
  final Furigana japanese;
  final String english;
  final SentenceCopyright? copyright;

  List<Kanji> kanji = [];

  Sentence(this.id, this.japanese, this.english) : copyright = null;
  Sentence.copyright(this.id, this.japanese, this.english, this.copyright);
}

class Name {
  final String reading;
  final List<String> meanings;

  Name(this.reading, this.meanings);
}