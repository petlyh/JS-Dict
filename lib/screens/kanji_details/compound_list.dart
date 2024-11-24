import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:fpdart/fpdart.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/katakana_convert.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/rounded_bottom_border.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";

class CompoundList extends StatelessWidget {
  const CompoundList({required this.type, required this.compounds});

  final String type;
  final List<Compound> compounds;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      shadowColor: Theme.of(context).colorScheme.shadow,
      title: Text("$type reading compounds"),
      children: compounds
          .map<Widget>(
            (compound) => ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              shape: compound == compounds.last ? RoundedBottomBorder() : null,
              title: JpText("${compound.compound} 【${compound.reading}】"),
              subtitle: Text(compound.meanings.join(", ")),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: pushScreen(
                context,
                WordDetailsScreen.search(
                  query:
                      "${compound.compound} ${convertKatakana(compound.reading)}",
                ),
              ),
            ),
          )
          .intersperse(const Divider(height: 0))
          .toList(),
    );
  }
}
