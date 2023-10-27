import "package:flutter_test/flutter_test.dart";
import "package:jsdict/packages/katakana_convert.dart";

void main() {
  test("convert katakana", () {
    expect(convertKatakana("チョク"), "ちょく");
    expect(convertKatakana("あに"), "あに");
  });
}
