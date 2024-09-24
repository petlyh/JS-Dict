import "package:jsdict/models/models.dart";

typedef InflectionEntry = ({Furigana affermative, Furigana negative});
typedef _StringInflectionEntry = ({String affermative, String negative});

sealed class InflectionData {
  final String name;

  const InflectionData._(this.name);

  factory InflectionData(String word, String code) =>
      _createInflectionData(word, code);

  Map<String, InflectionEntry> toMap();
}

class IAdjectiveData extends InflectionData {
  final InflectionEntry nonPast;
  final InflectionEntry past;

  IAdjectiveData._({
    required _StringInflectionEntry nonPast,
    required _StringInflectionEntry past,
  })  : nonPast = nonPast.furigana,
        past = past.furigana,
        super._("I-adjective");

  @override
  Map<String, InflectionEntry> toMap() => {"Non-past": nonPast, "Past": past};
}

class VerbData extends InflectionData {
  final InflectionEntry nonPast;
  final InflectionEntry past;
  final InflectionEntry nonPastPolite;
  final InflectionEntry pastPolite;
  final InflectionEntry teForm;
  final InflectionEntry potential;
  final InflectionEntry passive;
  final InflectionEntry causative;
  final InflectionEntry causativePassive;
  final InflectionEntry imperative;

  const VerbData._({
    required String name,
    required this.nonPast,
    required this.past,
    required this.nonPastPolite,
    required this.pastPolite,
    required this.teForm,
    required this.potential,
    required this.passive,
    required this.causative,
    required this.causativePassive,
    required this.imperative,
  }) : super._(name);

  VerbData._nonFurigana({
    required String name,
    required _StringInflectionEntry nonPast,
    required _StringInflectionEntry past,
    required _StringInflectionEntry nonPastPolite,
    required _StringInflectionEntry pastPolite,
    required _StringInflectionEntry teForm,
    required _StringInflectionEntry potential,
    required _StringInflectionEntry passive,
    required _StringInflectionEntry causative,
    required _StringInflectionEntry causativePassive,
    required _StringInflectionEntry imperative,
  })  : nonPast = nonPast.furigana,
        past = past.furigana,
        nonPastPolite = nonPastPolite.furigana,
        pastPolite = pastPolite.furigana,
        teForm = teForm.furigana,
        potential = potential.furigana,
        passive = passive.furigana,
        causative = causative.furigana,
        causativePassive = causativePassive.furigana,
        imperative = imperative.furigana,
        super._(name);

  @override
  Map<String, InflectionEntry> toMap() => {
        "Non-past": nonPast,
        "Non-past, polite": nonPastPolite,
        "Past": past,
        "Past, polite": pastPolite,
        "Te-form": teForm,
        "Potential": potential,
        "Passive": passive,
        "Causative": causative,
        "Causative, Passive": causativePassive,
        "Imperative": imperative,
      };
}

InflectionData _createInflectionData(String word, String code) =>
    code == "adj-i" ? _iAdjective(word) : _verb(word, code.substring(1));

VerbData _verb(String word, String code) => switch (code) {
      "s-i" => word == "為る" ? _suruSpecial : _suru(word),
      "k" => _kuru,
      "1" => _ichidan(word),
      _ => code.startsWith("5")
          ? _godan(word, _GodanData.fromCode(code.substring(1)))
          : throw Exception("Unknown inflection type: $code"),
    };

IAdjectiveData _iAdjective(String word) => _withStem(
    word,
    "い",
    (stem) => IAdjectiveData._(
          nonPast: (
            affermative: word,
            negative: "$stemくない",
          ),
          past: (
            affermative: "$stemかった",
            negative: "$stemくなかった",
          ),
        ));

VerbData _ichidan(String word) => _withStem(
      word,
      "る",
      (stem) => VerbData._nonFurigana(
        name: "Ichidan verb",
        nonPast: (affermative: word, negative: "$stemない"),
        past: (affermative: "$stemた", negative: "$stemなかった"),
        nonPastPolite: (affermative: "$stemます", negative: "$stemません"),
        pastPolite: (affermative: "$stemました", negative: "$stemませんでした"),
        teForm: (affermative: "$stemて", negative: "$stemなくて"),
        potential: (affermative: "$stemられる", negative: "$stemられない"),
        passive: (affermative: "$stemられる", negative: "$stemられない"),
        causative: (affermative: "$stemさせる", negative: "$stemさせない"),
        causativePassive: (affermative: "$stemさせられる", negative: "$stemさせられない"),
        imperative: (affermative: "$stemろ", negative: "$stemるな"),
      ),
    );

T _withStem<T>(String input, String suffix, T Function(String stem) f) =>
    f(input.replaceFirst(RegExp(suffix + r"$"), ""));

enum _GodanData {
  u("う", "い", "わ", "え", "っ", "u"),
  ku("く", "き", "か", "け", "い", "ku"),
  iku("く", "き", "か", "け", "っ", "iku"),
  gu("ぐ", "ぎ", "が", "げ", "い", "gu"),
  mu("む", "み", "ま", "め", "ん", "mu"),
  nu("ぬ", "に", "な", "ね", "ん", "nu"),
  ru("る", "り", "ら", "れ", "っ", "ru"),
  bu("ぶ", "び", "ば", "べ", "ん", "bu"),
  su("す", "し", "さ", "せ", "し", "su"),
  tsu("つ", "ち", "た", "て", "っ", "tsu"),
  zu("ず", "じ", "ざ", "ぜ", "い", "zu");

  final String base;
  final String renyokei;
  final String mizenkei;
  final String meireikei;
  final String takei;
  final String ending;

  const _GodanData(this.base, this.renyokei, this.mizenkei, this.meireikei,
      this.takei, this.ending);

  factory _GodanData.fromCode(String code) => switch (code) {
        "u" => u,
        "k" => ku,
        "k-s" => iku,
        "g" => gu,
        "m" => mu,
        "n" => nu,
        "r" => ru,
        "b" => bu,
        "s" => su,
        "t" => tsu,
        "z" => zu,
        _ => throw Exception("Unknown godan type code: $code"),
      };

  String get name => this == iku
      ? "Godan verb - Iku/Yuku special class"
      : "Godan verb with '$ending' ending";

  bool get isDe => ["ぐ", "む", "ぬ", "ぶ"].contains(base);
}

VerbData _godan(String word, _GodanData data) => _withStem(
      word,
      data.base,
      (stem) => VerbData._nonFurigana(
        name: data.name,
        nonPast: (affermative: word, negative: "$stem${data.mizenkei}ない"),
        past: (
          affermative: stem + data.takei + (data.isDe ? "だ" : "た"),
          negative: "$stem${data.mizenkei}なかった",
        ),
        nonPastPolite: (
          affermative: "$stem${data.renyokei}ます",
          negative: "$stem${data.renyokei}ません",
        ),
        pastPolite: (
          affermative: "$stem${data.renyokei}ました",
          negative: "$stem${data.renyokei}ませんでした",
        ),
        teForm: (
          affermative: stem + data.takei + (data.isDe ? "で" : "て"),
          negative: "$stem${data.mizenkei}なくて",
        ),
        potential: (
          affermative: "$stem${data.meireikei}る",
          negative: "$stem${data.meireikei}ない",
        ),
        passive: (
          affermative: "$stem${data.mizenkei}れる",
          negative: "$stem${data.mizenkei}れない",
        ),
        causative: (
          affermative: "$stem${data.mizenkei}せる",
          negative: "$stem${data.mizenkei}せない",
        ),
        causativePassive: (
          affermative: "$stem${data.mizenkei}せられる",
          negative: "$stem${data.mizenkei}せられない",
        ),
        imperative: (
          affermative: "$stem${data.meireikei}",
          negative: "$stem${data.base}な",
        ),
      ),
    );

typedef _FuriganaSuffixer = Furigana Function(String furigana, String suffix);

T _withFuriganaSuffixer<T>(
        String stem, T Function(_FuriganaSuffixer suffix) f) =>
    f((furigana, suffix) =>
        [FuriganaPart(stem, furigana), FuriganaPart.textOnly(suffix)]);

final _kuru = _withFuriganaSuffixer(
    "来",
    (suffix) => VerbData._(
          name: "Kuru verb - special class",
          nonPast: (
            affermative: suffix("く", "る"),
            negative: suffix("こ", "ない"),
          ),
          past: (
            affermative: suffix("き", "た"),
            negative: suffix("こ", "なかった"),
          ),
          nonPastPolite: (
            affermative: suffix("き", "ます"),
            negative: suffix("き", "ません"),
          ),
          pastPolite: (
            affermative: suffix("き", "ました"),
            negative: suffix("き", "ませんでした"),
          ),
          teForm: (
            affermative: suffix("き", "て"),
            negative: suffix("こ", "なくて"),
          ),
          potential: (
            affermative: suffix("こ", "られる"),
            negative: suffix("こ", "られない"),
          ),
          passive: (
            affermative: suffix("こ", "られる"),
            negative: suffix("こ", "られない"),
          ),
          causative: (
            affermative: suffix("こ", "させる"),
            negative: suffix("こ", "させない"),
          ),
          causativePassive: (
            affermative: suffix("こ", "させられる"),
            negative: suffix("こ", "させられない"),
          ),
          imperative: (
            affermative: suffix("こ", "い"),
            negative: suffix("く", "るな"),
          ),
        ));

final _suruSpecial = _withFuriganaSuffixer(
    "為",
    (suffix) => VerbData._(
          name: "Suru verb - included",
          nonPast: (
            affermative: suffix("す", "る"),
            negative: suffix("し", "ない"),
          ),
          past: (
            affermative: suffix("し", "た"),
            negative: suffix("し", "なかった"),
          ),
          nonPastPolite: (
            affermative: suffix("し", "ます"),
            negative: suffix("し", "ません"),
          ),
          pastPolite: (
            affermative: suffix("し", "ました"),
            negative: suffix("し", "ませんでした"),
          ),
          teForm: (
            affermative: suffix("し", "て"),
            negative: suffix("し", "なくて"),
          ),
          potential: (
            affermative: "できる".furigana,
            negative: "できない".furigana,
          ),
          passive: (
            affermative: suffix("さ", "れる"),
            negative: suffix("さ", "れない"),
          ),
          causative: (
            affermative: suffix("さ", "せる"),
            negative: suffix("さ", "せない"),
          ),
          causativePassive: (
            affermative: suffix("さ", "せられる"),
            negative: suffix("さ", "せられない"),
          ),
          imperative: (
            affermative: suffix("し", "ろ"),
            negative: suffix("す", "るな"),
          ),
        ));

_StringInflectionEntry _entryReadingWithStem(
        String stem, InflectionEntry entry) =>
    (
      affermative: stem + entry.affermative.reading,
      negative: stem + entry.negative.reading
    );

VerbData _suru(String word) => _withStem(
      word,
      "する",
      (stem) => VerbData._nonFurigana(
        name: _suruSpecial.name,
        nonPast: _entryReadingWithStem(stem, _suruSpecial.nonPast),
        past: _entryReadingWithStem(stem, _suruSpecial.past),
        nonPastPolite: _entryReadingWithStem(stem, _suruSpecial.nonPastPolite),
        pastPolite: _entryReadingWithStem(stem, _suruSpecial.pastPolite),
        teForm: _entryReadingWithStem(stem, _suruSpecial.teForm),
        potential: _entryReadingWithStem(stem, _suruSpecial.potential),
        passive: _entryReadingWithStem(stem, _suruSpecial.passive),
        causative: _entryReadingWithStem(stem, _suruSpecial.causative),
        causativePassive:
            _entryReadingWithStem(stem, _suruSpecial.causativePassive),
        imperative: _entryReadingWithStem(stem, _suruSpecial.imperative),
      ),
    );

extension _FuriganaRecordExtension on ({String affermative, String negative}) {
  InflectionEntry get furigana =>
      (affermative: affermative.furigana, negative: negative.furigana);
}
