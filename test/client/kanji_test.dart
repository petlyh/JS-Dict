import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

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

    final details = kanji.details!;

    expect(details.frequency, 943);

    expect(details.parts, ["冖", "夕", "艾", "買"]);
    expect(details.variants, ["梦", "夣"]);

    expect(details.onCompounds, hasLength(4));
    expect(details.kunCompounds, hasLength(5));
  });
}
