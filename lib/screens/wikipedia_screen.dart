import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:url_launcher/url_launcher.dart";

class WikipediaScreen extends StatelessWidget {
  const WikipediaScreen(this.definition, {super.key});

  final WikipediaDefinition definition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wikipedia"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(definition.name, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              if (definition.textAbstract != null) ...[
                Text(definition.textAbstract!),
                const SizedBox(height: 16),
              ],
              if (definition.wikipediaEnglish != null)
                _link(definition.wikipediaEnglish!, "Wikipedia English"),
              if (definition.wikipediaJapanese != null)
                _link(definition.wikipediaJapanese!, "Wikipedia Japanese"),
              if (definition.dbpedia != null)
                _link(definition.dbpedia!, "DBpedia"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _link(WikipediaPage page, String wikiName) => ElevatedButton(
    child: Text(wikiName),
    onPressed: () {
      launchUrl(Uri.parse(page.url), mode: LaunchMode.externalApplication);
    },
  );
}