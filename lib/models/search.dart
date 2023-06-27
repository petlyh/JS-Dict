class SearchResponse<T> {
  String correction = "";
  String suggestion = "";

  bool hasNextPage = false;

  List<T> results = [];

  void addResults(List<dynamic> list) {
    if (list is List<T>) {
      results.addAll(list);
    }
  }
}