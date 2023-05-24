import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText(this.copyright, {super.key});

  final SentenceCopyright copyright;

  @override
  Widget build(BuildContext context) {
    return RichText(
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
  }
}