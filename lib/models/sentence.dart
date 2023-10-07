part of "models.dart";

class Sentence implements SearchType {
  final String id;
  final Furigana japanese;
  final String english;
  final SentenceCopyright? copyright;

  bool get isExample => id.isEmpty;

  const Sentence(this.id, this.japanese, this.english) : copyright = null;
  const Sentence.copyright(this.id, this.japanese, this.english, this.copyright);
  const Sentence.example(this.japanese, this.english) : copyright = null, id = "";
}

class SentenceCopyright {
  final String name;
  final String url;

  const SentenceCopyright(this.name, this.url);
}