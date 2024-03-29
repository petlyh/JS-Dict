import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/name_details_screen.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/items/item_card.dart";

class NameItem extends StatelessWidget {
  const NameItem({super.key, required this.name});

  final Name name;

  @override
  Widget build(BuildContext context) {
    return ItemCard(
        onTap: pushScreen(context, NameDetailsScreen(name)),
        onLongPress: () => showActionDialog(context, [
              if (name.wikipediaWord != null)
                ...urlActionTiles(
                    "https://jisho.org/word/${Uri.encodeComponent(name.wikipediaWord!)}"),
              CopyActionTile("name", name.japanese),
              if (name.reading != null)
                CopyActionTile("reading", name.reading!),
              CopyActionTile("English", name.english),
            ]),
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
            title: JpText(name.toString()),
            subtitle: Text(name.english)));
  }
}
