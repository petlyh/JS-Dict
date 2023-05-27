import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/copyright_text.dart';
import 'package:jsdict/widgets/items/kanji.dart';
import 'package:jsdict/widgets/loader.dart';
import 'package:ruby_text/ruby_text.dart';

class SentenceDetailsScreen extends StatelessWidget {
  const SentenceDetailsScreen(this.sentenceId, {super.key});

  final String sentenceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sentence Details")),
      body: LoaderWidget(
        future: getClient().sentenceDetails(sentenceId),
        handler: (sentence) {
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
                        RubyText(sentence.japanese.toRubyData(), style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        Text(sentence.english, style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        CopyrightText(sentence.copyright!),
                      ],
                    )
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sentence.kanji.length,
                    itemBuilder: (_, index) => KanjiItem(kanji: sentence.kanji[index])
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}