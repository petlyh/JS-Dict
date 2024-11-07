import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/widgets/link_span.dart";
import "package:url_launcher/url_launcher.dart";

class CopyrightText extends StatelessWidget {
  const CopyrightText({required this.copyright});

  final SentenceCopyright copyright;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "— ", style: TextStyle(color: textColor)),
          LinkSpan(
            context: context,
            text: copyright.name,
            underline: false,
            onTap: () {
              launchUrl(
                Uri.parse(copyright.url),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
      ),
    );
  }
}
