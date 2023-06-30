import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:jsdict/packages/intersperce.dart";
import "package:jsdict/screens/wikipedia_screen.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/loader.dart";
import "package:jsdict/widgets/rounded_bottom_border.dart";
import "package:ruby_text/ruby_text.dart";

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
                  children: intersperce(
                    word.definitions
                        .map((definition) => _DefinitionTile(definition,
                            textColor: textColor,
                            isLast: definition == word.definitions.last,
                        ))
                        .toList(),
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
                        shape: collocation == word.collocations.last
                            ? RoundedBottomBorder(8)
                            : null,
                        title: Text(collocation.word),
                        subtitle: Text(collocation.meaning),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WordDetailsScreen(collocation.word, search: true),
                          ),
                        ),
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

class _DefinitionTile extends StatelessWidget {
  const _DefinitionTile(this.definition, {this.textColor, this.isLast = false});

  final Definition definition;
  final Color? textColor;
  final bool isLast;

  bool get isWikipedia => definition.wikipedia != null;

  Function()? onTap(BuildContext context) {
    if (isWikipedia) {
      return () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              WikipediaScreen(definition.wikipedia!)));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final linkColor = Theme.of(context).primaryColor;

    return ListTile(
      shape: isLast ? RoundedBottomBorder(8) : null,
      onTap: onTap(context),
      trailing: isWikipedia ? const Icon(Icons.keyboard_arrow_right) : null,
      title: Text(definition.meanings.join("; ")),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(definition.types.join(", ")),
          if (definition.tags.isNotEmpty)
            Text(definition.tags.join(", ")),
          if (definition.seeAlso.isNotEmpty)
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "See also ", style: TextStyle(color: textColor)),
                ...intersperce(
                  definition.seeAlso.map((seeAlsoWord) => TextSpan(
                    text: seeAlsoWord,
                    style: TextStyle(color: linkColor, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WordDetailsScreen(seeAlsoWord, search: true),
                      ),
                    ),
                  )).toList(),
                  TextSpan(text: ", ", style: TextStyle(color: textColor)),
                )
              ]
            ))
        ],
      ),
    );
  }
}