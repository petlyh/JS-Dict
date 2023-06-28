import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/widgets/copyright_text.dart";
import "package:ruby_text/ruby_text.dart";

import "item_card.dart";

class SentenceItem extends StatelessWidget {
  const SentenceItem({super.key, required this.sentence});

  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SentenceDetailsScreen(sentence.id)))
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        title: RubyText(sentence.japanese.toRubyData()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(sentence.english),
            if (sentence.copyright != null)
              CopyrightText(sentence.copyright!),
          ],
        )
      )
    );
  }
}