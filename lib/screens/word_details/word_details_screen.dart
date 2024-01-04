import "package:audioplayers/audioplayers.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/widgets/copyable_furigana_text.dart";
import "package:jsdict/widgets/wikipedia.dart";
import "package:jsdict/widgets/entry_tile.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/loader.dart";

import "definition_tile.dart";
import "inflection_table.dart";

class WordDetailsScreen extends StatelessWidget {
  WordDetailsScreen(Word this.word, {super.key}) : searchWord = null;
  WordDetailsScreen.search(String this.searchWord, {super.key}) : word = null;

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
                    tooltip: "Play Audio",
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
          ? _WordContentWidget(word!)
          : LoaderWidget(
              onLoad: _searchFuture,
              handler: _WordContentWidget.new,
            ),
    );
  }
}

class _WordContentWidget extends StatelessWidget {
  const _WordContentWidget(this.word);

  final Word word;

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
              child: CopyableFuriganaText(
                word.word,
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
                children: [
                  SelectionArea(
                      child: Column(
                    children: word.definitions
                        .map((definition) => DefinitionTile(
                              definition,
                              textColor: textColor,
                              isLast: definition == word.definitions.last,
                            ))
                        .toList()
                        .intersperce(const Divider(height: 0)),
                  ))
                ],
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
                                    child: CopyableFuriganaText([
                                      FuriganaPart(
                                          otherForm.form, otherForm.reading)
                                    ], style: const TextStyle(fontSize: 16)),
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
                    SelectionArea(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: JpText(word.notes.deduplicate().join("\n")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ].intersperce(const SizedBox(height: 8)),
            const SizedBox(height: 8),
            if (word.details != null) ...[
              _WordDetailsWidget(word.details!),
            ] else ...[
              if (word.shouldLoadDetails)
                LoaderWidget(
                  onLoad: () => getClient().wordDetails(word.id!),
                  handler: (loadedWord) =>
                      _WordDetailsWidget(loadedWord.details!),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _WordDetailsWidget extends StatelessWidget {
  const _WordDetailsWidget(this.wordDetails);

  final WordDetails wordDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (wordDetails.wikipedia != null) ...[
          WikipediaWidget(wordDetails.wikipedia!),
          const SizedBox(height: 8),
        ],
        KanjiItemList(wordDetails.kanji),
      ],
    );
  }
}
