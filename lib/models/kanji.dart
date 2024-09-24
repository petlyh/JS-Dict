part of "models.dart";

class Kanji implements SearchType {
  final String kanji;
  final int strokeCount;

  final KanjiType? type;
  final JLPTLevel jlptLevel;

  final List<String> meanings;
  final List<String> kunReadings;
  final List<String> onReadings;

  final KanjiDetails? details;

  String get code => kanji.codeUnitAt(0).toRadixString(16).padLeft(5, "0");

  String get url => createUrl(kanji);

  static String createUrl(String kanji) =>
      "https://jisho.org/search/${Uri.encodeComponent("$kanji #kanji")}";

  const Kanji({
    required this.kanji,
    required this.strokeCount,
    this.type,
    this.jlptLevel = JLPTLevel.none,
    this.meanings = const [],
    this.kunReadings = const [],
    this.onReadings = const [],
    this.details,
  });
}

class KanjiDetails {
  final List<String> parts;
  final List<String> variants;

  final Radical? radical;

  final int? frequency;

  final List<Compound> onCompounds;
  final List<Compound> kunCompounds;

  const KanjiDetails({
    required this.parts,
    required this.variants,
    required this.radical,
    required this.frequency,
    required this.onCompounds,
    required this.kunCompounds,
  });
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
  const Jinmeiyou();

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
