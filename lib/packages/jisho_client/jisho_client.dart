import "dart:io";

import "package:html/dom.dart";
import "package:html/parser.dart";
import "package:http/http.dart" as http;
import "package:jsdict/models/models.dart";

import "package:jsdict/packages/jisho_client/exceptions.dart";
import "package:jsdict/packages/jisho_client/parser/parser.dart";

export "exceptions.dart";

class JishoClient {
  static const baseUrl = "https://jisho.org";

  final http.Client _client;

  JishoClient() : _client = http.Client();

  JishoClient.client(http.Client client) : _client = client;

  Future<Document> _getHtml(String path) async {
    final response = await _client.get(Uri.parse(baseUrl + path));

    if (response.statusCode != HttpStatus.ok) {
      if (response.statusCode == HttpStatus.notFound) {
        throw NotFoundException(response.request!.url);
      }

      throw HttpException(
        "Unsuccessful response status: ${response.statusCode}",
      );
    }

    return parse(response.body);
  }

  String _searchPath<T extends ResultType>(String query, {int page = -1}) {
    final path = "/search/${Uri.encodeComponent(_lowercaseQuery(query))}";

    // don't add type tag for page 1 of words
    if (T == Word && page < 2) {
      return path;
    }

    final taggedPath = path + Uri.encodeComponent(" #${_typeTags[T]}");
    return page > 1 ? "$taggedPath?page=$page" : taggedPath;
  }

  final Map<Type, String> _typeTags = {
    Kanji: "kanji",
    Word: "words",
    Sentence: "sentences",
    Name: "names",
  };

  // returns query with everything lowercased except for tags
  String _lowercaseQuery(String query) => query.replaceAllMapped(
        RegExp(r"(?<=^|\s)\w+"),
        (match) => match.group(0)!.toLowerCase(),
      );

  Future<SearchResponse<T>> search<T extends ResultType>(
    String query, {
    int page = 1,
  }) =>
      _getHtml(_searchPath<T>(query, page: page)).then(parseSearch<T>);

  Future<Kanji> kanjiDetails(String kanji) =>
      _getHtml(_searchPath<Kanji>(kanji)).then(parseKanjiDetails);

  Future<Word> wordDetails(String word) =>
      _getHtml("/word/${Uri.encodeComponent(word)}").then(parseWordDetails);

  Future<Sentence> sentenceDetails(String sentenceId) =>
      _getHtml("/sentences/$sentenceId").then(parseSentenceDetails);
}
