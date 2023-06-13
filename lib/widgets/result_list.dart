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
        return (_, index) => WordItem(word: searchResponse.wordResults[index]);
      case Kanji:
        return (_, index) => KanjiItem(kanji: searchResponse.kanjiResults[index]);
      case Sentence:
        return (_, index) => SentenceItem(sentence: searchResponse.sentenceResults[index]);
      case Name:
        return (_, index) => NameItem(name: searchResponse.nameResults[index]);
      default:
        throw Exception("Unknown type");
    }
  }

  int getItemCount() {
    switch (T) {
      case Word:
        return searchResponse.wordResults.length;
      case Kanji:
        return searchResponse.kanjiResults.length;
      case Sentence:
        return searchResponse.sentenceResults.length;
      case Name:
        return searchResponse.nameResults.length;
      default:
        throw Exception("Unknown type");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: getItemCount(),
      itemBuilder: getItemBuilder(),
    );
  }
}