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
}