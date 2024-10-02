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
    expect((kanji.type! as Jouyou).grade, 5);

    expect(kanji.strokeCount, 13);
    expect(kanji.jlptLevel, JLPTLevel.n3);

    final details = kanji.details!;

    expect(details.frequency, 943);

    expect(details.parts, ["冖", "夕", "艾", "買"]);
    expect(details.variants, ["梦", "夣"]);

    expect(details.onCompounds, hasLength(4));
    expect(details.kunCompounds, hasLength(5));
  });

  test(
    "kanji details2",
    () async => expect(
      await client.kanjiDetails("夢"),
      equals(
        const Kanji(
          kanji: "夢",
          strokeCount: 13,
          meanings: ["dream", "vision", "illusion"],
          kunReadings: ["ゆめ", "ゆめ.みる", "くら.い"],
          onReadings: ["ム", "ボウ"],
          type: Jouyou(5),
          jlptLevel: JLPTLevel.n3,
          details: KanjiDetails(
            parts: ["冖", "夕", "艾", "買"],
            variants: ["梦", "夣"],
            frequency: 943,
            radical: Radical(character: "夕", meanings: ["evening", "sunset"]),
            onCompounds: [
              Compound(
                compound: "夢中",
                reading: "ムチュウ",
                meanings: [
                  "absorbed in",
                  "immersed in",
                  "crazy about",
                  "obsessed with",
                  "devoted to",
                  "forgetting oneself",
                  "daze",
                  "trance",
                  "ecstasy",
                  "delirium",
                  "within a dream",
                  "while dreaming",
                ],
              ),
              Compound(
                compound: "夢想",
                reading: "ムソウ",
                meanings: ["dream", "vision", "reverie"],
              ),
              Compound(
                compound: "同床異夢",
                reading: "ドウショウイム",
                meanings: ["cohabiting but living in different worlds"],
              ),
              Compound(
                compound: "怪夢",
                reading: "カイム",
                meanings: ["strange dream"],
              ),
            ],
            kunCompounds: [
              Compound(compound: "夢", reading: "ゆめ", meanings: ["dream"]),
              Compound(
                compound: "夢にも",
                reading: "ゆめにも",
                meanings: ["(not) in the slightest", "(not) at all"],
              ),
              Compound(
                compound: "初夢",
                reading: "はつゆめ",
                meanings: [
                  "first dream of the New year (believed to foretell one's luck)",
                  "dream on the night of setsubun",
                ],
              ),
              Compound(
                compound: "逆夢",
                reading: "さかゆめ",
                meanings: ["a dream which is contradicted by reality"],
              ),
              Compound(
                compound: "夢見る",
                reading: "ゆめみる",
                meanings: ["to dream (of)"],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
