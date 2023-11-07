import "package:flutter_test/flutter_test.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";

void main() {
  final client = JishoClient();

  test("kanji details", () async {
    final kanji = await client.kanjiDetails("夢");

    expect(kanji.kanji, "夢");
    expect(kanji.meanings, ["dream", "vision", "illusion"]);
    expect(kanji.kunReadings, ["ゆめ", "ゆめ.みる", "くら.い"]);
    expect(kanji.onReadings, ["ム", "ボウ"]);
    expect(kanji.type, isA<Jouyou>());
    expect((kanji.type as Jouyou).grade, 5);

    expect(kanji.strokeCount, 13);
    expect(kanji.jlptLevel, JLPTLevel.n3);
    expect(kanji.frequency, 943);
    expect(kanji.strokeDiagramUrl, isNotEmpty);

    expect(kanji.parts, ["冖", "夕", "艾", "買"]);
    expect(kanji.variants, ["梦", "夣"]);

    expect(kanji.onCompounds, hasLength(4));
    expect(kanji.kunCompounds, hasLength(5));
  });

  test("decoding HTML entities", () async {
    final kanji = await client.kanjiDetails("張");
    expect(kanji.meanings, contains("counter for bows & stringed instruments"));
  });

  test("word details", () async {
    final word = await client.wordDetails("見る");

    expect(word.word.getText(), "見る");
    expect(word.word.getReading(), "みる");
    expect(word.commonWord, true);
    expect(word.wanikaniLevels, [22, 4]);
    expect(word.jlptLevel, JLPTLevel.n5);
    expect(word.audioUrl, isNotEmpty);
    expect(word.notes, isEmpty);
    expect(word.inflectionId, "v1");

    expect(word.kanji, hasLength(1));
    expect(word.kanji.first.kanji, "見");

    expect(word.collocations, hasLength(16));
    expect(word.collocations.first.word, "見るに堪えない");
    expect(word.collocations.first.meaning, "so miserable that it is painful to look at");

    expect(word.definitions, hasLength(6));
    expect(word.definitions.first.meanings, contains("to observe"));
    expect(word.definitions.first.types, contains("Transitive verb"));

    expect(word.otherForms, hasLength(2));
    expect(word.otherForms.first.form, "観る");
  });

  test("name", () async {
    final response = await client.search<Name>("yoko shimomura");
    expect(response.results, hasLength(1));

    final name = response.results.first;
    expect(name.reading, "しもむらようこ 【下村陽子】");
    expect(name.name, "Shimomura Youko (1967.10.19-)");
    expect(name.type, "Full name");
  });

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
    expect(response.grammarInfo!.formInfos, ["Ta-form. It indicates the past tense of the verb."]);
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

  test("notes", () async {
    final response = await client.wordDetails("何方");
    final note = response.notes.first;
    expect(note.form, "何方");
    expect(note.note, "Rarely-used kanji form");
  });
}