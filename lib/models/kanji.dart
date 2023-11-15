part of "models.dart";

class Kanji implements SearchType {
  final String kanji;

  List<String> meanings = [];
  List<String> kunReadings = [];
  List<String> onReadings = [];

  KanjiType? type;

  int strokeCount = -1;
  JLPTLevel jlptLevel = JLPTLevel.none;

  KanjiDetails? details;

  Kanji(this.kanji);
}

class KanjiDetails {
  List<String> parts = [];
  List<String> variants = [];

  Radical? radical;

  int? frequency;

  /// URL to the KanjiVG data.
  /// Responds with 404 if the kanji doesn't have KanjiVG data.
  /// Therefore, check if [kanjiVgData] is null instead to check if it the kanji
  /// has KanjiVG data.
  String? kanjiVgUrl;

  /// String containing KanjiVG data downloaded from [kanjiVgUrl].
  /// Is null if [kanjiVgUrl] is null or if the request to [kanjiVgUrl]
  /// didn't return a 200 OK status code.
  String? kanjiVgData;

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
