import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("search correction", () async {
    final response = await client.search<Word>("atatakai");
    expect(response.correction, isNotNull);
    expect(response.correction!.effective, "あたたかい");
    expect(response.correction!.original, '"atatakai"');
    expect(response.correction!.noMatchesForOriginal, false);
  });

  test("search correction no matches", () async {
    final response = await client.search<Word>("込めて");
    expect(response.correction, isNotNull);
    expect(response.correction!.effective, "込める");
    expect(response.correction!.original, "込めて");
    expect(response.correction!.noMatchesForOriginal, true);
  });

  test("grammar info", () async {
    final response = await client.search<Word>("arifureta");
    expect(response.grammarInfo, isNotNull);
    expect(response.grammarInfo!.word, "ありふれた");
    expect(response.grammarInfo!.possibleInflectionOf, "ありふれる");
    expect(
      response.grammarInfo!.formInfos,
      ["Ta-form. It indicates the past tense of the verb."],
    );
  });

  test("year converion", () async {
    final response = await client.search<Word>("昭和５２");
    expect(response.conversion, isNotNull);
    expect(response.conversion!.original, "昭和５２");
    expect(response.conversion!.converted, "1977");
  });

  test("number converion", () async {
    final response = await client.search<Word>("４７７８万");
    expect(response.conversion, isNotNull);
    expect(response.conversion!.original, "４７７８万");
    expect(response.conversion!.converted, "47,780,000");
  });

  test("zen", () async {
    final response = await client.search<Word>("ありふれた世界");
    expect(response.zenEntries, ["ありふれた", "世界"]);
  });

  test("zen ignored parts", () async {
    final response = await client.search<Word>("三十kmと言った");
    expect(response.zenEntries, ["三十", "と", "言った"]);
  });

  test("zen duplicates", () async {
    final response = await client.search<Word>("灰は灰に");
    expect(response.zenEntries, ["灰", "は", "灰", "に"]);
  });
}
