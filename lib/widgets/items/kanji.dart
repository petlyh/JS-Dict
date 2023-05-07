import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';

class KanjiItem extends StatelessWidget {
  const KanjiItem({super.key, required this.kanji});

  final Kanji kanji;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {},
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        leading: Text(kanji.kanji, style: const TextStyle(fontSize: 35)),
        title: Text(kanji.meanings.join(", ")),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Kun: ${kanji.kunReadings.join("、 ")}"),
            Text("On: ${kanji.onReadings.join("、 ")}"),
            Text(extraInfo(kanji)),
          ],
        )
      )
    );
  }

  String extraInfo(Kanji kanji) {
    var info = ["${kanji.strokeCount} strokes"];

    if (kanji.jlptLevel != JLPTLevel.none) {
      info.add("JLPT ${kanji.jlptLevel}");
    }

    if (kanji.grade != -1) {
      info.add("grade ${kanji.grade}");
    }

    return info.join(", ");
  }
}