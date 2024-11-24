import "package:audioplayers/audioplayers.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fpdart/fpdart.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/deduplicate.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/rounded_bottom_border.dart";
import "package:jsdict/providers/client.dart";
import "package:jsdict/screens/word_details/definition_tile.dart";
import "package:jsdict/screens/word_details/inflection_table.dart";
import "package:jsdict/widgets/copyable_furigana_text.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/info_chip.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/wikipedia_card.dart";

class WordDetailsScreen extends ConsumerWidget {
  const WordDetailsScreen({required String this.word})
      : preloadedWord = null,
        query = null;

  const WordDetailsScreen.preload({required Word word})
      : preloadedWord = word,
        word = null,
        query = null;

  const WordDetailsScreen.search({required String this.query})
      : preloadedWord = null,
        word = null;

  final Word? preloadedWord;
  final String? word;
  final String? query;

  Future<Word> Function() _createFuture(JishoClient client) =>
      () => preloadedWord != null
          ? SynchronousFuture(preloadedWord!)
          : query != null
              ? client.search<Word>(query!).then((r) => r.results.first)
              : client.wordDetails(word!);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureLoader<Word>(
      onLoad: _createFuture(ref.read(clientProvider)),
      handler: (wordData) => _WordContent(word: wordData),
      frameBuilder: (_, child, wordData) => Scaffold(
        appBar: AppBar(
          title: const Text("Word"),
          actions: [
            if (wordData?.audioUrl case final audioUrl?)
              IconButton(
                tooltip: "Play Audio",
                onPressed: () => AudioPlayer().play(
                  UrlSource(audioUrl),
                  mode: PlayerMode.lowLatency,
                  ctx: AudioContextConfig(
                    focus: AudioContextConfigFocus.duckOthers,
                  ).build(),
                ),
                icon: const Icon(Icons.play_arrow),
              ),
            if (wordData?.id case final id?)
              LinkPopupButton(
                [("Open in Browser", "https://jisho.org/word/$id")],
              ),
          ],
        ),
        body: child,
      ),
    );
  }
}

class _WordContent extends ConsumerWidget {
  const _WordContent({required this.word});

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                furigana: word.word,
                style: const TextStyle(fontSize: 28),
                rubyStyle: const TextStyle(fontSize: 14),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                if (word.isCommon)
                  const InfoChip("Common", color: Colors.green),
                if (word.jlptLevel case final jlptLevel?)
                  InfoChip("JLPT $jlptLevel", color: Colors.blue),
                ...word.wanikaniLevels.map(
                  (level) => InfoChip(
                    "WaniKani Lv. $level",
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...<Widget>[
              ExpansionTileCard(
                shadowColor: shadowColor,
                initiallyExpanded: true,
                title: const Text("Definitions"),
                children: [
                  SelectionArea(
                    child: Column(
                      children: word.definitions
                          .map<Widget>(
                            (definition) => DefinitionTile(
                              definition: definition,
                              isLast: definition == word.definitions.last,
                            ),
                          )
                          .intersperse(const Divider(height: 0))
                          .toList(),
                    ),
                  ),
                ],
              ),
              if (word.inflectionData case final inflectionData?)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Inflections"),
                  children: [InflectionTable(data: inflectionData)],
                ),
              if (word.collocations.isNotEmpty)
                ExpansionTileCard(
                  shadowColor: shadowColor,
                  title: const Text("Collocations"),
                  children: word.collocations
                      .map<Widget>(
                        (collocation) => ListTile(
                          shape: collocation == word.collocations.last
                              ? RoundedBottomBorder()
                              : null,
                          title: JpText(collocation.word),
                          subtitle: Text(collocation.meaning),
                          onTap: pushScreen(
                            context,
                            WordDetailsScreen.search(query: collocation.word),
                          ),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        ),
                      )
                      .intersperse(const Divider(height: 0))
                      .toList(),
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
                                  furigana: [
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
                              word.notes.deduplicated
                                  .map((note) => "${note.form}: ${note.note}")
                                  .join("\n"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ].intersperse(const SizedBox(height: 8)),
            const SizedBox(height: 8),
            if (word.details case final details?)
              _WordDetailsContent(details: details)
            else ...[
              if (word.shouldLoadDetails)
                FutureLoader(
                  onLoad: () => ref.read(clientProvider).wordDetails(word.id!),
                  handler: (loadedWord) =>
                      _WordDetailsContent(details: loadedWord.details!),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _WordDetailsContent extends StatelessWidget {
  const _WordDetailsContent({required this.details});

  final WordDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (details.wikipedia case final wikipedia?) ...[
          WikipediaCard(info: wikipedia),
          const SizedBox(height: 8),
        ],
        KanjiItemList(items: details.kanji),
      ],
    );
  }
}
