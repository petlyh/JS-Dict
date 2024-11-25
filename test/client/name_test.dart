import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

import "util.dart";

void main() {
  final client = JishoClient();

  test(
    "name",
    () async => expectEquals(
      (await client.search<Name>("yoko shimomura")).results.firstOrNull,
      const Name(
        japanese: "下村陽子",
        english: "Yoko Shimomura",
        reading: "しもむらようこ",
        type: "Full name",
        wordId: "下村陽子",
      ),
    ),
  );

  test(
    "name (kanjiless, no reading)",
    () async => expectEquals(
      (await client.search<Name>("ashita")).results.firstOrNull,
      const Name(
        japanese: "あした",
        english: "Ashita",
        type: "Female given name",
      ),
    ),
  );
}
