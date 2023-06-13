library jisho_dart;

import 'dart:io';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:jsdict/models.dart';

import 'parser.dart';

class NotFoundException implements HttpException {
  @override
  final Uri? uri;
  @override
  String get message => "Not Found: ${Uri.decodeFull(uri.toString())}";

  @override
  String toString() => message;

  NotFoundException(this.uri);
}

class JishoClient {
  static const baseUrl = "https://jisho.org";

  final Parser _parser = Parser();
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

  Future<SearchResponse> search(final String query, {final int page = 1}) {
    final pagePart = page > 1 ? "?page=$page" : "";
    final path = _searchPath(query) + pagePart;
    return _getHtml(path).then((document) => _parser.search(document));
  }

  Future<SearchResponse> searchTag(final String query, final JishoTag type, {final int page = 1}) {
    return search("$query #${type.getTag()}");
  }

  Future<Kanji> kanjiDetails(final String kanji) async {
    final path = _searchPath("$kanji #kanji");
    return _getHtml(path).then((document) => _parser.kanjiDetails(document));
  }

  Future<Word> wordDetails(final String word) async {
    final path = "/word/${Uri.encodeComponent(word)}";
    return _getHtml(path).then((document) => _parser.wordDetails(document));
  }

  Future<Sentence> sentenceDetails(final String sentenceId) async {
    return _getHtml("/sentences/$sentenceId").then((document) => _parser.sentenceDetails(document));
  }
}