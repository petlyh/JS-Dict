import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/info_chip_list.dart';
import 'package:jsdict/widgets/loader.dart';
import 'package:jsdict/widgets/reading_compounds_list.dart';

class KanjiDetailsScreen extends StatelessWidget {
  const KanjiDetailsScreen(this.searchKanji, {super.key});

  final String searchKanji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kanji Details")),
      body: LoaderWidget(
        future: getClient().kanjiDetails(searchKanji),
        handler: (kanji) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: getColumnItems(context, kanji),
              ),
            ),
          );
        }
      ),
    );
  }

  List<Text> getInfoText(Kanji kanji) {
    List<Text> infoText = [];

    if (kanji.kunReadings.isNotEmpty) {
      infoText.add(Text("Kun: ${kanji.kunReadings.join("、 ")}"));
    }

    if (kanji.onReadings.isNotEmpty) {
      infoText.add(Text("Kun: ${kanji.onReadings.join("、 ")}"));
    }

    if (kanji.radical != null) {
      infoText.add(Text("Radical: ${kanji.radical!.meanings.join(', ')} ${kanji.radical!.character}"));
    }

    return infoText;
  }

  List<Widget> getColumnItems(BuildContext context, Kanji kanji) {
    List<Widget> items = [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(kanji.kanji, style: const TextStyle(fontSize: 48)),
      ),
      InfoChipList.color([
        ("${kanji.strokeCount} strokes", null),
        (kanji.jlptLevel != JLPTLevel.none ? "JLPT ${kanji.jlptLevel.toString()}" : null, Colors.blue),
        (kanji.type?.toString(), Colors.blue),
      ]),
      const Divider(),
      ListTile(
        title: Text(kanji.meanings.join(", ")),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: getInfoText(kanji),
        ),
      ),
      const Divider()
    ];

    if (kanji.parts.length > 1) {
      items.add(
        Wrap(
          children: kanji.parts.whereNot((part) => part == kanji.kanji).map((part) => Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: InkWell(
              onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => KanjiDetailsScreen(part)))},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(part, style: const TextStyle(fontSize: 20)),
              ),
            ),
          )).toList()
        )
      );
      items.add(const Divider());
    }

    if (kanji.onReadingCompounds.isNotEmpty) {
      items.add(ReadingCompoundsList("On", kanji.onReadingCompounds));
    }

    if (kanji.kunReadingCompounds.isNotEmpty) {
      items.add(ReadingCompoundsList("Kun", kanji.kunReadingCompounds));
    }

    return items;
  }
}