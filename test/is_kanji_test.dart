import "package:jsdict/packages/is_kanji.dart";
import "package:test/test.dart";

void main() {
  test("isKanji", () {
    expect(isKanji("悪因悪果"), isTrue);
    expect(isKanji("見る"), isFalse);
    expect(isKanji("カラオケ"), isFalse);
    expect(isKanji("not kanji"), isFalse);
  });
}
