import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("sentence search", () async {
    final response = await client.search<Sentence>("夢見る");
    expect(response.results, hasLength(11));

    final sentence = response.results.first;

    expect(sentence.japanese.text, equals("わたしは国の富が公平に分配される社会を夢見ている。"));
    expect(sentence.english,
        equals("I dream of a society whose wealth is distributed fairly."));

    expect(sentence.copyright, isNotNull);
    expect(sentence.copyright?.name, equals("Tatoeba"));
    expect(sentence.copyright?.url,
        equals("http://tatoeba.org/eng/sentences/show/76360"));
  });

  test("sentence details", () async {
    final sentence = await client.sentenceDetails("63fd1c0a12a537194e00007a");

    expect(sentence.japanese.text,
        equals("体に良いのは知っているが、ウナギは生理的に苦手だ。気持ちが悪くて、見るのも嫌だ。"));

    expect(
        sentence.english,
        equals(
            "I know they are good to eat, but I instinctively dislike eels. They are gross and I don’t even like to look at them."));

    expect(sentence.copyright, isNotNull);
    expect(sentence.copyright?.name, equals("Jreibun"));
    expect(
        sentence.copyright?.url,
        equals(
            "http://www.tufs.ac.jp/ts/personal/SUZUKI_Tomomi/jreibun/index-jreibun.html"));

    expect(sentence.kanji, isNotNull);
    expect(sentence.kanji, hasLength(13));
  });
}
