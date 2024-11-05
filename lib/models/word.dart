part of "models.dart";

@freezed
class Word with _$Word implements ResultType {
  const factory Word({
    required Furigana word,
    required List<Definition> definitions,
    @Default([]) List<Collocation> collocations,
    @Default([]) List<OtherForm> otherForms,
    @Default([]) List<Note> notes,
    @Default([]) List<int> wanikaniLevels,
    @Default(false) bool isCommon,
    @Default(false) bool hasWikipedia,
    String? id,
    String? inflectionCode,
    String? audioUrl,
    JLPTLevel? jlptLevel,
    WordDetails? details,
  }) = _Word;

  const Word._();

  InflectionData? get inflectionData => inflectionCode != null
      ? InflectionData(word.text, inflectionCode!)
      : null;

  /// whether there is any point in loading details
  bool get shouldLoadDetails => hasWikipedia || !isNonKanji(word.text);

  String get url =>
      "https://jisho.org/word/${Uri.encodeComponent(id ?? word.text)}";
}

@freezed
class WordDetails with _$WordDetails {
  const factory WordDetails({
    @Default([]) List<Kanji> kanji,
    WikipediaInfo? wikipedia,
  }) = _WordDetails;
}

@freezed
class Definition with _$Definition {
  const factory Definition({
    required List<String> meanings,
    @Default([]) List<String> types,
    @Default([]) List<String> tags,
    @Default([]) List<String> seeAlso,
    Sentence? exampleSentence,
  }) = _Definition;
}

@freezed
class WikipediaInfo with _$WikipediaInfo {
  const factory WikipediaInfo({
    required String title,
    required String textAbstract,
    WikipediaPage? wikipediaEnglish,
    WikipediaPage? wikipediaJapanese,
    WikipediaPage? dbpedia,
  }) = _WikipediaInfo;
}

@freezed
class WikipediaPage with _$WikipediaPage {
  const factory WikipediaPage({
    required String title,
    required String url,
  }) = _WikipediaPage;
}

@freezed
class OtherForm with _$OtherForm {
  const factory OtherForm({
    required String form,
    required String reading,
  }) = _OtherForm;
}

@freezed
class Collocation with _$Collocation {
  const factory Collocation({
    required String word,
    required String meaning,
  }) = _Collocation;
}

@freezed
class Note with _$Note {
  const factory Note({
    required String form,
    required String note,
  }) = _Note;
}
