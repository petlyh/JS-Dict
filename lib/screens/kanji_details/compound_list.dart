import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/katakana_convert.dart";
import "package:jsdict/packages/list_extensions.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/entry_tile.dart";

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
          .map((compound) => EntryTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                isLast: compound == compounds.last,
                title: JpText("${compound.compound} 【${compound.reading}】"),
                subtitle: Text(compound.meanings.join(", ")),
                onTap: pushScreen(
                    context,
                    WordDetailsScreen.search(
                        "${compound.compound} ${convertKatakana(compound.reading)}")),
              ))
          .toList()
          .intersperce(const Divider(height: 0)),
    );
  }
}
