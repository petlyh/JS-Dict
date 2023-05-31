library jisho_dart;

import 'dart:io';

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:jsdict/models.dart';

import 'fetcher.dart';
import 'parser.dart';

class JishoClient {
  Fetcher fetcher = Fetcher();
  Parser parser = Parser();

  JishoClient();

  JishoClient.client(http.Client client) {
    fetcher = Fetcher.client(client);
    parser = Parser();
  }

  Future<Document> _handleResponse(Future<http.Response> futureResponse) async {
    var response = await futureResponse;

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException("Unsuccessful response status: ${response.statusCode}");
    }

    return parse(response.body);
  }

  Future<SearchResponse> search(final String query, {final int page = 1}) {
    var futureResponse = fetcher.search(query, page);
    return _handleResponse(futureResponse).then((document) => parser.search(document));
  }

  Future<SearchResponse> searchTag(final String query, final JishoTag type, {final int page = 1}) {
    return search("$query #${type.getTag()}");
  }

  Future<Kanji> kanjiDetails(final String kanji) async {
    var futureResponse = fetcher.kanjiDetails(kanji);
    return _handleResponse(futureResponse).then((document) => parser.kanjiDetails(document));
  }

  Future<Word> wordDetails(final String word) async {
    var futureResponse = fetcher.wordDetails(word);
    return _handleResponse(futureResponse).then((document) => parser.wordDetails(document));
  }

  Future<Sentence> sentenceDetails(final String sentenceId) async {
    var futureResponse = fetcher.sentenceDetails(sentenceId);
    return _handleResponse(futureResponse).then((document) => parser.sentenceDetails(document));
  }
}