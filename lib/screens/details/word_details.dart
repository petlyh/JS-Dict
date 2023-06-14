import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/intersperce.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/inflection_table.dart';
import 'package:jsdict/widgets/info_chip_list.dart';
import 'package:jsdict/widgets/items/kanji.dart';
import 'package:jsdict/widgets/loader.dart';
import 'package:ruby_text/ruby_text.dart';

class WordDetailsScreen extends StatelessWidget {
  const WordDetailsScreen(this.inputWord, {super.key});

  final String inputWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Word Details")),
      body: LoaderWidget(
        future: getClient().wordDetails(inputWord),
        handler: (word) => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: RubyText(
                    word.word.toRubyData(),
                    style: const TextStyle(fontSize: 28),
                    rubyStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                InfoChipList.color([
                  if (word.commonWord)
                    ("Common", null),
                  if (word.jlptLevel != JLPTLevel.none)
                    ("JLPT ${word.jlptLevel.toString()}", Colors.blue),
                  if (word.wanikaniLevel != -1)
                    ("WaniKani Lv. ${word.wanikaniLevel}", Colors.blue),
                ]),
                const SizedBox(height: 16),
                ExpansionTileCard(
                  initiallyExpanded: true,
                  title: const Text("Definitions"),
                  children: intersperce(
                    word.definitions.map((definition) => ListTile(
                      title: Text(definition.meanings.join("; ")),
                      subtitle: Text(definition.types.join(", ")),
                    )).toList(),
                    const Divider(),
                  ),
                ),

                if (word.inflectionType != null) ...[
                  const SizedBox(height: 4),
                  ExpansionTileCard(
                    title: const Text("Inflections"),
                    children: [InflectionTable(word.inflectionType!)],
                  ),
                  const SizedBox(height: 4),
                ] else if (word.collocations.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  ExpansionTileCard(
                    title: const Text("Collocations"),
                    children: intersperce(
                      word.collocations.map((collocation) => ListTile(
                        title: Text(collocation.word),
                        subtitle: Text(collocation.meaning),
                      )).toList(),
                      const Divider(),
                    ),
                  ),
                  const SizedBox(height: 4),
                ] else
                  const SizedBox(height: 8),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: word.kanji.length,
                  itemBuilder: (_, index) => KanjiItem(kanji: word.kanji[index])
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}