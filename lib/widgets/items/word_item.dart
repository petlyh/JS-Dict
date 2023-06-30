import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:ruby_text/ruby_text.dart";

import "item_card.dart";

class WordItem extends StatelessWidget {
  const WordItem({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;

    return ItemCard(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WordDetailsScreen(word.id!)))
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        title: RubyText(
          word.word.toRubyData(),
          style: const TextStyle(fontSize: 18),
          rubyStyle: const TextStyle(fontSize: 10),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: word.definitions
              .map((e) => e.meanings.join("; "))
              .toSet().toList().asMap().entries
              .map((entry) => RichText(
                text: TextSpan(children: [
                  TextSpan(text: "${entry.key + 1}. ", style: textStyle.copyWith(fontWeight: FontWeight.w300)),
                  TextSpan(text: entry.value, style: textStyle),
                ])
              ))
              .toList(),
        )
      ),
    );
  }
}