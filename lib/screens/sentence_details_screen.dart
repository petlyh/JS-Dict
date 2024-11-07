import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/copyable_furigana_text.dart";
import "package:jsdict/widgets/copyright_text.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/link_popup.dart";

class SentenceDetailsScreen extends StatelessWidget {
  const SentenceDetailsScreen({required Sentence this.sentence}) : id = null;
  const SentenceDetailsScreen.id({required String this.id}) : sentence = null;

  final Sentence? sentence;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final sentenceId = sentence?.id ?? id;

    return Scaffold(
      appBar: AppBar(
        title: Text(sentenceId == null ? "Example Sentence" : "Sentence"),
        actions: [
          if (sentenceId case final sentenceId?)
            LinkPopupButton([
              ("Open in Browser", "https://jisho.org/sentences/$sentenceId"),
            ]),
        ],
      ),
      body: id == null
          ? _SentenceDetails(sentence: sentence!)
          : FutureLoader(
              onLoad: () => getClient().sentenceDetails(id!),
              handler: (data) => _SentenceDetails(sentence: data),
            ),
    );
  }
}

class _SentenceDetails extends StatelessWidget {
  const _SentenceDetails({required this.sentence});

  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CopyableFuriganaText(
                    furigana: sentence.japanese,
                    style: const TextStyle(fontSize: 18).jp(),
                    rubyAlign: CrossAxisAlignment.start,
                    wrapAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  SelectableText(
                    sentence.english,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  if (sentence.copyright case final copyright?)
                    CopyrightText(copyright: copyright),
                ],
              ),
            ),
            if (sentence.kanji case final kanji?)
              KanjiItemList(items: kanji)
            else
              FutureLoader(
                onLoad: () => getClient().search<Kanji>(sentence.japanese.text),
                handler: (response) => KanjiItemList(items: response.results),
              ),
          ],
        ),
      ),
    );
  }
}
