import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:url_launcher/url_launcher.dart";

class CopyrightText extends StatelessWidget {
  const CopyrightText(this.copyright, {super.key});

  final SentenceCopyright copyright;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final linkColor = Theme.of(context).colorScheme.primary;

    return RichText(
        text: TextSpan(
      children: [
        TextSpan(text: "— ", style: TextStyle(color: textColor)),
        TextSpan(
          text: copyright.name,
          style: TextStyle(color: linkColor),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse(copyright.url),
                  mode: LaunchMode.externalApplication);
            },
        ),
      ],
    ));
  }
}
