import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test(
    "sentence search",
    () async => expect(
      (await client.search<Sentence>("わたしは国の富が")).results.firstOrNull,
      equals(
        const Sentence(
          japanese: [
            FuriganaPart("わたし"),
            FuriganaPart("は"),
            FuriganaPart("国", "くに"),
            FuriganaPart("の"),
            FuriganaPart("富", "とみ"),
            FuriganaPart("が"),
            FuriganaPart("公平に", "こうへい"),
            FuriganaPart("分配", "ぶんぱい"),
            FuriganaPart("される"),
            FuriganaPart("社会", "しゃかい"),
            FuriganaPart("を"),
            FuriganaPart("夢見ている", "ゆめみ"),
            FuriganaPart("。"),
          ],
          english: "I dream of a society whose wealth is distributed fairly.",
          id: "518663bbd5dda7e981000959",
          copyright: SentenceCopyright(
            name: "Tatoeba",
            url: "http://tatoeba.org/eng/sentences/show/76360",
          ),
        ),
      ),
    ),
  );

  test(
    "sentence details",
    () async => expect(
      await client.sentenceDetails("5186635bd5dda7e981000185"),
      equals(
        const Sentence(
          japanese: [
            FuriganaPart("いびつな"),
            FuriganaPart("野菜", "やさい"),
            FuriganaPart("は"),
            FuriganaPart("お"),
            FuriganaPart("嫌い", "きら"),
            FuriganaPart("ですか"),
            FuriganaPart("？"),
          ],
          english: "Do you hate misshapen vegetables?",
          copyright: SentenceCopyright(
            name: "Tatoeba",
            url: "http://tatoeba.org/eng/sentences/show/74344",
          ),
          kanji: [
            Kanji(
              kanji: "嫌",
              strokeCount: 13,
              meanings: ["dislike", "detest", "hate"],
              kunReadings: ["きら.う", "きら.い", "いや"],
              onReadings: ["ケン", "ゲン"],
              type: Jouyou.juniorHigh(),
              jlptLevel: JLPTLevel.n1,
            ),
            Kanji(
              kanji: "菜",
              strokeCount: 11,
              meanings: ["vegetable", "side dish", "greens"],
              kunReadings: ["な"],
              onReadings: ["サイ"],
              type: Jouyou(4),
              jlptLevel: JLPTLevel.n2,
            ),
            Kanji(
              kanji: "野",
              strokeCount: 11,
              meanings: ["plains", "field", "rustic", "civilian life"],
              kunReadings: ["の", "の-"],
              onReadings: ["ヤ", "ショ"],
              type: Jouyou(2),
              jlptLevel: JLPTLevel.n4,
            ),
          ],
        ),
      ),
    ),
  );
}
