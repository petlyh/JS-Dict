import "package:audioplayers/audioplayers.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/word_details/definition_tile.dart";
import "package:jsdict/screens/word_details/inflection_table.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/copyable_furigana_text.dart";
import "package:jsdict/widgets/entry_tile.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/wikipedia.dart";

class WordDetailsScreen extends StatelessWidget {
  const WordDetailsScreen(String this.wordInput, {super.key})
      : preloadedWord = null,
        isSearch = false;

  const WordDetailsScreen.preload(Word this.preloadedWord, {super.key})
      : wordInput = null,
        isSearch = false;

  const WordDetailsScreen.search(String this.wordInput, {super.key})
      : preloadedWord = null,
        isSearch = true;

  final Word? preloadedWord;
  final String? wordInput;
  final bool isSearch;

  Future<Word> _createFuture() => preloadedWord != null
      ? SynchronousFuture(preloadedWord!)
      : isSearch
          ? getClient().search<Word>(wordInput!).then((r) => r.results.first)
          : getClient().wordDetails(wordInput!);

  @override
  Widget build(BuildContext context) {
    return FutureLoader<Word>(
      onLoad: _createFuture,
      handler: _WordContentWidget.new,
      frameBuilder: (_, child, data) => Scaffold(
        appBar: AppBar(
          title: const Text("Word"),
          actions: [
            if (data?.audioUrl != null)
              IconButton(
                tooltip: "Play Audio",
                onPressed: () => AudioPlayer().play(
                  UrlSource(data!.audioUrl!),
                  mode: PlayerMode.lowLatency,
                  ctx: AudioContextConfig(
                    focus: AudioContextConfigFocus.duckOthers,
                  ).build(),
                ),
                icon: const Icon(Icons.play_arrow),
              ),
            if (data?.id != null)
              LinkPopupButton([
                ("Open in Browser", "https://jisho.org/word/${data?.id}"),
              ]),
          ],
        ),
        body: child,
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
        margin: const EdgeInsets.all(8),
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
                if (word.isCommon)
                  const InfoChip("Common", color: Colors.green),
                if (word.jlptLevel != null)
                  InfoChip("JLPT ${word.jlptLevel}", color: Colors.blue),
                ...word.wanikaniLevels.map(
                  (level) => InfoChip(
                    "WaniKani Lv. $level",
                    color: Colors.blue,
                  ),
                ),
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
                          .map(
                            (definition) => DefinitionTile(
                              definition,
                              textColor: textColor,
                              isLast: definition == word.definitions.last,
                            ),
                          )
                          .toList()
                          .intersperce(const Divider(height: 0)),
                    ),
                  ),
                ],
              ),
              if (word.inflectionData != null)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Inflections"),
                  children: [InflectionTable(word.inflectionData!)],
                ),
              if (word.collocations.isNotEmpty)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Collocations"),
                  children: word.collocations
                      .map(
                        (collocation) => EntryTile(
                          isLast: collocation == word.collocations.last,
                          title: JpText(collocation.word),
                          subtitle: Text(collocation.meaning),
                          onTap: pushScreen(
                            context,
                            WordDetailsScreen.search(collocation.word),
                          ),
                        ),
                      )
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
                        horizontal: 12,
                        vertical: 8,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 2,
                        runSpacing: 8,
                        children: word.otherForms
                            .map(
                              (otherForm) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: CopyableFuriganaText(
                                  [
                                    FuriganaPart(
                                      otherForm.form,
                                      otherForm.reading,
                                    ),
                                  ],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
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
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: JpText(
                              word.notes
                                  .deduplicate<Note>()
                                  .map((note) => "${note.form}: ${note.note}")
                                  .join("\n"),
                            ),
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
                FutureLoader(
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
