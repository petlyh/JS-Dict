import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/intersperce.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/screens/details/word_details.dart';

class CompoundList extends StatelessWidget {
  const CompoundList(this.type, this.compounds, {super.key});

  final String type;
  final List<Compound> compounds;

  @override
  Widget build(BuildContext context) {
    final itemList = List<Widget>.from(compounds.map((compound) => ListTile(
      title: Text("${compound.compound} 【${compound.reading}】"),
      subtitle: Text(compound.meanings.join(", ")),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WordDetailsScreen(compound.compound, search: true))),
    )));

    return ExpansionTileCard(
      title: Text("$type reading compounds"),
      children: intersperce(itemList, const Divider()),
    );
  }
}