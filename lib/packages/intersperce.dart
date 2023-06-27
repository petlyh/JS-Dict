List<T> intersperce<T>(List<T> list, T item) {
  final typedList = List<T>.from(list);

  if (typedList.length < 2) {
    return typedList;
  }
  
  final insertCount = typedList.length - 1;
  
  for (var i = 0; i < insertCount; i++) {
    typedList.insert(1 + i*2, item);
  }

  return typedList;
}
