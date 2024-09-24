import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/inflection.dart";
import "package:jsdict/models/models.dart";
import "package:ruby_text/ruby_text.dart";

class InflectionTable extends StatelessWidget {
  const InflectionTable(this.data, {super.key});

  final InflectionData data;

  Widget _headerCell([String? text]) => _cell(
      Text(text ?? "", style: const TextStyle(fontWeight: FontWeight.w500)));

  Widget _furiganaCell(Furigana furigana) => _cell(
        furigana.hasFurigana
            ? RubyText(furigana.rubyData, wrapAlign: TextAlign.start)
            : Text(furigana.text,
                style: jpTextStyle, textAlign: TextAlign.start),
      );

  Widget _cell(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(
            width: 0.4,
            color: Theme.of(context).dividerColor,
          ),
        ),
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            _headerCell(),
            _headerCell("Affermative"),
            _headerCell("Negative"),
          ]),
          ...data.toMap().entries.map((entry) => TableRow(children: [
                _headerCell(entry.key),
                _furiganaCell(entry.value.affermative),
                _furiganaCell(entry.value.negative),
              ])),
        ],
      ),
    );
  }
}
