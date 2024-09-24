import "package:jsdict/packages/katakana_convert.dart";
import "package:test/test.dart";

void main() {
  test("convert katakana", () {
    expect(convertKatakana("チョク"), "ちょく");
    expect(convertKatakana("あに"), "あに");
  });
}
