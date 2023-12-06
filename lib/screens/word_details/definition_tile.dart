import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/entry_tile.dart";
import "package:jsdict/widgets/link_span.dart";

class DefinitionTile extends StatelessWidget {
  const DefinitionTile(this.definition,
      {super.key, this.textColor, this.isLast = false});

  final Definition definition;
  final Color? textColor;
  final bool isLast;

  bool get hasExampleSentence => definition.exampleSentence != null;

  Function()? onTap(BuildContext context) {
    if (hasExampleSentence) {
      return pushScreen(
          context, SentenceDetailsScreen(definition.exampleSentence!));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return EntryTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      isLast: isLast,
      onTap: onTap(context),
      title: SelectableText(definition.meanings.join("; ")),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(definition.types.join(", ")),
          if (definition.tags.isNotEmpty) JpText(definition.tags.join(", ")),
          if (definition.seeAlso.isNotEmpty)
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "See also ", style: TextStyle(color: textColor)),
              ...definition.seeAlso
                  .map((seeAlsoWord) => LinkSpan(
                        context,
                        // remove reading
                        text: seeAlsoWord.split(" ").first,
                        onTap: pushScreen(
                          context,
                          WordDetailsScreen.search(seeAlsoWord),
                        ),
                      ))
                  .toList()
                  .intersperce(
                      TextSpan(text: ", ", style: TextStyle(color: textColor))),
            ]))
        ],
      ),
    );
  }
}
