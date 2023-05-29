import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/widgets/info_chip.dart';

class InfoChipList extends StatelessWidget {
  const InfoChipList(this.entries, {super.key});

  final List<String?> entries;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: entries.whereNotNull().map((entry) => InfoChip(entry)).toList(),
    );
  }
}