class SearchResponse<T> {
  String correction = "";
  String suggestion = "";

  bool hasNextPage = false;

  List<T> results = [];

  void addResults(List list) {
    if (list is List<T>) {
      results.addAll(list);
    }
  }
}