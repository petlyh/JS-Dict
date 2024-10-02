part of "models.dart";

class Name implements ResultType {
  final String japanese;
  final String? reading;
  final String english;

  /// null if type is "Unclassified name"
  final String? type;

  /// The ID of the corresponding [Word], if available.
  /// 
  /// Names seem to only be linked to a [Word] if the word has Wikipedia data.
  final String? wordId;

  @override
  String toString() => reading != null ? "$japanese【$reading】" : japanese;

  const Name(
    this.japanese,
    this.reading,
    this.english,
    this.type,
    this.wordId,
  );
}
