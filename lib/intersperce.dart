List<T> intersperce<T>(List<T> list, T item) {
  list = List<T>.from(list);

  if (list.length < 2) {
    return list;
  }
  
  final insertCount = list.length - 1;
  
  for (var i = 0; i < insertCount; i++) {
    list.insert(1 + i*2, item);
  }

  return list;
}
