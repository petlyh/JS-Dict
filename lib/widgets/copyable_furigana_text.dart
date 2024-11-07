import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/furigana_ruby.dart";
import "package:jsdict/widgets/action_dialog.dart";
import "package:ruby_text/ruby_text.dart";

class CopyableFuriganaText extends StatelessWidget {
  const CopyableFuriganaText(
    this.furigana, {
    this.spacing = 0.0,
    this.style,
    this.rubyStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.rubyAlign,
    this.wrapAlign,
  });

  final Furigana furigana;
  final double spacing;
  final TextStyle? style;
  final TextStyle? rubyStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final CrossAxisAlignment? rubyAlign;
  final TextAlign? wrapAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showActionDialog(context, [
        ActionTile.text("Text", furigana.text),
        if (furigana.hasFurigana) ActionTile.text("Reading", furigana.reading),
      ]),
      child: RubyText(
        furigana.rubyData,
        spacing: spacing,
        style: style?.merge(jpTextStyle) ?? jpTextStyle,
        rubyStyle: rubyStyle?.merge(jpTextStyle) ?? jpTextStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        rubyAlign: rubyAlign,
        wrapAlign: wrapAlign,
      ),
    );
  }
}
