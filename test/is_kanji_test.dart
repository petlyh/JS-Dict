import "package:jsdict/packages/is_kanji.dart";
import "package:test/test.dart";

void main() {
  test("isKanjiOnly", () {
    expect(isKanjiOnly("悪因悪果"), isTrue);
    expect(isKanjiOnly("見る"), isFalse);
    expect(isKanjiOnly("カラオケ"), isFalse);
    expect(isKanjiOnly("not kanji"), isFalse);
  });

  test("isNonKanji", () {
    expect(isNonKanji("悪因悪果"), isFalse);
    expect(isNonKanji("見る"), isFalse);
    expect(isNonKanji("カラオケ"), isTrue);
    expect(isNonKanji("not kanji"), isTrue);
  });
}
