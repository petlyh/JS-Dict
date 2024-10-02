part of "models.dart";

@freezed
class Sentence with _$Sentence implements ResultType {
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
class SentenceCopyright with _$SentenceCopyright {
  const factory SentenceCopyright({
    required String name,
    required String url,
  }) = _SentenceCopyright;
}
