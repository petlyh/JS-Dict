part of "models.dart";

class Sentence implements ResultType {
  const Sentence({
    required this.japanese,
    required this.english,
    this.id,
    this.copyright,
    this.kanji,
  });

  final Furigana japanese;
  final String english;
  final String? id;
  final SentenceCopyright? copyright;
  final List<Kanji>? kanji;

  bool get isExample => id == null;

  String get url => "https://jisho.org/sentences/$id";

  Sentence withKanji(List<Kanji> kanji) => Sentence(
        japanese: japanese,
        english: english,
        id: id,
        copyright: copyright,
        kanji: kanji,
      );
}

// TODO: record typedef instead?
class SentenceCopyright {
  final String name;
  final String url;

  const SentenceCopyright(this.name, this.url);
}
