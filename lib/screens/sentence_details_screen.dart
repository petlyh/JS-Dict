import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/widgets/link_popup.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/copyright_text.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/loader.dart";
import "package:ruby_text/ruby_text.dart";

class SentenceDetailsScreen extends StatelessWidget {
  const SentenceDetailsScreen(this.sentence, {super.key});

  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sentence.isExample ? "Example Sentence" : "Sentence"),
        actions: [
          if (!sentence.isExample)
            LinkPopupButton([
              ("Open in Browser", "https://jisho.org/sentences/${sentence.id}"),
            ]),
        ],
      ),
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
                      RubyText(sentence.japanese.toRubyData(),
                          style: const TextStyle(fontSize: 18).jp(),
                          rubyAlign: CrossAxisAlignment.start,
                          wrapAlign: TextAlign.start),
                      const SizedBox(height: 20),
                      Text(sentence.english,
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 20),
                      if (!sentence.isExample)
                        CopyrightText(sentence.copyright!),
                    ],
                  )),
              LoaderWidget(
                  onLoad: () =>
                      getClient().search<Kanji>(sentence.japanese.getText()),
                  handler: (kanjiSearchResponse) {
                    final kanjiList = kanjiSearchResponse.results;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: kanjiList.length,
                        itemBuilder: (_, index) =>
                            KanjiItem(kanji: kanjiList[index]));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
