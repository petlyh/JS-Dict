import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/intersperce.dart';
import 'package:jsdict/models.dart';

class CompoundList extends StatelessWidget {
  const CompoundList(this.type, this.compounds, {super.key});

  final String type;
  final List<Compound> compounds;

  @override
  Widget build(BuildContext context) {
    final itemList = List<Widget>.from(compounds.map((compound) => ListTile(
      title: Text("${compound.compound} 【${compound.reading}】"),
      subtitle: Text(compound.meanings.join(", ")),
      // contentPadding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
    )));

    return ExpansionTileCard(
      title: Text("$type reading compounds"),
      children: intersperce(itemList, const Divider()),
    );
  }
}