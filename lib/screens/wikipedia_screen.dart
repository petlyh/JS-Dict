import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/loader.dart";
import "package:url_launcher/url_launcher.dart";

class WikipediaScreen extends StatelessWidget {
  const WikipediaScreen(WikipediaDefinition this.definition, {super.key})
      : wordId = null;
  const WikipediaScreen.fromWord(String this.wordId, {super.key})
      : definition = null;

  final WikipediaDefinition? definition;
  final String? wordId;

  Future<WikipediaDefinition> _getDefinition() async {
    if (definition == null) {
      final word = await getClient().wordDetails(wordId!);

      /// assumes that the word has a Wikipedia definition
      return word.wikipedia!;
    }

    return definition!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wikipedia"),
      ),
      body: LoaderWidget(
          onLoad: _getDefinition,
          handler: (definition) {
            return SingleChildScrollView(
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
                      _link(
                          definition.wikipediaJapanese!, "Wikipedia Japanese"),
                    if (definition.dbpedia != null)
                      _link(definition.dbpedia!, "DBpedia"),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _link(WikipediaPage page, String wikiName) => ElevatedButton(
        child: Text(wikiName),
        onPressed: () {
          launchUrl(
              Uri.parse(page.url.replaceFirst(RegExp(r"[\?&]oldid=\d+"), "")),
              mode: LaunchMode.externalApplication);
        },
      );
}
