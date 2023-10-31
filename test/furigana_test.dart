import "package:flutter_test/flutter_test.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/furigana.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";

Future<void> Function() _furiganaTest(String wordId, String text, String reading) {
  return () async {
    final wordDetails = await JishoClient().wordDetails(wordId);
    expect(wordDetails.word.getText(), text);
    expect(wordDetails.word.getReading(), reading);
  };
}

void main() {
  test("nani", _furiganaTest("何", "何", "なに"));
  test("arifureta", _furiganaTest("有り触れた", "有り触れた", "ありふれた"));
  test("gohan", _furiganaTest("ご飯", "ご飯", "ごはん"));
  test("gozonji", _furiganaTest("ご存じ", "ご存知", "ごぞんじ"));

  test("isKanji", () {
    expect(isKanji("悪因悪果"), isTrue);
    expect(isKanji("見る"), isFalse);
    expect(isKanji("カラオケ"), isFalse);
    expect(isKanji("not kanji"), isFalse);
  });
}