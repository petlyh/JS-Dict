import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/furigana_ruby.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/copyright_text.dart";
import "package:jsdict/widgets/items/item_card.dart";
import "package:ruby_text/ruby_text.dart";

class SentenceItem extends StatelessWidget {
  const SentenceItem({required this.sentence});

  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      onTap: pushScreen(context, SentenceDetailsScreen(sentence: sentence)),
      onLongPress: () => showActionDialog(context, [
        ActionTile.url(url: sentence.url),
        ActionTile.text(name: "Japanese", text: sentence.japanese.text),
        ActionTile.text(name: "English", text: sentence.english),
      ]),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
        title: RubyText(
          sentence.japanese.rubyData,
          style: jpTextStyle,
          rubyAlign: CrossAxisAlignment.start,
          wrapAlign: TextAlign.start,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(sentence.english),
            if (sentence.copyright case final copyright?) ...[
              const SizedBox(height: 4),
              CopyrightText(copyright: copyright),
            ],
          ],
        ),
      ),
    );
  }
}
