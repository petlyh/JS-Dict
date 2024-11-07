import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/rounded_bottom_border.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/link_span.dart";

class DefinitionTile extends StatelessWidget {
  const DefinitionTile(
    this.definition, {
    this.textColor,
    this.isLast = false,
  });

  final Definition definition;
  final Color? textColor;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      trailing: definition.exampleSentence != null
          ? const Icon(Icons.keyboard_arrow_right)
          : null,
      shape: isLast ? RoundedBottomBorder() : null,
      onTap: definition.exampleSentence != null
          ? pushScreen(
              context,
              SentenceDetailsScreen(definition.exampleSentence!),
            )
          : null,
      title: Text(definition.meanings.join("; ")),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(definition.types.join(", ")),
          if (definition.tags.isNotEmpty) JpText(definition.tags.join(", ")),
          if (definition.seeAlso.isNotEmpty)
            seeAlsoText(context, definition.seeAlso),
        ],
      ),
    );
  }

  Widget seeAlsoText(BuildContext context, List<String> words) {
    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(text: "See also ", style: TextStyle(color: textColor)),
          ...words
              .map(
                (word) => LinkSpan(
                  context,
                  // remove reading
                  text: word.split(" ").first,
                  onTap: pushScreen(
                    context,
                    WordDetailsScreen.search(word),
                  ),
                ),
              )
              .toList()
              .intersperce(
                TextSpan(text: ", ", style: TextStyle(color: textColor)),
              ),
        ],
      ),
    );
  }
}
