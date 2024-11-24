import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/string_util.dart";
import "package:jsdict/screens/kanji_details/kanji_details_screen.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/items/item_card.dart";

class KanjiItem extends StatelessWidget {
  const KanjiItem({required this.kanji});

  final Kanji kanji;

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      onTap: pushScreen(context, KanjiDetailsScreen(kanji: kanji)),
      onLongPress: () => showActionDialog(context, [
        ActionTile.url(kanji.url),
        ActionTile.text(kanji.kanji, name: "Kanji"),
        ActionTile.text(kanji.meanings.join(", "), name: "Meanings"),
      ]),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
        leading: JpText(kanji.kanji, style: const TextStyle(fontSize: 35)),
        title: Text(
          kanji.meanings.join(", "),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (kanji.kunReadings.isNotEmpty)
              JpText(
                "Kun: ${kanji.kunReadings.join("、$zeroWidthSpace").noBreak}",
              ),
            if (kanji.onReadings.isNotEmpty)
              JpText(
                "On: ${kanji.onReadings.join("、$zeroWidthSpace").noBreak}",
              ),
            JpText(
              [
                "${kanji.strokeCount} strokes",
                if (kanji.jlptLevel case final jlptLevel?) "JLPT $jlptLevel",
                if (kanji.type case final type?) type.name,
              ].join(", "),
            ),
          ],
        ),
      ),
    );
  }
}

class KanjiItemList extends StatelessWidget {
  const KanjiItemList({required this.items});

  final List<Kanji> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (_, index) => KanjiItem(kanji: items[index]),
    );
  }
}
