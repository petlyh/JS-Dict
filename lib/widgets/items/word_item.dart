import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/deduplicate.dart";
import "package:jsdict/packages/furigana_ruby.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/items/item_card.dart";
import "package:ruby_text/ruby_text.dart";

class WordItem extends StatelessWidget {
  const WordItem({required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;

    return ItemCard(
      onTap: pushScreen(context, WordDetailsScreen.preload(word: word)),
      onLongPress: () => showActionDialog(context, [
        ActionTile.url(word.url),
        ActionTile.text(word.word.text, name: "Word"),
        if (word.word.hasFurigana)
          ActionTile.text(word.word.reading, name: "Reading"),
      ]),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
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
              .indexed
              .map(
                (entry) => RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${entry.$1 + 1}. ",
                        style: textStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                      TextSpan(text: entry.$2, style: textStyle),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
