extension DeduplicateExtensions<T> on Iterable<T> {
  Iterable<T> get deduplicated => deduplicateBy((v) => v);

  Iterable<T> deduplicateBy<U>(U Function(T item) transform) => fold(
        [],
        (list, item) => [
          ...list,
          if (!list.map(transform).contains(transform(item))) item,
        ],
      );
}

extension StringDeduplicateExtensions on Iterable<String> {
  Iterable<String> deduplicateCaseInsensitive() => deduplicateBy(
        (item) => item.toLowerCase(),
      );
}
