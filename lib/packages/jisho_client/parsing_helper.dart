import "package:html/dom.dart";

extension ParsingHelper on Element {
  T? collect<T>(String selector, T Function(Element e) handler) {
    final foundElement = querySelector(selector);
    return foundElement != null ? handler(foundElement) : null;
  }

  List<T> collectAll<T>(String selector, T Function(Element e) handler) {
    return querySelectorAll(selector).map(handler).toList();
  }

  List<T> collectWhere<T>(String selector, bool Function(Element e) condition,
      T Function(Element e) handler) {
    final List<T> result = [];

    for (final foundElement in querySelectorAll(selector)) {
      if (condition(foundElement)) {
        result.add(handler(foundElement));
      }
    }

    return result;
  }

  T? collectFirstWhere<T>(String selector, bool Function(Element e) condition,
      T Function(Element e) handler) {
    final result = collectWhere(selector, condition, handler);
    return result.isNotEmpty ? result.first : null;
  }
}
