part of "parser.dart";

extension _ElementTrimmedText on Element {
  String get trimmedText => text.trim();
}

extension _ElementsTrimmedText on List<Element> {
  List<String> get allTrimmedText => map((e) => e.trimmedText).toList();
}

extension _NodeTrimmedText on Node {
  String? get trimmedText => text?.trim();
}

extension _NodeListTrimmedText on NodeList {
  List<String> get allTrimmedText =>
      where((node) => node.nodeType == Node.TEXT_NODE)
          .map((node) => node.trimmedText)
          .whereNotNull()
          .toList();
}
