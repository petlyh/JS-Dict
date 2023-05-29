import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  const InfoChip(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  Color _textColorFromBackground(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          text,
          style: color == null ? null : TextStyle(color: _textColorFromBackground(color!)),
        ),
      )
    );
  }
}