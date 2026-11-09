part of "models.dart";

sealed class ResultType {}

@freezed
sealed class SearchResponse<T extends ResultType> with _$SearchResponse<T> {
  const factory SearchResponse({
    required List<T> results,
    @Default(false) bool hasNextPage,
    @Default([]) List<Furigana> zenEntries,
    @Default([]) List<String> noMatchesFor,
    Correction? correction,
    GrammarInfo? grammarInfo,
    Conversion? conversion,
  }) = _SearchResponse<T>;
}

@freezed
sealed class Correction with _$Correction {
  const factory Correction({
    required String effective,
    required String original,
    required bool noMatchesForOriginal,
  }) = _Correction;
}

@freezed
sealed class GrammarInfo with _$GrammarInfo {
  const factory GrammarInfo({
    required String word,
    required String possibleInflectionOf,
    required List<String> formInfos,
  }) = _GrammarInfo;
}

@freezed
sealed class Conversion with _$Conversion {
  const factory Conversion({
    required String original,
    required String converted,
  }) = _Conversion;
}
