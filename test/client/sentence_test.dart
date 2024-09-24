import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("sentence search", () async {
    final response = await client.search<Sentence>("わたしは国の富が");
    expect(response.results, hasLength(1));

    final sentence = response.results.first;

    expect(sentence.japanese.text, equals("わたしは国の富が公平に分配される社会を夢見ている。"));
    expect(
      sentence.english,
      equals("I dream of a society whose wealth is distributed fairly."),
    );

    expect(sentence.copyright, isNotNull);
    expect(sentence.copyright?.name, equals("Tatoeba"));
    expect(
      sentence.copyright?.url,
      equals("http://tatoeba.org/eng/sentences/show/76360"),
    );
  });

  test("sentence details", () async {
    final sentence = await client.sentenceDetails("65dbf69a12a53778d6000087");

    expect(sentence.japanese.text, equals("ここ数年は芸術鑑賞が趣味で、暇を見つけては美術館に足を運んでいる。"));

    expect(
      sentence.english,
      equals(
        "For the past few years, I have pursued my appreciation of art by visiting art museums whenever I find spare time.",
      ),
    );

    expect(sentence.copyright, isNotNull);
    expect(sentence.copyright?.name, equals("Jreibun"));
    expect(
      sentence.copyright?.url,
      equals(
        "http://www.tufs.ac.jp/ts/personal/SUZUKI_Tomomi/jreibun/index-jreibun.html",
      ),
    );

    expect(sentence.kanji, isNotNull);
    expect(sentence.kanji, hasLength(14));
  });
}
