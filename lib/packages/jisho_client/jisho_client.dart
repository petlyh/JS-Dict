library jisho_dart;

import "dart:io";

import "package:html/dom.dart";
import "package:http/http.dart" as http;
import "package:html/parser.dart";
import "package:jsdict/models/models.dart";

import "exceptions.dart";
import "parser.dart";

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
          "Unsuccessful response status: ${response.statusCode}");
    }

    return parse(response.body);
  }

  String _searchPath<T extends SearchType>(String query, {int page = -1}) {
    String path = "/search/${Uri.encodeComponent(_lowercaseQuery(query))}";

    // don't add type tag for page 1 of words
    if (T == Word && page < 2) {
      return path;
    }

    path += Uri.encodeComponent(" #${_typeTags[T]}");
    return page > 1 ? "$path?page=$page" : path;
  }

  final Map<Type, String> _typeTags = {
    Kanji: "kanji",
    Word: "words",
    Sentence: "sentences",
    Name: "names"
  };

  // returns query with everything lowercased except for tags
  String _lowercaseQuery(String query) => query.replaceAllMapped(
      RegExp(r"(?<=^|\s)\w+"), (match) => match.group(0)!.toLowerCase());

  Future<SearchResponse<T>> search<T extends SearchType>(String query,
      {int page = 1}) {
    return _getHtml(_searchPath<T>(query, page: page))
        .then((document) => Parser.search<T>(document));
  }

  Future<Kanji> kanjiDetails(String kanji) {
    return _getHtml(_searchPath<Kanji>(kanji))
        .then((document) => Parser.kanjiDetails(document));
  }

  Future<Word> wordDetails(String word) {
    final path = "/word/${Uri.encodeComponent(word)}";
    return _getHtml(path).then((document) => Parser.wordDetails(document));
  }

  Future<Sentence> sentenceDetails(String sentenceId) {
    final path = "/sentences/$sentenceId";
    return _getHtml(path).then((document) => Parser.sentenceDetails(document));
  }
}
