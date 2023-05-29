import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';

class ReadingCompoundsList extends StatelessWidget {
  const ReadingCompoundsList(this.type, this.readingCompounds, {super.key});

  final String type;
  final List<ReadingCompound> readingCompounds;

  @override
  Widget build(BuildContext context) {
    final itemList = List<Widget>.from(readingCompounds.map((compound) => ListTile(
      title: Text("${compound.compound} 【${compound.reading}】"),
      subtitle: Text(compound.meanings.join(", ")),
      // contentPadding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
    )));

    return ExpansionTileCard(
      title: Text("$type reading compounds"),
      children: intersperce<Widget>(itemList, const Divider()),
    );
  }

  List<T> intersperce<T>(List<T> list, T item) {
    if (list.length < 2) {
      return list;
    }
    
    final insertCount = list.length - 1;
    
    for (var i = 0; i < insertCount; i++) {
      list.insert(1 + i*2, item);
    }

    return list;
  }
}