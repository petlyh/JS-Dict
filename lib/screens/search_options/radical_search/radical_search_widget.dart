import "package:flutter/material.dart";
import "package:jsdict/packages/radical_search/radical_search.dart";

import "kanji_selection.dart";
import "radical_selection.dart";

class RadicalSearchWidget extends StatefulWidget {
  const RadicalSearchWidget({super.key, required this.onKanjiSelect});

  final Function(String) onKanjiSelect;

  @override
  State<RadicalSearchWidget> createState() => _RadicalSearchWidgetState();
}

class _RadicalSearchWidgetState extends State<RadicalSearchWidget> {
  List<String> matchingKanji = [];
  List<String> selectedRadicals = [];
  List<String> validRadicals = [];

  void reset() {
    setState(() {
      matchingKanji = [];
      selectedRadicals = [];
      validRadicals = [];
    });
  }

  void selectRadical(String radical) {
    final newSelectedRadicals = selectedRadicals;
    newSelectedRadicals.add(radical);
    _update(newSelectedRadicals);
  }

  void deselectRadical(String radical) {
    final newSelectedRadicals = selectedRadicals;
    newSelectedRadicals.remove(radical);

    if (newSelectedRadicals.isEmpty) {
      reset();
      return;
    }

    _update(newSelectedRadicals);
  }

  void _update(List<String> newSelectedRadicals) {
    final newMatchingKanji = RadicalSearch.kanjiByRadicals(selectedRadicals);
    final newValidRadicals = RadicalSearch.validRadicals(newMatchingKanji);

    setState(() {
      selectedRadicals = newSelectedRadicals;
      matchingKanji = newMatchingKanji;
      validRadicals = newValidRadicals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: KanjiSelectionWidget(
            matchingKanji,
            onSelect: (kanji) {
              reset();
              widget.onKanjiSelect(kanji);
            },
            onReset: reset,
          ),
        ),
        const Divider(height: 0),
        Expanded(
          flex: 3,
          child: RadicalSelectionWidget(
              selectedRadicals, validRadicals, selectRadical, deselectRadical),
        ),
      ],
    );
  }
}
