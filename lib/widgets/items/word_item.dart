import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:ruby_text/ruby_text.dart";

import "item_card.dart";

class WordItem extends StatelessWidget {
  const WordItem({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;

    return ItemCard(
      onTap: pushScreen(context, WordDetailsScreen(word)),
      onLongPress: () => showActionDialog(context, [
        ActionTile.url(word.url),
        ActionTile.text("Word", word.word.getText()),
        if (word.word.hasFurigana)
          ActionTile.text("Reading", word.word.getReading()),
      ]),
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
          title: RubyText(
            word.word.rubyData,
            style: const TextStyle(fontSize: 18).jp(),
            rubyStyle: const TextStyle(fontSize: 10).jp(),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: word.definitions
                .map((e) => e.meanings.join("; "))
                .toList()
                .deduplicateCaseInsensitive()
                .asMap()
                .entries
                .map((entry) => RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "${entry.key + 1}. ",
                          style:
                              textStyle.copyWith(fontWeight: FontWeight.w300)),
                      TextSpan(text: entry.value, style: textStyle),
                    ])))
                .toList(),
          )),
    );
  }
}
