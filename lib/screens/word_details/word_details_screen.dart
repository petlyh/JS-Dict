import "package:audioplayers/audioplayers.dart";
import "package:collection/collection.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/widgets/entry_tile.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/loader.dart";
import "package:ruby_text/ruby_text.dart";

import "definition_tile.dart";
import "inflection_table.dart";

class WordDetailsScreen extends StatelessWidget {
  WordDetailsScreen(this.word, {super.key}) : searchWord = null;
  WordDetailsScreen.search(this.searchWord, {super.key}) : word = null;

  final Word? word;
  final String? searchWord;

  final idValue = ValueNotifier<String?>(null);
  String? get id => word?.id ?? idValue.value;

  final audioUrlValue = ValueNotifier<String?>(null);
  String? get audioUrl => word?.audioUrl ?? audioUrlValue.value;

  Future<Word> _searchFuture() =>
      getClient().search<Word>(searchWord!).then((response) {
        if (response.results.isEmpty) {
          throw Exception("Word not found");
        }

        final word = response.results.first;

        idValue.value = word.id;
        audioUrlValue.value = word.audioUrl;

        return word;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word"),
        actions: [
          ValueListenableBuilder(
            valueListenable: audioUrlValue,
            builder: (_, __, ___) => audioUrl != null
                ? IconButton(
                    onPressed: () => AudioPlayer().play(
                          UrlSource(audioUrl!),
                          mode: PlayerMode.lowLatency,
                          ctx: AudioContextConfig(duckAudio: true).build(),
                        ),
                    icon: const Icon(Icons.play_arrow))
                : const SizedBox(),
          ),
          ValueListenableBuilder(
            valueListenable: idValue,
            builder: (_, __, ___) => id != null
                ? LinkPopupButton([
                    ("Open in Browser", "https://jisho.org/word/$id"),
                  ])
                : const SizedBox(),
          ),
        ],
      ),
      body: word != null
          ? _WordDetails(word!)
          : LoaderWidget(
              onLoad: _searchFuture,
              handler: (word) => _WordDetails(word),
            ),
    );
  }
}

class _WordDetails extends StatelessWidget {
  const _WordDetails(this.word);

  final Word word;

  Widget _kanjiWidget(List<Kanji> kanji) => ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: kanji.length,
      itemBuilder: (_, index) => KanjiItem(kanji: kanji[index]));

  /// checks whether [text] doesn't contain any kanji characters.
  bool isNonKanji(String text) {
    const cjkUnifiedIdeographsStart = 0x4E00;
    const cjkUnifiedIdeographsEnd = 0x9FFF;

    final codeUnits = text.trim().codeUnits;
    final firstKanji = codeUnits.firstWhereOrNull((unit) =>
        cjkUnifiedIdeographsStart <= unit && unit <= cjkUnifiedIdeographsEnd);

    return firstKanji == null;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final shadowColor = Theme.of(context).colorScheme.shadow;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: RubyText(
                word.word.rubyData,
                style: const TextStyle(fontSize: 28).jp(),
                rubyStyle: const TextStyle(fontSize: 14).jp(),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                if (word.commonWord)
                  const InfoChip("Common", color: Colors.green),
                if (word.jlptLevel != JLPTLevel.none)
                  InfoChip("JLPT ${word.jlptLevel.toString()}",
                      color: Colors.blue),
                ...word.wanikaniLevels.map((wanikaniLevel) => InfoChip(
                    "WaniKani Lv. $wanikaniLevel",
                    color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),
            ...[
              ExpansionTileCard(
                shadowColor: shadowColor,
                initiallyExpanded: true,
                title: const Text("Definitions"),
                children: word.definitions
                    .map((definition) => DefinitionTile(
                          definition,
                          textColor: textColor,
                          isLast: definition == word.definitions.last,
                        ))
                    .toList()
                    .intersperce(const Divider(height: 0)),
              ),
              if (word.inflectionType != null)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Inflections"),
                  children: [InflectionTable(word.inflectionType!)],
                ),
              if (word.collocations.isNotEmpty)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Collocations"),
                  children: word.collocations
                      .map((collocation) => EntryTile(
                            isLast: collocation == word.collocations.last,
                            title: JpText(collocation.word),
                            subtitle: Text(collocation.meaning),
                            onTap: pushScreen(context,
                                WordDetailsScreen.search(collocation.word)),
                          ))
                      .toList()
                      .intersperce(const Divider(height: 0)),
                ),
              if (word.otherForms.isNotEmpty)
                ExpansionTileCard(
                  shadowColor: shadowColor,
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
                                            const TextStyle(fontSize: 16).jp(),
                                        rubyStyle: jpTextStyle),
                                  ))
                              .toList()),
                    )
                  ],
                ),
              if (word.notes.isNotEmpty)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Notes"),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: JpText(word.notes.deduplicate().join("\n")),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ].intersperce(const SizedBox(height: 8)),
            const SizedBox(height: 8),
            if (word.kanji.isNotEmpty) ...[
              _kanjiWidget(word.kanji),
            ] else ...[
              if (!isNonKanji(word.word.getText()))
                LoaderWidget(
                  onLoad: () => getClient().wordDetails(word.id!),
                  handler: (wordDetails) => _kanjiWidget(wordDetails.kanji),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
