import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/inflection/inflection.dart";
import "package:jsdict/models/models.dart";
import "package:ruby_text/ruby_text.dart";

class InflectionTable extends StatelessWidget {
  const InflectionTable(this.inflectionType, {super.key});

  final InflectionType inflectionType;

  static const _headerRow = [
    TableRow(children: [
      _HeaderCell(""),
      _HeaderCell("Affermative"),
      _HeaderCell("Negative"),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    final rows = _headerRow + _getRows();

    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(width: 0.5),
        // verticalInside: BorderSide(width: 0.5),
      ),
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: rows,
    );
  }

  List<TableRow> _getRows() {
    if (inflectionType is Verb) {
      final verb = (inflectionType as Verb);

      return [
        _row("Non-past", verb.nonPastFurigana),
        _row("Non-past, polite", verb.nonPastPoliteFurigana),
        _row("Past", verb.pastFurigana),
        _row("Past, polite", verb.pastPoliteFurigana),
        _row("Te-form", verb.teFormFurigana),
        _row("Potential", verb.potentialFurigana),
        _row("Passive", verb.passiveFurigana),
        _row("Causative", verb.causativeFurigana),
        _row("Causative Passive", verb.causativePassiveFurigana),
        _row("Imperative", verb.imperativeFurigana),
      ];
    }

    return [
      _row("Non-past", inflectionType.nonPastFurigana),
      _row("Past", inflectionType.pastFurigana),
    ];
  }
}

const EdgeInsetsGeometry _cellPadding =
    EdgeInsets.symmetric(vertical: 8, horizontal: 10);

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _cellPadding,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}

class _FuriganaCell extends StatelessWidget {
  const _FuriganaCell(this.furigana);

  final Furigana furigana;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _cellPadding,
      child: RubyText(furigana.rubyData, style: jpTextStyle),
    );
  }
}

TableRow _row(String name, Furigana Function(bool) function) {
  return TableRow(children: [
    _HeaderCell(name),
    _FuriganaCell(function(true)),
    _FuriganaCell(function(false)),
  ]);
}
