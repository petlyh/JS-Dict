part of "models.dart";

typedef Furigana = List<FuriganaPart>;

class FuriganaPart {
  final String text;
  final String furigana;

  const FuriganaPart(this.text, this.furigana);
  const FuriganaPart.textOnly(this.text) : furigana = "";
}

Furigana furiganaFromText(String text) => [FuriganaPart.textOnly(text)];

extension FuriganaMethods on Furigana {
  String get text => map((part) => part.text.trim()).join().trim();

  String get reading =>
      map((part) => part.furigana.isNotEmpty ? part.furigana : part.text)
          .join()
          .trim();

  bool get hasFurigana => where((part) => part.furigana.isNotEmpty).isNotEmpty;

  List<RubyTextData> get rubyData => map((part) => RubyTextData(part.text,
      ruby: part.furigana.isNotEmpty ? part.furigana : null)).toList();
}
