part of "models.dart";

typedef Furigana = List<FuriganaPart>;

class FuriganaPart {
  final String text;
  final String furigana;

  const FuriganaPart(this.text, this.furigana);
  const FuriganaPart.textOnly(this.text) : furigana = "";

  @override
  bool operator ==(Object other) =>
      other is FuriganaPart && text == other.text && furigana == other.furigana;

  @override
  int get hashCode => Object.hash(text, furigana);

  @override
  String toString() => text + (furigana.isNotEmpty ? "($furigana)" : "");
}

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

extension FuriganaStringExtension on String {
  Furigana get furigana => [FuriganaPart.textOnly(this)];
}
