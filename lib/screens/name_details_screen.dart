import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/loader.dart";

class NameDetailsScreen extends StatelessWidget {
  const NameDetailsScreen(this.name, {super.key});

  final Name name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Name")),
      body: LoaderWidget(
          onLoad: () => getClient().search<Kanji>(name.reading),
          handler: (response) {
            return SingleChildScrollView(
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
                                name.reading
                                    .replaceFirst("【", "\n")
                                    .replaceFirst("】", "")
                                    .split("\n")
                                    .reversed
                                    .join("\n"),
                                style: const TextStyle(fontSize: 20).jp(),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 16),
                            Text(name.name,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    const SizedBox(height: 20),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: response.results.length,
                        itemBuilder: (_, index) =>
                            KanjiItem(kanji: response.results[index]))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
