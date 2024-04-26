import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("name", () async {
    final response = await client.search<Name>("yoko shimomura");
    expect(response.results, hasLength(1));

    final name = response.results.first;
    expect(name.japanese, "下村陽子");
    expect(name.reading, "しもむらようこ");
    expect(name.english, "Yoko Shimomura");
    expect(name.type, "Full name");
  });

  test("name (kanjiless, no reading)", () async {
    final response = await client.search<Name>("ashita");
    expect(response.results, isNotEmpty);

    final name = response.results.first;
    expect(name.japanese, "あした");
    expect(name.reading, isNull);
    expect(name.english, "Ashita");
    expect(name.type, "Female given name");
  });
}
