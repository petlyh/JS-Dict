part of "models.dart";

@freezed
class Kanji with _$Kanji implements ResultType {
  const factory Kanji({
    required String kanji,
    required int strokeCount,
    required List<String> meanings,
    required List<String> kunReadings,
    required List<String> onReadings,
    KanjiType? type,
    JLPTLevel? jlptLevel,
    KanjiDetails? details,
  }) = _Kanji;

  const Kanji._();

  String get code => kanji.codeUnitAt(0).toRadixString(16).padLeft(5, "0");

  String get url => createUrl(kanji);

  static String createUrl(String kanji) =>
      "https://jisho.org/search/${Uri.encodeComponent("$kanji #kanji")}";
}

@freezed
class KanjiDetails with _$KanjiDetails {
  const factory KanjiDetails({
    required List<String> parts,
    required List<String> variants,
    required List<Compound> onCompounds,
    required List<Compound> kunCompounds,
    Radical? radical,
    int? frequency,
  }) = _KanjiDetails;
}

@freezed
class Radical with _$Radical {
  const factory Radical({
    required String character,
    required List<String> meanings,
  }) = _Radical;
}

@freezed
class Compound with _$Compound {
  const factory Compound({
    required String compound,
    required String reading,
    required List<String> meanings,
  }) = _Compound;
}

sealed class KanjiType {
  String get name;
}

class Jinmeiyou implements KanjiType {
  const Jinmeiyou();

  @override
  String get name => "Jinmeiyō";

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) => other is Jinmeiyou;

  @override
  int get hashCode => name.hashCode;
}

class Jouyou implements KanjiType {
  const Jouyou(this.grade)
      : assert(
          (grade >= 1 && grade <= 6) || grade == juniorHighGrade,
        );

  const Jouyou.juniorHigh() : grade = juniorHighGrade;

  static const juniorHighGrade = 8;

  final int grade;

  @override
  String get name =>
      "Jōyō ${grade == juniorHighGrade ? "junior high" : "grade $grade"}";

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) => other is Jouyou && grade == other.grade;

  @override
  int get hashCode => grade.hashCode;
}
