import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:ruby_text/ruby_text.dart';

class WordItem extends StatelessWidget {
  const WordItem({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {},
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        title: RubyText(word.word.toRubyData()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: word.definitions.asMap().entries.map((entry) {
            return Text("${entry.key + 1}. ${entry.value.meanings.join(", ")}");
          }).toList(),
        )
      ),
    );
  }
}