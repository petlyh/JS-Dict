part of "models.dart";

sealed class SearchType {}

class SearchResponse<T extends SearchType> {
  Correction? correction;
  List<String> noMatchesFor = [];
  GrammarInfo? grammarInfo;
  Conversion? conversion;

  List<String> zenEntries = [];

  bool hasNextPage = false;

  List<T> results = [];

  void addResults(List<dynamic> list) {
    if (list is List<T>) {
      results.addAll(list);
    }
  }
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