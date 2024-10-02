import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test(
    "search correction",
    () async => expect(
      (await client.search<Word>("atatakai")).correction,
      equals(
        const Correction(
          effective: "あたたかい",
          original: '"atatakai"',
          noMatchesForOriginal: false,
        ),
      ),
    ),
  );

  test(
    "search correction no matches",
    () async => expect(
      (await client.search<Word>("込めて")).correction,
      equals(
        const Correction(
          effective: "込める",
          original: "込めて",
          noMatchesForOriginal: true,
        ),
      ),
    ),
  );

  test(
    "grammar info",
    () async => expect(
      (await client.search<Word>("arifureta")).grammarInfo,
      equals(
        const GrammarInfo(
          word: "ありふれた",
          possibleInflectionOf: "ありふれる",
          formInfos: ["Ta-form. It indicates the past tense of the verb."],
        ),
      ),
    ),
  );

  test(
    "year conversion",
    () async => expect(
      (await client.search<Word>("昭和５２")).conversion,
      equals(const Conversion(original: "昭和５２", converted: "1977")),
    ),
  );

  test(
    "number conversion",
    () async => expect(
      (await client.search<Word>("４７７８万")).conversion,
      equals(const Conversion(original: "４７７８万", converted: "47,780,000")),
    ),
  );

  test(
    "zen",
    () async => expect(
      (await client.search<Word>("ありふれた世界")).zenEntries,
      equals(const ["ありふれた", "世界"]),
    ),
  );

  test(
    "zen ignored parts",
    () async => expect(
      (await client.search<Word>("三十kmと言った")).zenEntries,
      equals(const ["三十", "と", "言った"]),
    ),
  );

  test(
    "zen duplicates",
    () async => expect(
      (await client.search<Word>("灰は灰に")).zenEntries,
      equals(const ["灰", "は", "灰", "に"]),
    ),
  );
}
