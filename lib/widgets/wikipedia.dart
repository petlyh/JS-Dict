import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:url_launcher/url_launcher.dart";

class WikipediaWidget extends StatelessWidget {
  const WikipediaWidget(this.wikipedia, {super.key});

  final WikipediaInfo wikipedia;

  Widget link(WikipediaPage page, String wikiName, String id) => Tooltip(
        message: wikiName,
        child: ElevatedButton(
          child: Text(id),
          onPressed: () {
            launchUrl(
              Uri.parse(page.url.replaceFirst(RegExp(r"[\?&]oldid=\d+"), "")),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).colorScheme.shadow;

    return ExpansionTileCard(
      shadowColor: shadowColor,
      title: const Text("Wikipedia"),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              if (wikipedia.textAbstract != null) ...[
                SelectableText(wikipedia.textAbstract!),
                const SizedBox(height: 12),
              ],
              Wrap(
                spacing: 8,
                children: [
                  if (wikipedia.wikipediaEnglish != null)
                    link(
                      wikipedia.wikipediaEnglish!,
                      "Wikipedia English",
                      "EN",
                    ),
                  if (wikipedia.wikipediaJapanese != null)
                    link(
                      wikipedia.wikipediaJapanese!,
                      "Wikipedia Japanese",
                      "JP",
                    ),
                  if (wikipedia.dbpedia != null)
                    link(wikipedia.dbpedia!, "DBpedia", "DB"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
