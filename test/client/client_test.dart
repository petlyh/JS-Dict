import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:test/test.dart";

void main() {
  final client = JishoClient();

  test(
    "has next page",
    () async => expect(
      (await client.search<Word>("物")).hasNextPage,
      isTrue,
    ),
  );

  test(
    "does not have next page",
    () async => expect(
      (await client.search<Word>("喜怒哀楽")).hasNextPage,
      isFalse,
    ),
  );

  test(
    "decoding HTML entities",
    () async => expect(
      (await client.kanjiDetails("張")).meanings,
      contains("counter for bows & stringed instruments"),
    ),
  );
}
