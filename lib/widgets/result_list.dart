import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/widgets/items/kanji.dart';
import 'package:jsdict/widgets/items/sentence.dart';
import 'package:jsdict/widgets/items/name.dart';
import 'package:jsdict/widgets/items/word.dart';

class ResultListWidget extends StatelessWidget {
  const ResultListWidget({super.key, required this.searchResponse, required this.type});

  final SearchResponse searchResponse;
  final JishoTag type;

  Widget Function(BuildContext, int) getItemBuilder() {
    switch (type.runtimeType) {
      case Word:
        return (context, index) => WordItem(word: searchResponse.wordResults[index]);
      case Kanji:
        return (context, index) => KanjiItem(kanji: searchResponse.kanjiResults[index]);
      case Sentence:
        return (context, index) => SentenceItem(sentence: searchResponse.sentenceResults[index]);
      case Name:
        return (context, index) => NameItem(name: searchResponse.nameResults[index]);
      default:
        throw Exception("Unknown type");
    }
  }

  int getItemCount() {
    switch (type.runtimeType) {
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