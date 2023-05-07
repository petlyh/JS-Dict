library jisho_dart;

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

import 'fetcher.dart';
import 'parser.dart';
import '../models.dart';

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

    if (response.statusCode != 200) {
      throw Exception("HTTP response status not 200");
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

  Future<Kanji?> kanjiDetails(final String kanji) async {
    var futureResponse = fetcher.kanjiDetails(kanji);
    return _handleResponse(futureResponse).then((document) => parser.kanjiDetails(document));
  }

  Future<Word> wordDetails(final String word) async {
    var futureResponse = fetcher.wordDetails(word);
    return _handleResponse(futureResponse).then((document) => parser.wordDetails(document));
  }
}