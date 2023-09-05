part of "models.dart";

class SearchResponse<T> {
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