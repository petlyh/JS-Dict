import "package:flutter_riverpod/flutter_riverpod.dart" hide Provider;
import "package:jsdict/packages/remove_tags.dart";

final queryProvider =
    NotifierProvider<QueryController, String>(QueryController.new);

class QueryController extends Notifier<String> {
  @override
  String build() => "";

  void update(String newQuery) {
    if (state != newQuery) {
      state = _sanitizeQuery(newQuery);
    }
  }

  String _sanitizeQuery(String query) =>
      removeTypeTags(query).trim().replaceAll(RegExp(r"\s+"), " ");
}
