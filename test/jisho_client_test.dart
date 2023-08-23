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
}