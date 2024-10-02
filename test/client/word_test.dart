import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test(
    "word details",
    () async {
      final actual = await client.wordDetails("歌");

      expect(
        actual,
        equals(
          const Word(
            word: [FuriganaPart("歌", "うた")],
            definitions: [
              Definition(
                meanings: ["song", "singing"],
                types: ["Noun"],
                tags: ["esp. 唄 for folk songs and shamisen songs"],
                exampleSentence: Sentence(
                  japanese: [
                    FuriganaPart("この"),
                    FuriganaPart("歌", "うた"),
                    FuriganaPart("を"),
                    FuriganaPart("聞く", "き"),
                    FuriganaPart("と"),
                    FuriganaPart("私", "わたし"),
                    FuriganaPart("は"),
                    FuriganaPart("いつも"),
                    FuriganaPart("、"),
                    FuriganaPart("学生時代", "がくせいじだい"),
                    FuriganaPart("を"),
                    FuriganaPart("思い出す", "おもいだ"),
                    FuriganaPart("。"),
                  ],
                  english:
                      "Whenever I hear this song, I am reminded of my school days.",
                ),
              ),
              Definition(
                meanings: ["classical Japanese poem (esp. tanka)"],
                types: ["Noun"],
                seeAlso: ["短歌"],
              ),
              Definition(meanings: ["modern poetry"], types: ["Noun"]),
            ],
            otherForms: [
              OtherForm(form: "唄", reading: "うた"),
              OtherForm(form: "詩", reading: "うた"),
            ],
            isCommon: true,
            jlptLevel: JLPTLevel.n5,
            wanikaniLevels: [10, 60],
            hasWikipedia: true,
            details: WordDetails(
              kanji: [
                Kanji(
                  kanji: "歌",
                  strokeCount: 14,
                  meanings: ["song", "sing"],
                  kunReadings: ["うた", "うた.う"],
                  onReadings: ["カ"],
                  jlptLevel: JLPTLevel.n4,
                  type: Jouyou(2),
                ),
              ],
              wikipedia: WikipediaInfo(
                title: "Song",
                textAbstract:
                    "In music, a song is a composition for voice or voices, performed by singing. A song may be accompanied by musical instruments, or it may be unaccompanied, as in the case of a cappella songs. The lyrics (words) of songs are typically of a poetic, rhyming nature, though they may be religious verses or free prose. A song may be for a solo singer, a duet, trio, or larger ensemble involving more voices. Songs with more than one voice to a part are considered choral works.",
                wikipediaEnglish: WikipediaPage(
                  title: "Song",
                  url: "http://en.wikipedia.org/wiki/Song?oldid=493361844",
                ),
                wikipediaJapanese: WikipediaPage(
                  title: "歌",
                  url: "http://ja.wikipedia.org/wiki/歌?oldid=42711902",
                ),
                dbpedia: WikipediaPage(
                  title: "Song",
                  url: "http://dbpedia.org/resource/Song",
                ),
              ),
            ),
          ).copyWith(audioUrl: actual.audioUrl),
        ),
      );
    },
  );

  test(
    "word with only wikipedia definition",
    () async => expect(
      (await client.wordDetails("518699edd5dda7b2c605d29b")).definitions,
      equals(const [
        Definition(meanings: ["Love Actually"], types: ["Word"]),
      ]),
    ),
  );

  test(
    "word example sentence",
    () async => expect(
      (await client.wordDetails("助ける"))
          .definitions
          .firstOrNull
          ?.exampleSentence,
      equals(
        const Sentence(
          japanese: [
            FuriganaPart("彼", "かれ"),
            FuriganaPart("は"),
            FuriganaPart("池", "いけ"),
            FuriganaPart("で"),
            FuriganaPart("溺れ", "おぼ"),
            FuriganaPart("そうになっている"),
            FuriganaPart("子ども", "こ"),
            FuriganaPart("を"),
            FuriganaPart("助けた", "たす"),
            FuriganaPart("。"),
          ],
          english: "He saved a child from drowning in a pond.",
        ),
      ),
    ),
  );

  test(
    "notes",
    () async => expect(
      (await client.wordDetails("何方")).notes,
      equals(const [Note(form: "何方", note: "Rarely-used kanji form")]),
    ),
  );
}
