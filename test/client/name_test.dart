import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test(
    "name",
    () async => expect(
      (await client.search<Name>("yoko shimomura")).results.firstOrNull,
      equals(
        const Name(
          japanese: "下村陽子",
          english: "Yoko Shimomura",
          reading: "しもむらようこ",
          type: "Full name",
          wordId: "下村陽子",
        ),
      ),
    ),
  );

  test(
    "nname (kanjiless, no reading)",
    () async => expect(
      (await client.search<Name>("ashita")).results.firstOrNull,
      equals(
        const Name(
          japanese: "あした",
          english: "Ashita",
          type: "Female given name",
        ),
      ),
    ),
  );
}
