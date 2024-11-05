import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

import "util.dart";

Future<void> Function() _furiganaTest(String wordId, Furigana furigana) =>
    () async => expectEquals(
          (await JishoClient().wordDetails(wordId)).word,
          furigana,
        );

void main() {
  test("nani", _furiganaTest("何", const [FuriganaPart("何", "なに")]));

  test(
    "arifureta",
    _furiganaTest("有り触れた", const [
      FuriganaPart("有", "あ"),
      FuriganaPart("り"),
      FuriganaPart("触", "ふ"),
      FuriganaPart("れ"),
      FuriganaPart("た"),
    ]),
  );

  test(
    "gohan",
    _furiganaTest("ご飯", const [FuriganaPart("ご"), FuriganaPart("飯", "はん")]),
  );

  test(
    "gozonji",
    _furiganaTest(
      "ご存じ",
      const [FuriganaPart("ご"), FuriganaPart("存知", "ぞんじ")],
    ),
  );
}
