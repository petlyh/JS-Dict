import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/packages/radical_search/radical_search.dart';

import 'custom_button.dart';

class RadicalSelectionWidget extends StatelessWidget {
  const RadicalSelectionWidget(this.selectedRadicals, this.validRadicals,
      this.onSelect, this.onDeselect, {super.key});

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
          children: List<Widget>.from(RadicalSearch.radicalsByStrokes.keys
              .map((strokeCount) => [
                    CustomButton(
                      strokeCount.toString(),
                      backgroundColor: strokeIndicatorColor,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                      padding: 3,
                    ),
                    ...RadicalSearch.radicalsByStrokes[strokeCount]!.map((radical) {
                      final isSelected = selectedRadicals.contains(radical);
                      final isValid = validRadicals.isEmpty ||
                          validRadicals.contains(radical);

                      return CustomButton(
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
