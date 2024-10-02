part of "models.dart";

@freezed
class Name with _$Name implements ResultType {
  const factory Name({
    required String japanese,
    required String english,
    String? reading,

    /// null if type is "Unclassified name"
    String? type,

    /// The ID of the corresponding [Word], if available.
    ///
    /// Names seem to only be linked to a [Word] if the word has Wikipedia data.
    String? wordId,
  }) = _Name;
}
