part of "models.dart";

class Kanji implements SearchType {
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

  String strokeDiagramUrl = "";

  List<Compound> onCompounds = [];
  List<Compound> kunCompounds = [];
  
  Kanji(this.kanji);
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

sealed class KanjiType {}

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