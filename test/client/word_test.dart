import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test("word details", () async {
    final word = await client.wordDetails("見る");

    expect(word.word.text, "見る");
    expect(word.word.reading, "みる");
    expect(word.commonWord, true);
    expect(word.wanikaniLevels, [22, 4]);
    expect(word.jlptLevel, JLPTLevel.n5);
    expect(word.audioUrl, isNotEmpty);
    expect(word.notes, isEmpty);
    expect(word.inflectionId, "v1");

    expect(word.details!.kanji, hasLength(1));
    expect(word.details!.kanji.first.kanji, "見");

    expect(word.collocations, hasLength(16));
    expect(word.collocations.first.word, "見るに堪えない");
    expect(word.collocations.first.meaning,
        "so miserable that it is painful to look at");

    expect(word.definitions, hasLength(6));
    expect(word.definitions.first.meanings, contains("to observe"));
    expect(word.definitions.first.types, contains("Transitive verb"));

    expect(word.otherForms, hasLength(2));
    expect(word.otherForms.first.form, "観る");
  });

  test("word with only wikipedia definition", () async {
    final word = await client.wordDetails("518699edd5dda7b2c605d29b");
    expect(word.definitions, hasLength(1));

    final definition = word.definitions[0];
    expect(definition.types, equals(["Word"]));
    expect(definition.meanings, equals(["Love Actually"]));
  });

  test("word example sentence", () async {
    final word = await client.wordDetails("助ける");
    final sentence = word.definitions.first.exampleSentence;

    expect(sentence, isNotNull);
    expect(sentence?.japanese.text, equals("彼は池で溺れそうになっている子どもを助けた。"));
    expect(
        sentence?.english, equals("He saved a child from drowning in a pond."));
  });

  test("notes", () async {
    final response = await client.wordDetails("何方");
    final note = response.notes.first;
    expect(note.form, "何方");
    expect(note.note, "Rarely-used kanji form");
  });
}
