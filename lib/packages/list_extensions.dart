extension ListExtensions on List<dynamic> {
  List<T> intersperce<T>(T item) {
    final typedList = List<T>.from(this);

    if (typedList.length < 2) {
      return typedList;
    }
    
    final insertCount = typedList.length - 1;
    
    for (var i = 0; i < insertCount; i++) {
      typedList.insert(1 + i*2, item);
    }

    return typedList;
  }

  List<T> deduplicate<T>() => toSet().toList() as List<T>;

  List<T> deduplicateBy<T>(T Function(T item) transform) {
    final List<T> result = [];

    for (final item in this as List<T>) {
      if (result.map(transform).contains(transform(item))) {
        continue;
      }

      result.add(item);
    }

    return result;
  }
}

extension StringListExtensions on List<String> {
  List<String> deduplicateCaseInsensitive() =>
      deduplicateBy((item) => item.toLowerCase());
}
