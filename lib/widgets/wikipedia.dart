import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:url_launcher/url_launcher.dart";

class WikipediaWidget extends StatelessWidget {
  const WikipediaWidget(this.wikipedia, {super.key});

  final WikipediaInfo wikipedia;

  Widget _createButton(WikipediaPage page, String wikiName, String id) =>
      Tooltip(
        message: wikiName,
        child: ElevatedButton(
          child: Text(id),
          onPressed: () => launchUrl(
            Uri.parse(page.url),
            mode: LaunchMode.externalApplication,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      shadowColor: Theme.of(context).colorScheme.shadow,
      title: const Text("Wikipedia"),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              SelectableText(wikipedia.textAbstract),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  if (wikipedia.wikipediaEnglish != null)
                    _createButton(
                      wikipedia.wikipediaEnglish!,
                      "Wikipedia English",
                      "EN",
                    ),
                  if (wikipedia.wikipediaJapanese != null)
                    _createButton(
                      wikipedia.wikipediaJapanese!,
                      "Wikipedia Japanese",
                      "JP",
                    ),
                  if (wikipedia.dbpedia != null)
                    _createButton(wikipedia.dbpedia!, "DBpedia", "DB"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
