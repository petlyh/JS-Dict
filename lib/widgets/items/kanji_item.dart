import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/kanji_details/kanji_details_screen.dart";

import "item_card.dart";

class KanjiItem extends StatelessWidget {
  const KanjiItem({super.key, required this.kanji});

  final Kanji kanji;

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      onTap: pushScreen(context, KanjiDetailsScreen(kanji.kanji)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        leading: Text(kanji.kanji, style: const TextStyle(fontSize: 35)),
        title: Text(kanji.meanings.join(", "), style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Kun: ${kanji.kunReadings.join("、 ")}"),
            Text("On: ${kanji.onReadings.join("、 ")}"),
            Text([
              "${kanji.strokeCount} strokes",
              if (kanji.jlptLevel != JLPTLevel.none) "JLPT ${kanji.jlptLevel}",
              if (kanji.type != null) kanji.type.toString(),
            ].join(", ")),
          ],
        )
      )
    );
  }
}