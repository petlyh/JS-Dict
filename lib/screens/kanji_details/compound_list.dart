import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/packages/intersperce.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";

class CompoundList extends StatelessWidget {
  const CompoundList(this.type, this.compounds, {super.key});

  final String type;
  final List<Compound> compounds;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text("$type reading compounds"),
      children: intersperce(
        compounds.map((compound) => ListTile(
          title: Text("${compound.compound} 【${compound.reading}】"),
          subtitle: Text(compound.meanings.join(", ")),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  WordDetailsScreen(compound.compound, search: true))),
        )).toList(),
        const Divider(),
      ),
    );
  }
}
