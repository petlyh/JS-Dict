import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/widgets/link_popup.dart';
import 'package:jsdict/models/models.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/info_chips.dart';
import 'package:jsdict/widgets/loader.dart';

import 'compound_list.dart';

class KanjiDetailsScreen extends StatelessWidget {
  const KanjiDetailsScreen(this.searchKanji, {super.key});

  final String searchKanji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kanji Details"),
        actions: [
          LinkPopupButton([
            ("Open in Browser", "https://jisho.org/search/$searchKanji %23kanji"),
            ("Unihan database", "http://www.unicode.org/cgi-bin/GetUnihanData.pl?codepoint=$searchKanji&useutf8=true"),
            ("Wiktionary", "http://en.wiktionary.org/wiki/$searchKanji"),
            ("Google", "http://www.google.com/search?ie=utf8&oe=utf8&lr=lang_ja&q=$searchKanji"),
          ]),
        ],
      ),
      body: LoaderWidget(
        onLoad: () => getClient().kanjiDetails(searchKanji),
        handler: (kanji) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(kanji.kanji, style: const TextStyle(fontSize: 40)),
                  ),
                  InfoChipList.color([
                    ("${kanji.strokeCount} strokes", Colors.green),
                    if (kanji.jlptLevel != JLPTLevel.none)
                      ("JLPT ${kanji.jlptLevel.toString()}", Colors.blue),
                    if (kanji.type != null)
                      (kanji.type.toString(), Colors.blue),
                  ]),
                  const Divider(),
                  ListTile(
                    title: Text(kanji.meanings.join(", ")),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (kanji.kunReadings.isNotEmpty)
                          Text("Kun: ${kanji.kunReadings.join("、 ")}"),
                        if (kanji.onReadings.isNotEmpty)
                          Text("On: ${kanji.onReadings.join("、 ")}"),
                        if (kanji.radical != null)
                          Text("Radical: ${kanji.radical!.meanings.join(', ')} ${kanji.radical!.character}"),
                      ],
                    ),
                  ),
                  const Divider(),
                  if (kanji.parts.length > 1) ...[
                    Wrap(
                      alignment: WrapAlignment.center,
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
                    ),
                    const Divider(),
                  ],
                  if (kanji.onCompounds.isNotEmpty)
                    CompoundList("On", kanji.onCompounds),
                  if (kanji.kunCompounds.isNotEmpty)
                    CompoundList("Kun", kanji.kunCompounds),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}