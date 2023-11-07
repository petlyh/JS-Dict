part of "models.dart";

class Name implements SearchType {
  final String reading;
  final String name;
  final String type;

  /// id of a corresponding [Word] that has a Wikipedia definition
  final String? wikipediaWord;

  const Name(this.reading, this.name, this.type, {this.wikipediaWord});
}
