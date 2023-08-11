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
    var response = await _client.get(Uri.parse(baseUrl + path));

    if (response.statusCode != HttpStatus.ok) {
      if (response.statusCode == HttpStatus.notFound) {
        throw NotFoundException(response.request!.url);
      }

      throw HttpException("Unsuccessful response status: ${response.statusCode}");
    }

    return parse(response.body);
  }

  String _searchPath(String query) => "/search/${Uri.encodeComponent(query)}";

  final Map<Type, String> _typeTags = {
    Kanji: "kanji",
    Word: "words",
    Sentence: "sentences",
    Name: "names"
  };

  Future<SearchResponse<T>> search<T>(String query, {int page = 1}) {
    final pagePart = page > 1 ? "?page=$page" : "";
    final path = _searchPath("$query #${_typeTags[T]}") + pagePart;
    return _getHtml(path).then((document) => Parser.search<T>(document));
  }

  Future<Kanji> kanjiDetails(String kanji) async {
    final path = _searchPath("$kanji #kanji");
    return _getHtml(path).then((document) => Parser.kanjiDetails(document));
  }

  Future<Word> wordDetails(String word) async {
    final path = "/word/${Uri.encodeComponent(word)}";
    return _getHtml(path).then((document) => Parser.wordDetails(document));
  }
}