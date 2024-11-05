import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";

class InfoChip extends StatelessWidget {
  const InfoChip(this.text, {super.key, this.color, this.onTap, this.icon});

  final String text;
  final Color? color;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(48),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 16),
                    const SizedBox(width: 2),
                    JpText(text),
                  ],
                )
              : JpText(text),
        ),
      ),
    );
  }
}
