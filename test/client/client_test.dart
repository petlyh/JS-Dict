import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("decoding HTML entities", () async {
    final kanji = await client.kanjiDetails("張");
    expect(kanji.meanings, contains("counter for bows & stringed instruments"));
  });
}
