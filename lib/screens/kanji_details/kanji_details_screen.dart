import "package:collection/collection.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/copy.dart";
import "package:jsdict/packages/katakana_convert.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/string_util.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/link_span.dart";
import "package:jsdict/widgets/loader.dart";

import "compound_list.dart";
import "stroke_diagram.dart";

class KanjiDetailsScreen extends StatelessWidget {
  const KanjiDetailsScreen(Kanji this.kanji, {super.key}) : kanjiId = null;
  const KanjiDetailsScreen.id(String this.kanjiId, {super.key}) : kanji = null;

  final Kanji? kanji;
  final String? kanjiId;

  String get _id => kanjiId ?? kanji!.kanji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kanji"),
        actions: [
          LinkPopupButton([
            ("Open in Browser", "https://jisho.org/search/$_id %23kanji"),
            (
              "Unihan database",
              "http://www.unicode.org/cgi-bin/GetUnihanData.pl?codepoint=$_id&useutf8=true"
            ),
            ("Wiktionary", "http://en.wiktionary.org/wiki/$_id"),
          ]),
        ],
      ),
      body: kanji != null
          ? _KanjiContentWidget(kanji!)
          : LoaderWidget(
              onLoad: () => getClient().kanjiDetails(kanjiId!),
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
            GestureDetector(
              onLongPress: () => copyText(context, kanji.kanji),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(kanji.kanji,
                    style: const TextStyle(fontSize: 40).jp()),
              ),
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
              title: SelectableText(kanji.meanings.join(", ")),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (kanji.kunReadings.isNotEmpty)
                    _ReadingsWidget("Kun", kanji.kanji, kanji.kunReadings),
                  if (kanji.onReadings.isNotEmpty)
                    _ReadingsWidget("On", kanji.kanji, kanji.onReadings),
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

class _ReadingsWidget extends StatelessWidget {
  const _ReadingsWidget(this.name, this.kanji, this.readings);

  final String name;
  final String kanji;
  final List<String> readings;

  String query(String reading) =>
      "$kanji ${convertKatakana(reading.replaceAll(RegExp(r"[\.-]"), ""))}";

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return RichText(
      text: TextSpan(
          children: [
                TextSpan(
                    text: "$name: ", style: TextStyle(color: textColor).jp())
              ] +
              readings
                  .map((reading) => LinkSpan(context,
                      text: reading.noBreak,
                      onTap: pushScreen(
                          context, ResultPageScreen<Word>(query(reading)))))
                  .toList()
                  .intersperce(TextSpan(
                      text: "、 ", style: TextStyle(color: textColor).jp())),
          style: TextStyle(color: textColor, height: 1.5).jp()),
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
                          onTap:
                              pushScreen(context, KanjiDetailsScreen.id(part)),
                          onLongPress: () => showActionDialog(context, [
                            ...urlActionTiles(Kanji(part).url),
                            CopyActionTile("Kanji", part),
                          ]),
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
        StrokeDiagramWidget(kanji.code),
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
                              context, KanjiDetailsScreen.id(variant)),
                          onLongPress: () => showActionDialog(context, [
                            ...urlActionTiles(Kanji(variant).url),
                            CopyActionTile("Kanji", variant),
                          ]),
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
