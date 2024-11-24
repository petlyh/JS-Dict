import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/is_kanji.dart";
import "package:jsdict/providers/client.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/info_chip.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/wikipedia_card.dart";

class NameDetailsScreen extends ConsumerWidget {
  const NameDetailsScreen({required this.name});

  final Name name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.read(clientProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Name"),
        actions: [
          if (name.wordId case final wordId?)
            LinkPopupButton([
              ("Open in Browser", "https://jisho.org/word/$wordId"),
            ]),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              SelectionArea(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        name.japanese +
                            (name.reading != null ? "\n${name.reading}" : ""),
                        style: const TextStyle(fontSize: 20).jp(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        name.english,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              if (name.type case final type?) ...[
                InfoChip(type),
                const SizedBox(height: 10),
              ],
              if (name.wordId case final wordId?)
                FutureLoader(
                  onLoad: () => client.wordDetails(wordId),
                  handler: (word) => Column(
                    children: [
                      WikipediaCard(info: word.details!.wikipedia!),
                      const SizedBox(height: 8),
                      KanjiItemList(items: word.details!.kanji),
                    ],
                  ),
                )
              else if (!isNonKanji(name.japanese))
                FutureLoader(
                  onLoad: () => client.search<Kanji>(name.japanese),
                  handler: (response) => KanjiItemList(items: response.results),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
