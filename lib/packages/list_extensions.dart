import "package:collection/collection.dart";

extension ListExtensions on List<dynamic> {
  List<T> intersperce<T>(T item) => List<T>.from(this)
      .map((element) => [item, element])
      .flattened
      .toList()
      .sublist(1);

  List<T> deduplicate<T>() => toSet().toList() as List<T>;

  List<T> deduplicateBy<T>(T Function(T item) transform) =>
      (this as List<T>).fold(
        [],
        (list, item) => list.map(transform).contains(transform(item))
            ? list
            : list + [item],
      );
}

extension StringListExtensions on List<String> {
  List<String> deduplicateCaseInsensitive() =>
      deduplicateBy((item) => item.toLowerCase());
}
