extension Intersperce on List<dynamic> {
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
}
