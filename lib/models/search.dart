part of "models.dart";

sealed class SearchType {}

class SearchResponse<T extends SearchType> {
  Correction? correction;
  List<String> noMatchesFor = [];

  bool hasNextPage = false;

  List<T> results = [];

  void addResults(List<dynamic> list) {
    if (list is List<T>) {
      results.addAll(list);
    }
  }
}

class Correction {
  final String searchedFor;
  final String suggestion;

  const Correction(this.searchedFor, this.suggestion);
}