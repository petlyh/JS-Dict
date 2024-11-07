import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/screens/name_details_screen.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:jsdict/widgets/items/item_card.dart";

class NameItem extends StatelessWidget {
  const NameItem({required this.name});

  final Name name;

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      onTap: pushScreen(context, NameDetailsScreen(name: name)),
      onLongPress: () => showActionDialog(context, [
        if (name.wordId case final wordId?)
          ActionTile.url(
            url: "https://jisho.org/word/${Uri.encodeComponent(wordId)}",
          ),
        ActionTile.text(name: "Name", text: name.japanese),
        if (name.reading case final reading?)
          ActionTile.text(name: "Reading", text: reading),
        ActionTile.text(name: "English", text: name.english),
      ]),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
        title: JpText(
          name.reading != null
              ? "${name.japanese}【${name.reading}】"
              : name.japanese,
        ),
        subtitle: Text(name.english),
      ),
    );
  }
}
