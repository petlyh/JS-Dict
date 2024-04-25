import "package:jsdict/models/models.dart";

String _withoutSuffix(String input, String suffix) {
  return input.replaceFirst(RegExp(suffix + r"$"), "");
}

abstract class InflectionType {
  String get name;
  String get stem;

  String nonPast(bool affermative);
  String past(bool affermative);

  Furigana nonPastFurigana(bool affermative) =>
      furiganaFromText(nonPast(affermative));
  Furigana pastFurigana(bool affermative) =>
      furiganaFromText(past(affermative));

  String get dictionaryForm => nonPast(true);

  String _appendStem(
      bool isAffermative, String affermativePart, String negativePart) {
    return stem + (isAffermative ? affermativePart : negativePart);
  }

  Furigana _furiganaOnStem(String furigana, String suffix) =>
      [FuriganaPart(stem, furigana), FuriganaPart.textOnly(suffix)];
}

abstract class Verb extends InflectionType {
  String nonPastPolite(bool affermative);
  String pastPolite(bool affermative);
  String teForm(bool affermative);
  String potential(bool affermative);
  String passive(bool affermative);
  String causative(bool affermative);
  String causativePassive(bool affermative);
  String imperative(bool affermative);

  Furigana nonPastPoliteFurigana(bool affermative) =>
      furiganaFromText(nonPastPolite(affermative));
  Furigana pastPoliteFurigana(bool affermative) =>
      furiganaFromText(pastPolite(affermative));
  Furigana teFormFurigana(bool affermative) =>
      furiganaFromText(teForm(affermative));
  Furigana potentialFurigana(bool affermative) =>
      furiganaFromText(potential(affermative));
  Furigana passiveFurigana(bool affermative) =>
      furiganaFromText(passive(affermative));
  Furigana causativeFurigana(bool affermative) =>
      furiganaFromText(causative(affermative));
  Furigana causativePassiveFurigana(bool affermative) =>
      furiganaFromText(causativePassive(affermative));
  Furigana imperativeFurigana(bool affermative) =>
      furiganaFromText(imperative(affermative));
}

abstract class FuriganaVerb extends Verb {
  // Subclasses must override all furigana methods to prevent a stack overflow

  @override
  String nonPast(bool affermative) => nonPastFurigana(affermative).text;
  @override
  String past(bool affermative) => pastFurigana(affermative).text;
  @override
  String nonPastPolite(bool affermative) =>
      nonPastPoliteFurigana(affermative).text;
  @override
  String pastPolite(bool affermative) => pastPoliteFurigana(affermative).text;
  @override
  String teForm(bool affermative) => teFormFurigana(affermative).text;
  @override
  String potential(bool affermative) => potentialFurigana(affermative).text;
  @override
  String passive(bool affermative) => passiveFurigana(affermative).text;
  @override
  String causative(bool affermative) => causativeFurigana(affermative).text;
  @override
  String causativePassive(bool affermative) =>
      causativePassiveFurigana(affermative).text;
  @override
  String imperative(bool affermative) => imperativeFurigana(affermative).text;
}

class IAdjective extends InflectionType {
  @override
  final String name = "I-adjective";
  @override
  final String stem;

  @override
  String nonPast(bool affermative) => _appendStem(affermative, "い", "くない");
  @override
  String past(bool affermative) => _appendStem(affermative, "かった", "くなかった");

  IAdjective(String input) : stem = _withoutSuffix(input, "い");
}

class IchidanVerb extends Verb {
  @override
  final String name = "Ichidan verb";
  @override
  final String stem;

  @override
  String nonPast(bool affermative) => _appendStem(affermative, "る", "ない");
  @override
  String past(bool affermative) => _appendStem(affermative, "た", "なかった");
  @override
  String nonPastPolite(bool affermative) =>
      _appendStem(affermative, "ます", "ません");
  @override
  String pastPolite(bool affermative) =>
      _appendStem(affermative, "ました", "ませんでした");
  @override
  String teForm(bool affermative) => _appendStem(affermative, "て", "なくて");
  @override
  String potential(bool affermative) => _appendStem(affermative, "られる", "られない");
  @override
  String passive(bool affermative) => _appendStem(affermative, "られる", "られない");
  @override
  String causative(bool affermative) => _appendStem(affermative, "させる", "させない");
  @override
  String causativePassive(bool affermative) =>
      _appendStem(affermative, "させられる", "させられない");
  @override
  String imperative(bool affermative) => _appendStem(affermative, "ろ", "るな");

  IchidanVerb(String input) : stem = _withoutSuffix(input, "る");
}

class GodanVerb extends Verb {
  @override
  String get name {
    if (_ending == "iku") {
      return "Godan verb - Iku/Yuku special class";
    }

    return "Godan verb with $_ending ending";
  }

  static const Map<String, List<String>> _godanPatterns = {
    "u": ["う", "い", "わ", "え", "っ", "u"],
    "k": ["く", "き", "か", "け", "い", "ku"],
    "k-s": ["く", "き", "か", "け", "っ", "iku"],
    "g": ["ぐ", "ぎ", "が", "げ", "い", "gu"],
    "m": ["む", "み", "ま", "め", "ん", "mu"],
    "n": ["ぬ", "に", "な", "ね", "ん", "nu"],
    "r": ["る", "り", "ら", "れ", "っ", "ru"],
    "b": ["ぶ", "び", "ば", "べ", "ん", "bu"],
    "s": ["す", "し", "さ", "せ", "し", "su"],
    "t": ["つ", "ち", "た", "て", "っ", "tsu"],
    "z": ["ず", "じ", "ざ", "ぜ", "い", "zu"],
  };

  final List<String> _patterns;

  String get _base => _patterns[0];
  String get _renyokei => _patterns[1];
  String get _mizenkei => _patterns[2];
  String get _meireikei => _patterns[3];
  String get _takei => _patterns[4];
  String get _ending => _patterns[5];

  @override
  final String stem;

  bool get isDe => ["ぐ", "む", "ぬ", "ぶ"].contains(_base);

  @override
  String nonPast(bool affermative) =>
      _appendStem(affermative, _base, "$_mizenkeiない");
  @override
  String past(bool affermative) => isDe
      ? _appendStem(affermative, "$_takeiだ", "$_mizenkeiなかった")
      : _appendStem(affermative, "$_takeiた", "$_mizenkeiなかった");
  @override
  String nonPastPolite(bool affermative) =>
      _appendStem(affermative, "$_renyokeiます", "$_renyokeiません");
  @override
  String pastPolite(bool affermative) =>
      _appendStem(affermative, "$_renyokeiました", "$_renyokeiませんでした");
  @override
  String teForm(bool affermative) => isDe
      ? _appendStem(affermative, "$_takeiで", "$_mizenkeiなくて")
      : _appendStem(affermative, "$_takeiて", "$_mizenkeiなくて");
  @override
  String potential(bool affermative) =>
      _appendStem(affermative, "$_meireikeiる", "$_meireikeiない");
  @override
  String passive(bool affermative) =>
      _appendStem(affermative, "$_mizenkeiれる", "$_mizenkeiれない");
  @override
  String causative(bool affermative) =>
      _appendStem(affermative, "$_mizenkeiせる", "$_mizenkeiせない");
  @override
  String causativePassive(bool affermative) =>
      _appendStem(affermative, "$_mizenkeiせられる", "$_mizenkeiせられない");
  @override
  String imperative(bool affermative) =>
      _appendStem(affermative, _meireikei, "$_baseな");

  GodanVerb(String input, String type)
      : stem = input.substring(0, input.length - 1),
        _patterns = _godanPatterns[type]!;
}

class Kuru extends FuriganaVerb {
  @override
  final String name = "Kuru verb - special class";
  @override
  final String stem = "来";

  @override
  Furigana nonPastFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("く", "る") : _furiganaOnStem("こ", "ない");
  @override
  Furigana pastFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("き", "た") : _furiganaOnStem("こ", "なかった");
  @override
  Furigana nonPastPoliteFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("き", "ます") : _furiganaOnStem("き", "ません");
  @override
  Furigana pastPoliteFurigana(bool affermative) => affermative
      ? _furiganaOnStem("き", "ました")
      : _furiganaOnStem("き", "ませんでした");
  @override
  Furigana teFormFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("き", "て") : _furiganaOnStem("こ", "なくて");
  @override
  Furigana potentialFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("こ", "られる") : _furiganaOnStem("こ", "られない");
  @override
  Furigana passiveFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("こ", "られる") : _furiganaOnStem("こ", "られない");
  @override
  Furigana causativeFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("こ", "させる") : _furiganaOnStem("こ", "させない");
  @override
  Furigana causativePassiveFurigana(bool affermative) => affermative
      ? _furiganaOnStem("こ", "させられる")
      : _furiganaOnStem("こ", "させられない");
  @override
  Furigana imperativeFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("こ", "い") : _furiganaOnStem("く", "るな");
}

class SuruSpecial extends FuriganaVerb {
  @override
  final String name = "Suru verb - included";
  @override
  final String stem = "為";

  @override
  Furigana nonPastFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("す", "る") : _furiganaOnStem("し", "ない");
  @override
  Furigana pastFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("し", "た") : _furiganaOnStem("し", "なかった");
  @override
  Furigana nonPastPoliteFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("し", "ます") : _furiganaOnStem("し", "ません");
  @override
  Furigana pastPoliteFurigana(bool affermative) => affermative
      ? _furiganaOnStem("し", "ました")
      : _furiganaOnStem("し", "ませんでした");
  @override
  Furigana teFormFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("し", "て") : _furiganaOnStem("し", "なくて");
  @override
  Furigana potentialFurigana(bool affermative) =>
      affermative ? furiganaFromText("できる") : furiganaFromText("できない");
  @override
  Furigana passiveFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("さ", "れる") : _furiganaOnStem("さ", "れない");
  @override
  Furigana causativeFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("さ", "せる") : _furiganaOnStem("さ", "せない");
  @override
  Furigana causativePassiveFurigana(bool affermative) => affermative
      ? _furiganaOnStem("さ", "せられる")
      : _furiganaOnStem("さ", "せられない");
  @override
  Furigana imperativeFurigana(bool affermative) =>
      affermative ? _furiganaOnStem("し", "ろ") : _furiganaOnStem("す", "るな");
}

class SuruVerb extends Verb {
  @override
  final String name = "Suru verb - included";
  @override
  final String stem;

  final Verb suru = SuruSpecial();

  @override
  String nonPast(bool affermative) =>
      stem + suru.nonPastFurigana(affermative).reading;
  @override
  String past(bool affermative) =>
      stem + suru.pastFurigana(affermative).reading;
  @override
  String nonPastPolite(bool affermative) =>
      stem + suru.nonPastPoliteFurigana(affermative).reading;
  @override
  String pastPolite(bool affermative) =>
      stem + suru.pastPoliteFurigana(affermative).reading;
  @override
  String teForm(bool affermative) =>
      stem + suru.teFormFurigana(affermative).reading;
  @override
  String potential(bool affermative) =>
      stem + suru.potentialFurigana(affermative).reading;
  @override
  String passive(bool affermative) =>
      stem + suru.passiveFurigana(affermative).reading;
  @override
  String causative(bool affermative) =>
      stem + suru.causativeFurigana(affermative).reading;
  @override
  String causativePassive(bool affermative) =>
      stem + suru.causativePassiveFurigana(affermative).reading;
  @override
  String imperative(bool affermative) =>
      stem + suru.imperativeFurigana(affermative).reading;

  SuruVerb(String input) : stem = _withoutSuffix(input, "する");
}
