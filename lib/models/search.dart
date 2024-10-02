part of "models.dart";

sealed class ResultType {}

class SearchResponse<T extends ResultType> {
  final List<T> results;
  final bool hasNextPage;

  final List<String> zenEntries;

  final Correction? correction;
  final List<String> noMatchesFor;
  final GrammarInfo? grammarInfo;
  final Conversion? conversion;

  const SearchResponse({
    required this.results,
    this.hasNextPage = false,
    this.zenEntries = const [],
    this.correction,
    this.noMatchesFor = const [],
    this.grammarInfo,
    this.conversion,
  });

  const SearchResponse.noMatches(
    this.noMatchesFor, {
    this.zenEntries = const [],
    this.correction,
    this.grammarInfo,
    this.conversion,
  })  : results = const [],
        hasNextPage = false;
}

class Correction {
  final String effective;
  final String original;
  final bool noMatchesForOriginal;

  const Correction(this.effective, this.original, this.noMatchesForOriginal);
}

class GrammarInfo {
  final String word;
  final String possibleInflectionOf;
  final List<String> formInfos;

  const GrammarInfo(this.word, this.possibleInflectionOf, this.formInfos);
}

typedef Conversion = ({String original, String converted});
