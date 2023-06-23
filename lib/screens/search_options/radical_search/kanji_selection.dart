import 'package:flutter/material.dart';

import 'custom_button.dart';

class KanjiSelectionWidget extends StatelessWidget {
  const KanjiSelectionWidget(this.matchingKanji,
      {super.key, required this.onSelect, required this.onReset});

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
                    CustomButton.icon(
                      Icons.refresh,
                      iconSize: 20,
                      iconColor: textColor,
                      onPressed: onReset,
                    ),
                    ...matchingKanji
                        .take(displayLimit)
                        .map((kanji) => CustomButton(
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