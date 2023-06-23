import 'package:flutter/material.dart';
import 'package:jsdict/models/models.dart';
import 'package:jsdict/screens/word_details/word_details_screen.dart';
import 'package:ruby_text/ruby_text.dart';

class WordItem extends StatelessWidget {
  const WordItem({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WordDetailsScreen(word.id!)))
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        title: RubyText(
          word.word.toRubyData(),
          style: const TextStyle(fontSize: 18),
          rubyStyle: const TextStyle(fontSize: 10),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: word.definitions.asMap().entries.map((entry) {
            return Text("${entry.key + 1}. ${entry.value.meanings.join("; ")}");
          }).toList(),
        )
      ),
    );
  }
}