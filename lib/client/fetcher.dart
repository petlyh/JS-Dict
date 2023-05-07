import 'strings.dart';

import 'package:http/http.dart' as http;

class Fetcher {
  http.Client client = http.Client();

  Fetcher();
  Fetcher.client(this.client);

  Future<http.Response> search(final String query, final int page) async {
    var encodedQuery = Uri.encodeComponent(query);
    // var pagePart = page > 1 ? "?page=$page" : "";
    var pagePart = "";
    var url = Uri.parse("$searchUrl/$encodedQuery$pagePart");
    return await client.get(url);
  }

  Future<http.Response> kanjiDetails(final String kanji) async {
    var encodedKanji = Uri.encodeComponent(kanji);
    var url = Uri.parse("$searchUrl/$encodedKanji $kanjiHash");
    return await client.get(url);
  }

  Future<http.Response> wordDetails(final String word) async {
    var encodedWord = Uri.encodeQueryComponent(word);
    var url = Uri.parse("$wordUrl/$encodedWord");
    return await client.get(url);
  }
}