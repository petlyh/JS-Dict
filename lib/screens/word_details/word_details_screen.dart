import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/packages/intersperce.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/loader.dart";
import "package:jsdict/widgets/rounded_bottom_border.dart";
import "package:ruby_text/ruby_text.dart";

import "definition_tile.dart";
import "inflection_table.dart";

class WordDetailsScreen extends StatelessWidget {
  const WordDetailsScreen(this.inputWord, {super.key, this.search = false});

  final String inputWord;
  /// Search for the word.
  /// Use if `inputWord` is not the id of the details page.
  final bool search;

  Future<Word> _getFuture() {
    if (search) {
      return getClient().search<Word>(inputWord).then((response) {
        if (response.results.isEmpty) {
          throw Exception("Word not found");
        }
        return getClient().wordDetails(response.results.first.id!);
      });
    }
    return getClient().wordDetails(inputWord);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Word"),
        actions: [
          LinkPopupButton([
            ("Open in Browser", "https://jisho.org/word/$inputWord"),
          ]),
        ],
      ),
      body: LoaderWidget(
        onLoad: _getFuture,
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
                    ("Common", Colors.green),
                  if (word.jlptLevel != JLPTLevel.none)
                    ("JLPT ${word.jlptLevel.toString()}", Colors.blue),
                  if (word.wanikaniLevel != -1)
                    ("WaniKani Lv. ${word.wanikaniLevel}", Colors.blue),
                ]),
                const SizedBox(height: 16),
                ExpansionTileCard(
                  initiallyExpanded: true,
                  title: const Text("Definitions"),
                  children: word.definitions
                      .map((definition) => DefinitionTile(
                            definition,
                            textColor: textColor,
                            isLast: definition == word.definitions.last,
                          ))
                      .toList()
                      .intersperce(const Divider()),
                ),


                ...[
                  if (word.inflectionType != null)
                    ExpansionTileCard(
                      title: const Text("Inflections"),
                      children: [InflectionTable(word.inflectionType!)],
                    ),
                  if (word.collocations.isNotEmpty)
                    ExpansionTileCard(
                      title: const Text("Collocations"),
                      children: word.collocations
                          .map((collocation) => ListTile(
                                shape: collocation == word.collocations.last
                                    ? RoundedBottomBorder(8)
                                    : null,
                                title: Text(collocation.word),
                                subtitle: Text(collocation.meaning),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => WordDetailsScreen(
                                        collocation.word,
                                        search: true),
                                  ),
                                ),
                              ))
                          .toList()
                          .intersperce(const Divider()),
                    ),
                  if (word.otherForms.isNotEmpty)
                    ExpansionTileCard(
                      title: const Text("Other forms"),
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 2,
                              runSpacing: 8,
                              children: word.otherForms
                                  .map((otherForm) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: RubyText([
                                          RubyTextData(otherForm.form,
                                              ruby: otherForm.reading)
                                        ],
                                            style:
                                                const TextStyle(fontSize: 16)),
                                      ))
                                  .toList()
                              ),
                        )
                      ],
                    ),
                  if (word.notes.isNotEmpty)
                    ExpansionTileCard(
                      title: const Text("Notes"),
                      children: [
                        Flex(direction: Axis.horizontal, children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(word.notes.toSet().toList().join("\n")),
                          )
                        ])
                      ],
                    ),
                ].intersperce(const SizedBox(height: 4)),

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
