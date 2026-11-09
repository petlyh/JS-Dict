import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/furigana_ruby.dart";
import "package:ruby_text/ruby_text.dart";

class InfoChip extends StatelessWidget {
  const InfoChip(this.text, {this.color, this.onTap, this.icon})
      : furigana = null;

  const InfoChip.furigana(Furigana this.furigana,
      {this.color, this.onTap, this.icon})
      : text = null;

  final String? text;
  final Furigana? furigana;
  final Color? color;
  final void Function()? onTap;
  final IconData? icon;

  Widget get _label => furigana != null
      ? RubyText(
          furigana!.rubyData,
          style: jpTextStyle,
          rubyStyle: const TextStyle(fontSize: 10).jp(),
        )
      : JpText(text!);

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
                    _label,
                  ],
                )
              : _label,
        ),
      ),
    );
  }
}
