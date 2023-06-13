import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/widgets/items/kanji.dart';
import 'package:jsdict/widgets/items/sentence.dart';
import 'package:jsdict/widgets/items/name.dart';
import 'package:jsdict/widgets/items/word.dart';

class ResultListWidget<T> extends StatelessWidget {
  const ResultListWidget({super.key, required this.searchResponse});

  final SearchResponse searchResponse;

  Widget Function(BuildContext, int) getItemBuilder() {
    switch (T) {
      case Word:
        return (_, index) => WordItem(word: searchResponse.results[index]);
      case Kanji:
        return (_, index) => KanjiItem(kanji: searchResponse.results[index]);
      case Sentence:
        return (_, index) => SentenceItem(sentence: searchResponse.results[index]);
      case Name:
        return (_, index) => NameItem(name: searchResponse.results[index]);
      default:
        throw Exception("Unknown type");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: searchResponse.results.length,
      itemBuilder: getItemBuilder(),
    );
  }
}