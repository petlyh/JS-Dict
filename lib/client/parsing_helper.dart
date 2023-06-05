import 'package:html/dom.dart';

extension ParsingHelper on Element {
  T? collect<T>(String selector, T Function(Element e) handler) {
    final foundElement = querySelector(selector);
    return foundElement != null ? handler(foundElement) : null;
  }

  T? collectWhere<T>(String selector, bool Function(Element e) condition, T Function(Element e) handler) {
    for (final foundElement in querySelectorAll(selector)) {
      if (condition(foundElement)) {
        return handler(foundElement);
      }
    }

    return null;
  }

  List<T> collectAll<T>(String selector, T Function(Element e) handler) {
    return querySelectorAll(selector).map(handler).toList();
  }
}