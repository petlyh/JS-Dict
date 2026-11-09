part of "models.dart";

@freezed
sealed class Sentence with _$Sentence implements ResultType {
  const factory Sentence({
    required Furigana japanese,
    required String english,
    String? id,
    SentenceCopyright? copyright,
    List<Kanji>? kanji,
  }) = _Sentence;

  const Sentence._();

  String get url => "https://jisho.org/sentences/$id";
}

@freezed
sealed class SentenceCopyright with _$SentenceCopyright {
  const factory SentenceCopyright({
    required String name,
    required String url,
  }) = _SentenceCopyright;
}
