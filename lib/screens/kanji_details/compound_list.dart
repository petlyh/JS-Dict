import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/rounded_bottom_border.dart";

class CompoundList extends StatelessWidget {
  const CompoundList(this.type, this.compounds, {super.key});

  final String type;
  final List<Compound> compounds;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      shadowColor: Theme.of(context).colorScheme.shadow,
      title: Text("$type reading compounds"),
      children: compounds
          .map((compound) => ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                shape:
                    compound == compounds.last ? RoundedBottomBorder(8) : null,
                title: Text("${compound.compound} 【${compound.reading}】"),
                subtitle: Text(compound.meanings.join(", ")),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: pushScreen(context, WordDetailsScreen(compound.compound, search: true)),
              ))
          .toList()
          .intersperce(const Divider(height: 0)),
    );
  }
}
