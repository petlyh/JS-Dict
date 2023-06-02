import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/widgets/info_chip.dart';

class InfoChipList extends StatelessWidget {
  InfoChipList(this.entries, {super.key}) : coloredEntries = [];
  InfoChipList.color(this.coloredEntries, {super.key}) : entries = [];

  final List<String?> entries;
  final List<(String?, Color?)> coloredEntries;

  @override
  Widget build(BuildContext context) {
    final children = coloredEntries.isNotEmpty
        ? coloredEntries
            .where((entry) => entry.$1 != null)
            .map((entry) => InfoChip(entry.$1!, color: entry.$2))
            .toList()
        : entries.whereNotNull().map((entry) => InfoChip(entry)).toList();

    return Wrap(
      alignment: WrapAlignment.center,
      children: children,
    );
  }
}
