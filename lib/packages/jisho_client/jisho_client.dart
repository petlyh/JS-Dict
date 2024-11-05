import "dart:io";

import "package:fpdart/fpdart.dart";
import "package:html/dom.dart";
import "package:html/parser.dart" as htmlparser;
import "package:http/http.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/jisho_client/failures.dart";

import "package:jsdict/packages/jisho_client/parser/parser.dart";

const _baseUrl = "https://jisho.org";

class JishoClient {
  JishoClient({Client? client}) : _client = client ?? Client();

  final Client _client;

  Future<SearchResponse<T>> search<T extends ResultType>(
    String query, {
    int page = 1,
  }) async =>
      await _search<T>(query, page: page).getOrElse(_throw).run(_client);

  Future<Word> wordDetails(String word) async =>
      await _wordDetails(word).getOrElse(_throw).run(_client);

  Future<Kanji> kanjiDetails(String kanji) async =>
      await _kanjiDetails(kanji).getOrElse(_throw).run(_client);

  Future<Sentence> sentenceDetails(String id) async =>
      await _sentenceDetails(id).getOrElse(_throw).run(_client);

  Never _throw(Object object) => throw object;
}

ReaderTaskEither<Client, Failure, SearchResponse<T>> _search<
        T extends ResultType>(
  String query, {
  int page = 1,
}) =>
    _fetchDocument(_createSearchPath<T>(query, page: page)).map(parseSearch);

ReaderTaskEither<Client, Failure, Word> _wordDetails(String word) =>
    _fetchDocument("/word/${Uri.encodeComponent(word)}").flatMapTaskEither(
      (document) => parseWordDetails(document)
          .toTaskOption()
          .toTaskEither(() => ExtractionFailure("word")),
    );

ReaderTaskEither<Client, Failure, Kanji> _kanjiDetails(String kanji) =>
    _fetchDocument(_createSearchPath<Kanji>(kanji)).flatMapTaskEither(
      (document) => parseKanjiDetails(document)
          .toTaskOption()
          .toTaskEither(() => ExtractionFailure("kanji")),
    );

ReaderTaskEither<Client, Failure, Sentence> _sentenceDetails(String id) =>
    _fetchDocument("/sentences/$id").flatMapTaskEither(
      (document) => parseSentenceDetails(document)
          .toTaskOption()
          .toTaskEither(() => ExtractionFailure("sentence")),
    );

ReaderTaskEither<Client, Failure, Document> _fetchDocument(String path) =>
    _requestPage(path).mapLeft<Failure>((f) => f).flatMapTaskEither(
          (response) => _parseResponse(response).toTaskEither(),
        );

ReaderTaskEither<Client, HttpRequestFailure, Response> _requestPage(
  String path,
) =>
    ReaderTaskEither.tryCatch(
      (client) => client.get(Uri.parse(_baseUrl + path)),
      HttpRequestFailure.new,
    );

Either<Failure, Document> _parseResponse(Response response) =>
    Either.fromPredicate(
      response,
      (r) => r.statusCode < 400,
      (r) => switch (r.statusCode) {
        HttpStatus.notFound => NotFoundFailure(),
        _ => HttpReponseFailure(r),
      },
    ).map((r) => r.body).map(htmlparser.parse);

String _createSearchPath<T extends ResultType>(String query, {int page = 1}) {
  final path = "/search/${Uri.encodeComponent(_lowerQueryCase(query))}";

  // don't add type tag for page 1 of words
  if (T == Word && page < 2) {
    return path;
  }

  final typeTag = switch (T) {
    const (Kanji) => "kanji",
    const (Word) => "word",
    const (Sentence) => "sentences",
    const (Name) => "names",
    _ => throw ArgumentError(),
  };

  final taggedPath = path + Uri.encodeComponent(" #$typeTag");
  return page > 1 ? "$taggedPath?page=$page" : taggedPath;
}

// returns query with everything lowercased except for tags
String _lowerQueryCase(String query) => query.replaceAllMapped(
      RegExp(r"(?<=^|\s)\w+"),
      (match) => match
          .groupOption(0)
          .map((group) => group.toLowerCase())
          .getOrElse(() => ""),
    );

extension _MatchOption on Match {
  Option<String> groupOption(int group) =>
      Option.fromNullable(this.group(group));
}
