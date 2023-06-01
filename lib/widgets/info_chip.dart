import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  const InfoChip(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(text),
      )
    );
  }
}