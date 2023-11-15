import "package:collection/collection.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/loader.dart";

import "compound_list.dart";
import "stroke_diagram.dart";

class KanjiDetailsScreen extends StatelessWidget {
  const KanjiDetailsScreen(this.kanji, {super.key}) : searchKanji = null;
  const KanjiDetailsScreen.search(this.searchKanji, {super.key}) : kanji = null;

  final Kanji? kanji;
  final String? searchKanji;

  @override
  Widget build(BuildContext context) {
    final kanjiId = searchKanji ?? kanji!.kanji;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kanji"),
        actions: [
          LinkPopupButton([
            ("Open in Browser", "https://jisho.org/search/$kanjiId %23kanji"),
            (
              "Unihan database",
              "http://www.unicode.org/cgi-bin/GetUnihanData.pl?codepoint=$kanjiId&useutf8=true"
            ),
            ("Wiktionary", "http://en.wiktionary.org/wiki/$kanjiId"),
          ]),
        ],
      ),
      body: kanji != null
          ? _KanjiContentWidget(kanji!)
          : LoaderWidget(
              onLoad: () => getClient().kanjiDetails(searchKanji!),
              handler: _KanjiContentWidget.new,
            ),
    );
  }
}

class _KanjiContentWidget extends StatelessWidget {
  _KanjiContentWidget(this.kanji);

  final Kanji kanji;

  final radicalValue = ValueNotifier<Radical?>(null);
  Radical? get radical => kanji.details?.radical ?? radicalValue.value;

  Future<Kanji> get _future =>
      getClient().kanjiDetails(kanji.kanji).then((value) {
        radicalValue.value = value.details!.radical;
        return value;
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child:
                  Text(kanji.kanji, style: const TextStyle(fontSize: 40).jp()),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                InfoChip("${kanji.strokeCount} strokes", color: Colors.green),
                if (kanji.jlptLevel != JLPTLevel.none)
                  InfoChip("JLPT ${kanji.jlptLevel.toString()}",
                      color: Colors.blue),
                if (kanji.type != null)
                  InfoChip(kanji.type.toString(), color: Colors.blue),
              ],
            ),
            const Divider(),
            ListTile(
              title: Text(kanji.meanings.join(", ")),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (kanji.kunReadings.isNotEmpty)
                    JpText("Kun: ${kanji.kunReadings.join("、 ")}"),
                  if (kanji.onReadings.isNotEmpty)
                    JpText("On: ${kanji.onReadings.join("、 ")}"),
                  ValueListenableBuilder(
                    valueListenable: radicalValue,
                    builder: (_, __, ___) => radical != null
                        ? JpText(
                            "Radical: ${radical!.meanings.join(', ')} ${radical!.character}")
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
            const Divider(),
            kanji.details != null
                ? _KanjiDetailsWidget(kanji, kanji.details!)
                : LoaderWidget(
                    onLoad: () => _future,
                    handler: (kanjiDetails) =>
                        _KanjiDetailsWidget(kanji, kanjiDetails.details!),
                  ),
          ],
        ),
      ),
    );
  }
}

class _KanjiDetailsWidget extends StatelessWidget {
  const _KanjiDetailsWidget(this.kanji, this.kanjiDetails);

  final Kanji kanji;
  final KanjiDetails kanjiDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (kanjiDetails.parts.length > 1) ...[
          Wrap(
              alignment: WrapAlignment.center,
              children: kanjiDetails.parts
                  .whereNot((part) => part == kanji.kanji)
                  .map((part) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: pushScreen(
                              context, KanjiDetailsScreen.search(part)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(part,
                                style: const TextStyle(fontSize: 20).jp()),
                          ),
                        ),
                      ))
                  .toList()),
          const Divider(),
        ],
        if (kanjiDetails.variants.isNotEmpty)
          _VariantsWidget(kanjiDetails.variants),
        if (kanjiDetails.kanjiVgData != null)
          StrokeDiagramWidget(kanjiDetails.kanjiVgData!),
        if (kanjiDetails.onCompounds.isNotEmpty)
          CompoundList("On", kanjiDetails.onCompounds),
        const SizedBox(height: 4),
        if (kanjiDetails.kunCompounds.isNotEmpty)
          CompoundList("Kun", kanjiDetails.kunCompounds),
      ],
    );
  }
}

class _VariantsWidget extends StatelessWidget {
  const _VariantsWidget(this.variants);

  final List<String> variants;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      shadowColor: Theme.of(context).colorScheme.shadow,
      title: const Text("Variants"),
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                children: variants
                    .map(
                      (variant) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: pushScreen(
                              context, KanjiDetailsScreen.search(variant)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Text(variant,
                                style: const TextStyle(fontSize: 20).jp()),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
