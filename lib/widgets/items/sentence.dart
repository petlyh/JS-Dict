import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:ruby_text/ruby_text.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SentenceItem extends StatelessWidget {
  const SentenceItem({super.key, required this.sentence});

  final Sentence sentence;

  @override
  Widget build(BuildContext context) {
    final List<Widget> subtitleWidgets = [Text(sentence.english)];

    if (sentence.copyright != null) {
      final copyright = sentence.copyright!;

      final copyrightWidget = RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: '— ', style: TextStyle(color: Colors.black)),
            TextSpan(
              text: copyright.name,
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = () {
                launchUrlString(copyright.url, mode: LaunchMode.externalApplication);
              },
            ),
          ],
        )
      );

      subtitleWidgets.add(copyrightWidget);
    }

    return Card(
      child: ListTile(
        onTap: () => {},
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        title: RubyText(sentence.japanese.toRubyData()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: subtitleWidgets
        )
      )
    );
  }
}