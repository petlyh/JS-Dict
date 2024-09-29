import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("has next page", () async {
    final response1 = await client.search<Word>("喜怒哀楽");
    expect(response1.hasNextPage, isFalse);

    final response2 = await client.search<Word>("物");
    expect(response2.hasNextPage, isTrue);
  });

  test("decoding HTML entities", () async {
    final kanji = await client.kanjiDetails("張");
    expect(kanji.meanings, contains("counter for bows & stringed instruments"));
  });
}
