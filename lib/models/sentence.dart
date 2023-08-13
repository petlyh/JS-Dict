part of "models.dart";

class Sentence {
  final String id;
  final Furigana japanese;
  final String english;
  final SentenceCopyright? copyright;

  bool get isExample => id.isEmpty;

  Sentence(this.id, this.japanese, this.english) : copyright = null;
  Sentence.copyright(this.id, this.japanese, this.english, this.copyright);
  Sentence.example(this.japanese, this.english) : copyright = null, id = "";
}

class SentenceCopyright {
  final String name;
  final String url;
  SentenceCopyright(this.name, this.url);
}