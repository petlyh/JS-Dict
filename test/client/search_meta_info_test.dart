import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

import "util.dart";

void main() {
  final client = JishoClient();

  test(
    "search correction",
    () async => expectEquals(
      (await client.search<Word>("atatakai")).correction,
      const Correction(
        effective: "あたたかい",
        original: '"atatakai"',
        noMatchesForOriginal: false,
      ),
    ),
  );

  test(
    "search correction no matches",
    () async => expectEquals(
      (await client.search<Word>("込めて")).correction,
      const Correction(
        effective: "込める",
        original: "込めて",
        noMatchesForOriginal: true,
      ),
    ),
  );

  test(
    "grammar info",
    () async => expectEquals(
      (await client.search<Word>("arifureta")).grammarInfo,
      const GrammarInfo(
        word: "ありふれた",
        possibleInflectionOf: "ありふれる",
        formInfos: ["Ta-form. It indicates the past tense of the verb."],
      ),
    ),
  );

  test(
    "year conversion",
    () async => expectEquals(
      (await client.search<Word>("昭和５２")).conversion,
      const Conversion(original: "昭和５２", converted: "1977"),
    ),
  );

  test(
    "number conversion",
    () async => expectEquals(
      (await client.search<Word>("４７７８万")).conversion,
      const Conversion(original: "４７７８万", converted: "47,780,000"),
    ),
  );

  test(
    "zen",
    () async => expectEquals(
      (await client.search<Word>("ありふれた世界")).zenEntries,
      const ["ありふれた", "世界"],
    ),
  );

  test(
    "zen ignored parts",
    () async => expectEquals(
      (await client.search<Word>("三十kmと言った")).zenEntries,
      const ["三十", "と", "言った"],
    ),
  );

  test(
    "zen duplicates",
    () async => expectEquals(
      (await client.search<Word>("灰は灰に")).zenEntries,
      const ["灰", "は", "灰", "に"],
    ),
  );
}
