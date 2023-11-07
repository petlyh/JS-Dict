import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/wikipedia_screen.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/loader.dart";

class NameDetailsScreen extends StatelessWidget {
  const NameDetailsScreen(this.name, {super.key});

  final Name name;

  Future<List<Kanji>> _getKanji() async {
    if (name.reading == null) {
      return [];
    }

    final response = await getClient().search<Kanji>(name.japanese);
    return response.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Name")),
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
              InfoChip(name.type),
              const SizedBox(height: 12),
              if (name.wikipediaWord != null)
                ElevatedButton(
                    onPressed: pushScreen(
                        context, WikipediaScreen.fromWord(name.wikipediaWord!)),
                    child: const Text("Wikipedia")),
              const SizedBox(height: 16),
              LoaderWidget(
                  onLoad: _getKanji,
                  handler: (kanjiList) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: kanjiList.length,
                      itemBuilder: (_, index) =>
                          KanjiItem(kanji: kanjiList[index]))),
            ],
          ),
        ),
      ),
    );
  }
}
