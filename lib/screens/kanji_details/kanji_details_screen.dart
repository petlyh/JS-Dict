import "package:collection/collection.dart";
import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fpdart/fpdart.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/copy.dart";
import "package:jsdict/packages/katakana_convert.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/string_util.dart";
import "package:jsdict/providers/client.dart";
import "package:jsdict/screens/kanji_details/compound_list.dart";
import "package:jsdict/screens/kanji_details/stroke_order_diagram.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/info_chip.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/widgets/link_span.dart";

class KanjiDetailsScreen extends ConsumerWidget {
  const KanjiDetailsScreen({required Kanji this.kanji}) : id = null;
  const KanjiDetailsScreen.id({required String this.id}) : kanji = null;

  final Kanji? kanji;
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kanjiId = id ?? kanji?.kanji;

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
      body: FutureLoader(
        onLoad: () => kanji != null
            ? SynchronousFuture(kanji!) as Future<Kanji>
            : ref.read(clientProvider).kanjiDetails(id!),
        handler: (data) => _KanjiContent(kanji: data),
      ),
    );
  }
}

class _KanjiContent extends ConsumerWidget {
  const _KanjiContent({required this.kanji});

  final Kanji kanji;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureLoader(
      onLoad: () => kanji.details != null
          ? SynchronousFuture(kanji.details!) as Future<KanjiDetails>
          : ref
              .read(clientProvider)
              .kanjiDetails(kanji.kanji)
              .then((kanji) => kanji.details!),
      handler: (details) => _KanjiDetailsContent(
        kanji: kanji,
        details: details,
      ),
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
                  if (kanji.jlptLevel case final jlptLevel?)
                    InfoChip("JLPT $jlptLevel", color: Colors.blue),
                  if (kanji.type case final type?)
                    InfoChip(type.name, color: Colors.blue),
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
                      _ReadingsText(
                        name: "Kun",
                        kanji: kanji.kanji,
                        readings: kanji.kunReadings,
                      ),
                    if (kanji.onReadings.isNotEmpty)
                      _ReadingsText(
                        name: "On",
                        kanji: kanji.kanji,
                        readings: kanji.onReadings,
                      ),
                    if (details?.radical case final radical?)
                      JpText(
                        "Radical: ${radical.meanings.join(', ')} ${radical.character}",
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

class _ReadingsText extends StatelessWidget {
  const _ReadingsText({
    required this.name,
    required this.kanji,
    required this.readings,
  });

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
              .map<InlineSpan>(
                (reading) => LinkSpan(
                  context: context,
                  text: reading.noBreak,
                  onTap: pushScreen(
                    context,
                    ResultPageScreen<Word>(query: _createQuery(reading)),
                  ),
                ),
              )
              .intersperse(
                TextSpan(text: "、 ", style: TextStyle(color: textColor).jp()),
              ),
        ],
        style: TextStyle(color: textColor, height: 1.5).jp(),
      ),
    );
  }
}

class _KanjiDetailsContent extends StatelessWidget {
  const _KanjiDetailsContent({required this.kanji, required this.details});

  final Kanji kanji;
  final KanjiDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (details.parts.length > 1) ...[
          Wrap(
            alignment: WrapAlignment.center,
            children: details.parts
                .whereNot((part) => part == kanji.kanji)
                .map(
                  (part) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: pushScreen(
                        context,
                        KanjiDetailsScreen.id(id: part),
                      ),
                      onLongPress: () => showActionDialog(context, [
                        ActionTile.url(Kanji.createUrl(part)),
                        ActionTile.text(part, name: "Kanji"),
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
        if (details.variants.isNotEmpty)
          _VariantsCard(variants: details.variants),
        StrokeOrderDiagram(kanjiCode: kanji.code),
        if (details.onCompounds.isNotEmpty)
          CompoundList(type: "On", compounds: details.onCompounds),
        const SizedBox(height: 4),
        if (details.kunCompounds.isNotEmpty)
          CompoundList(type: "Kun", compounds: details.kunCompounds),
      ],
    );
  }
}

class _VariantsCard extends StatelessWidget {
  const _VariantsCard({required this.variants});

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
                            KanjiDetailsScreen.id(id: variant),
                          ),
                          onLongPress: () => showActionDialog(context, [
                            ActionTile.url(Kanji.createUrl(variant)),
                            ActionTile.text(variant, name: "Kanji"),
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
