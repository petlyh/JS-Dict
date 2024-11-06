import "package:collection/collection.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/copy.dart";
import "package:jsdict/packages/katakana_convert.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/string_util.dart";
import "package:jsdict/screens/kanji_details/compound_list.dart";
import "package:jsdict/screens/kanji_details/stroke_diagram.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/info_chip.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/link_span.dart";

class KanjiDetailsScreen extends StatelessWidget {
  const KanjiDetailsScreen(Kanji this.kanji, {super.key}) : kanjiId = null;
  const KanjiDetailsScreen.id(String this.kanjiId, {super.key}) : kanji = null;

  final Kanji? kanji;
  final String? kanjiId;

  @override
  Widget build(BuildContext context) {
    final id = kanjiId ?? kanji!.kanji;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kanji"),
        actions: [
          LinkPopupButton([
            ("Open in Browser", "https://jisho.org/search/$id %23kanji"),
            (
              "Unihan database",
              "http://www.unicode.org/cgi-bin/GetUnihanData.pl?codepoint=$id&useutf8=true"
            ),
            ("Wiktionary", "http://en.wiktionary.org/wiki/$id"),
          ]),
        ],
      ),
      body: FutureLoader(
        onLoad: () => kanji != null
            ? SynchronousFuture(kanji!) as Future<Kanji>
            : getClient().kanjiDetails(kanjiId!),
        handler: _KanjiContentWidget.new,
      ),
    );
  }
}

class _KanjiContentWidget extends StatelessWidget {
  const _KanjiContentWidget(this.kanji);

  final Kanji kanji;

  @override
  Widget build(BuildContext context) {
    return FutureLoader(
      onLoad: () => kanji.details != null
          ? SynchronousFuture(kanji.details!) as Future<KanjiDetails>
          : getClient()
              .kanjiDetails(kanji.kanji)
              .then((kanji) => kanji.details!),
      handler: (details) => _KanjiDetailsWidget(kanji, details),
      frameBuilder: (context, child, details) => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              GestureDetector(
                onLongPress: () => copyText(context, kanji.kanji),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    kanji.kanji,
                    style: const TextStyle(fontSize: 40).jp(),
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  InfoChip("${kanji.strokeCount} strokes", color: Colors.green),
                  if (kanji.jlptLevel != null)
                    InfoChip(
                      "JLPT ${kanji.jlptLevel}",
                      color: Colors.blue,
                    ),
                  if (kanji.type != null)
                    InfoChip(kanji.type!.name, color: Colors.blue),
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
                    if (details?.radical != null)
                      JpText(
                        "Radical: ${details?.radical!.meanings.join(', ')} ${details?.radical!.character}",
                      ),
                  ],
                ),
              ),
              const Divider(),
              child,
            ],
          ),
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

  String _createQuery(String reading) =>
      "$kanji ${convertKatakana(reading.replaceAll(RegExp(r"[\.-]"), ""))}";

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$name: ",
            style: TextStyle(color: textColor).jp(),
          ),
          ...readings
              .map(
                (reading) => LinkSpan(
                  context,
                  text: reading.noBreak,
                  onTap: pushScreen(
                    context,
                    ResultPageScreen<Word>(query: _createQuery(reading)),
                  ),
                ),
              )
              .toList()
              .intersperce(
                TextSpan(
                  text: "、 ",
                  style: TextStyle(color: textColor).jp(),
                ),
              ),
        ],
        style: TextStyle(color: textColor, height: 1.5).jp(),
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
                .map(
                  (part) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: pushScreen(context, KanjiDetailsScreen.id(part)),
                      onLongPress: () => showActionDialog(context, [
                        ActionTile.url(Kanji.createUrl(part)),
                        ActionTile.text("Kanji", part),
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          part,
                          style: const TextStyle(fontSize: 20).jp(),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
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
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: pushScreen(
                            context,
                            KanjiDetailsScreen.id(variant),
                          ),
                          onLongPress: () => showActionDialog(context, [
                            ActionTile.url(Kanji.createUrl(variant)),
                            ActionTile.text("Kanji", variant),
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Text(
                              variant,
                              style: const TextStyle(fontSize: 20).jp(),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
