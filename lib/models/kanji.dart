part of "models.dart";

class Kanji implements SearchType {
  final String kanji;

  String get code => kanji.codeUnitAt(0).toRadixString(16).padLeft(5, "0");

  List<String> meanings = [];
  List<String> kunReadings = [];
  List<String> onReadings = [];

  KanjiType? type;

  int strokeCount = -1;
  JLPTLevel jlptLevel = JLPTLevel.none;

  String get url =>
      "https://jisho.org/search/${Uri.encodeComponent("$kanji #kanji")}";

  KanjiDetails? details;

  Kanji(this.kanji);
}

class KanjiDetails {
  List<String> parts = [];
  List<String> variants = [];

  Radical? radical;

  int? frequency;

  List<Compound> onCompounds = [];
  List<Compound> kunCompounds = [];
}

class Radical {
  final String character;
  final List<String> meanings;

  const Radical(this.character, this.meanings);
}

class Compound {
  final String compound;
  final String reading;
  final List<String> meanings;

  const Compound(this.compound, this.reading, this.meanings);
}

sealed class KanjiType {
  const KanjiType();
}

class Jinmeiyou extends KanjiType {
  @override
  String toString() {
    return "Jinmeiyō";
  }
}

class Jouyou extends KanjiType {
  static const juniorHighGrade = 8;

  final int grade;

  const Jouyou(this.grade)
      : assert((grade >= 1 && grade <= 6) || grade == juniorHighGrade);
  const Jouyou.juniorHigh() : grade = juniorHighGrade;

  @override
  String toString() {
    final gradePart = grade == juniorHighGrade ? "junior high" : "grade $grade";
    return "Jōyō $gradePart";
  }
}
