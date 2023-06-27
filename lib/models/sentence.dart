import "furigana.dart";
import "kanji.dart";

class Sentence {
  final String id;
  final Furigana japanese;
  final String english;
  final SentenceCopyright? copyright;

  List<Kanji> kanji = [];

  Sentence(this.id, this.japanese, this.english) : copyright = null;
  Sentence.copyright(this.id, this.japanese, this.english, this.copyright);
}

class SentenceCopyright {
  final String name;
  final String url;
  SentenceCopyright(this.name, this.url);
}