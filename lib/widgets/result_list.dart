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
    return switch (T) {
      Word => (_, index) => WordItem(word: searchResponse.results[index]),
      Kanji => (_, index) => KanjiItem(kanji: searchResponse.results[index]),
      Sentence => (_, index) => SentenceItem(sentence: searchResponse.results[index]),
      Name => (_, index) => NameItem(name: searchResponse.results[index]),
      _ => throw Exception("Unknown type"),
    };
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