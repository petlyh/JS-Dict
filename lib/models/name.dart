part of "models.dart";

class Name implements SearchType {
  final String japanese;
  final String? reading;
  final String english;

  /// null if type is "Unclassified name"
  final String? type;

  /// id of a corresponding [Word] that has a Wikipedia definition
  final String? wikipediaWord;

  @override
  String toString() => reading != null ? "$japanese【$reading】" : japanese;

  const Name(
    this.japanese,
    this.reading,
    this.english,
    this.type,
    this.wikipediaWord,
  );
}
