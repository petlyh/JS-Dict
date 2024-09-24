import "package:jsdict/models/models.dart";
import "package:ruby_text/ruby_text.dart";

extension FuriganaMethods on Furigana {
  List<RubyTextData> get rubyData => map((part) => RubyTextData(part.text,
      ruby: part.furigana.isNotEmpty ? part.furigana : null)).toList();
}
