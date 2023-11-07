part of "models.dart";

class Name implements SearchType {
  final String reading;
  final String name;

  /// id of a corresponding [Word] that has a Wikipedia definition
  final String? wikipediaWord;

  const Name(this.reading, this.name, {this.wikipediaWord});
}
