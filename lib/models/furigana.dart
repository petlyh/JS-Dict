part of "models.dart";

typedef Furigana = List<FuriganaPart>;

@freezed
class FuriganaPart with _$FuriganaPart {
  const factory FuriganaPart(String text, [String? furigana]) = _FuriganaPart;

  const FuriganaPart._();

  @override
  String toString() => text + (furigana != null ? "($furigana)" : "");
}

extension FuriganaMethods on Furigana {
  String get text => map((part) => part.text.trim()).join().trim();

  String get reading => map((part) => part.furigana ?? part.text).join().trim();

  bool get hasFurigana => any((part) => part.furigana != null);
}

extension FuriganaStringExtension on String {
  Furigana get furigana => [FuriganaPart(this)];
}
