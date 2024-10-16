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
  const SentenceDetailsScreen(Sentence this.sentence, {super.key})
      : sentenceId = null;
  const SentenceDetailsScreen.id(String this.sentenceId, {super.key})
      : sentence = null;

  final Sentence? sentence;
  final String? sentenceId;

  String? get _id => sentence?.id ?? sentenceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id == null ? "Example Sentence" : "Sentence"),
        actions: [
          if (_id != null)
            LinkPopupButton([
              ("Open in Browser", "https://jisho.org/sentences/$_id"),
            ]),
        ],
      ),
      body: sentenceId == null
          ? _SentenceDetails(sentence!)
          : FutureLoader(
              onLoad: () => getClient().sentenceDetails(sentenceId!),
              handler: _SentenceDetails.new,
            ),
    );
  }
}

class _SentenceDetails extends StatelessWidget {
  const _SentenceDetails(this.sentence);

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
                    sentence.japanese,
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
                  if (sentence.copyright != null)
                    CopyrightText(sentence.copyright!),
                ],
              ),
            ),
            if (sentence.kanji != null)
              KanjiItemList(sentence.kanji!)
            else
              FutureLoader(
                onLoad: () => getClient().search<Kanji>(sentence.japanese.text),
                handler: (response) => KanjiItemList(response.results),
              ),
          ],
        ),
      ),
    );
  }
}
