import 'package:ruby_text/ruby_text.dart';

typedef Furigana = List<FuriganaPart>;

class FuriganaPart {
  final String text;
  final String furigana;
  FuriganaPart(this.text, this.furigana);
  FuriganaPart.textOnly(this.text) : furigana = "";
}

Furigana furiganaFromText(String text) => [FuriganaPart.textOnly(text)];

extension FuriganaMethods on Furigana {
  String getText() {
    return map((part) => part.text.trim()).join().trim();
  }

  String getReading() {
    return map((part) => part.furigana.isNotEmpty ? part.furigana : part.text).join().trim();
  }

  List<RubyTextData> toRubyData() {
    return map((part) => part.furigana.isEmpty ? RubyTextData(part.text) : RubyTextData(part.text, ruby: part.furigana)).toList();
  }
}