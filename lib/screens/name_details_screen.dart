import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/is_kanji.dart";
import "package:jsdict/widgets/wikipedia.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/loader.dart";

class NameDetailsScreen extends StatelessWidget {
  const NameDetailsScreen(this.name, {super.key});

  final Name name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name"),
        actions: [
          if (name.wikipediaWord != null)
            LinkPopupButton([
              (
                "Open in Browser",
                "https://jisho.org/word/${name.wikipediaWord}"
              )
            ]),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          name.japanese +
                              (name.reading != null ? "\n${name.reading}" : ""),
                          style: const TextStyle(fontSize: 20).jp(),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 12),
                      Text(name.english,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center),
                    ],
                  )),
              if (name.type != null) ...[
                InfoChip(name.type!),
                const SizedBox(height: 10),
              ],
              if (name.wikipediaWord != null) ...[
                LoaderWidget(
                  onLoad: () => getClient().wordDetails(name.wikipediaWord!),
                  handler: (word) => Column(
                    children: [
                      WikipediaWidget(word.details!.wikipedia!),
                      const SizedBox(height: 8),
                      KanjiItemList(word.details!.kanji),
                    ],
                  ),
                ),
              ] else if (!isNonKanji(name.japanese))
                LoaderWidget(
                  onLoad: () => getClient().search<Kanji>(name.japanese),
                  handler: (response) => KanjiItemList(response.results),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
