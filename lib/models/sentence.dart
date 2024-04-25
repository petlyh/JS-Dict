part of "models.dart";

class Sentence implements SearchType {
  final String? id;
  final Furigana japanese;
  final String english;
  final SentenceCopyright? copyright;
  final List<Kanji>? kanji;

  bool get isExample => id == null;

  String get url => "https://jisho.org/sentences/$id";

  const Sentence(this.id, this.japanese, this.english)
      : copyright = null,
        kanji = null;

  const Sentence.copyright(this.id, this.japanese, this.english, this.copyright)
      : kanji = null;

  const Sentence.example(this.japanese, this.english)
      : copyright = null,
        id = null,
        kanji = null;

  const Sentence.all(
      this.id, this.japanese, this.english, this.copyright, this.kanji);

  Sentence withKanji(List<Kanji> kanji) =>
      Sentence.all(id, japanese, english, copyright, kanji);
}

class SentenceCopyright {
  final String name;
  final String url;

  const SentenceCopyright(this.name, this.url);
}
