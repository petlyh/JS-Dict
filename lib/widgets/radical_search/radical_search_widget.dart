import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'radical_search_button.dart';
import 'radical_search.dart';

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
    final newMatchingKanji = searchKanjiByRadicals(selectedRadicals);
    final newValidRadicals = getValidRadicals(newMatchingKanji);

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
          child: _KanjiSelectionWidget(
            matchingKanji,
            onSelect: (kanji) {
              reset();
              widget.onKanjiSelect(kanji);
            },
            onReset: reset,
          ),
        ),
        const Divider(),
        Expanded(
          flex: 3,
          child: _RadicalSelectionWidget(
              selectedRadicals, validRadicals, selectRadical, deselectRadical),
        ),
      ],
    );
  }
}

class _KanjiSelectionWidget extends StatelessWidget {
  const _KanjiSelectionWidget(this.matchingKanji,
      {required this.onSelect, required this.onReset});

  final List<String> matchingKanji;
  final Function(String) onSelect;
  final Function() onReset;

  static const displayLimit = 100;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final backgroundColor = Theme.of(context).colorScheme.surfaceVariant;

    return matchingKanji.isEmpty
        ? const Center(child: Text("Select radicals"))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
                    RadicalSearchButton.icon(
                      Icons.refresh,
                      iconSize: 20,
                      iconColor: textColor,
                      onPressed: onReset,
                    ),
                    ...matchingKanji
                        .take(displayLimit)
                        .map((kanji) => RadicalSearchButton(
                              kanji,
                              onPressed: () => onSelect(kanji),
                              backgroundColor: backgroundColor,
                              textStyle:
                                  TextStyle(fontSize: 20, color: textColor),
                              padding: 1.5,
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          );
  }
}

class _RadicalSelectionWidget extends StatelessWidget {
  const _RadicalSelectionWidget(this.selectedRadicals, this.validRadicals,
      this.onSelect, this.onDeselect);

  final List<String> selectedRadicals;
  final List<String> validRadicals;

  final Function(String) onSelect;
  final Function(String) onDeselect;

  @override
  Widget build(BuildContext context) {
    final strokeIndicatorColor = Theme.of(context).highlightColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final selectedColor = Theme.of(context).colorScheme.surfaceVariant;
    final disabledColor = Theme.of(context).focusColor;

    return SingleChildScrollView(
      child: Center(
        child: Wrap(
          children: List<Widget>.from(radicalList.keys
              .map((strokeCount) => [
                    RadicalSearchButton(
                      strokeCount.toString(),
                      backgroundColor: strokeIndicatorColor,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                      padding: 3,
                    ),
                    ...radicalList[strokeCount]!.map((radical) {
                      final isSelected = selectedRadicals.contains(radical);
                      final isValid = validRadicals.isEmpty ||
                          validRadicals.contains(radical);

                      return RadicalSearchButton(
                        radical,
                        onPressed: isSelected
                            ? () => onDeselect(radical)
                            : !isValid
                                ? null
                                : () => onSelect(radical),
                        backgroundColor: isSelected ? selectedColor : null,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: isValid ? textColor : disabledColor),
                      );
                    }).toList(),
                  ])
              .flattened),
        ),
      ),
    );
  }
}
