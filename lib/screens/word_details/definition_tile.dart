import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/screens/wikipedia_screen.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/rounded_bottom_border.dart";

class DefinitionTile extends StatelessWidget {
  const DefinitionTile(this.definition, {super.key, this.textColor, this.isLast = false});

  final Definition definition;
  final Color? textColor;
  final bool isLast;

  bool get isWikipedia => definition.wikipedia != null;
  bool get hasExampleSentence => definition.exampleSentence != null;

  Function()? onTap(BuildContext context) {
    if (isWikipedia) {
      return screenPusher(context, WikipediaScreen(definition.wikipedia!));
    }

    if (hasExampleSentence) {
      return screenPusher(context, SentenceDetailsScreen(definition.exampleSentence!));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final linkColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      shape: isLast ? RoundedBottomBorder(8) : null,
      onTap: onTap(context),
      trailing: isWikipedia || hasExampleSentence
          ? const Icon(Icons.keyboard_arrow_right)
          : null,
      title: Text(definition.meanings.join("; ")),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(definition.types.join(", ")),
          if (definition.tags.isNotEmpty)
            Text(definition.tags.join(", ")),
          if (definition.seeAlso.isNotEmpty)
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "See also ", style: TextStyle(color: textColor)),
                ...definition.seeAlso
                  .map((seeAlsoWord) => TextSpan(
                        text: seeAlsoWord,
                        style: TextStyle(
                            color: linkColor,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = screenPusher(
                            context,
                            WordDetailsScreen(seeAlsoWord, search: true),
                          ),
                      ))
                  .toList()
                  .intersperce(
                      TextSpan(text: ", ", style: TextStyle(color: textColor))),
              ]
            ))
        ],
      ),
    );
  }
}