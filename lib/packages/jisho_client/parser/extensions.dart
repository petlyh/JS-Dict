part of "parser.dart";

extension _ElementTrimmedText on Element {
  String get trimmedText => text.trim();
}

extension _ElementsTrimmedText on List<Element> {
  List<String> get allTrimmedText => map((e) => e.trimmedText).toList();
}
