import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:url_launcher/url_launcher.dart";

class WikipediaCard extends StatelessWidget {
  const WikipediaCard({required this.info});

  final WikipediaInfo info;

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
              SelectableText(info.textAbstract),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  if (info.wikipediaEnglish case final english?)
                    _createButton(english, "Wikipedia English", "EN"),
                  if (info.wikipediaJapanese case final japanese?)
                    _createButton(japanese, "Wikipedia Japanese", "JP"),
                  if (info.dbpedia case final dbpedia?)
                    _createButton(dbpedia, "DBpedia", "DB"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
