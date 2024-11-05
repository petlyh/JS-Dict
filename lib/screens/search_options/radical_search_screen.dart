import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/radical_search/radical_search.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search_options/search_options_screen.dart";

class RadicalSearchScreen extends SearchOptionsScreen {
  const RadicalSearchScreen({super.key}) : super(body: const _RadicalSearch());
}

class _RadicalSearch extends HookWidget {
  const _RadicalSearch();

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);

    final selectedRadicals = useState(<String>[]);

    final matchingKanji = selectedRadicals.value.isNotEmpty
        ? kanjiByRadicals(selectedRadicals.value)
        : <String>[];

    return Column(
      children: [
        Expanded(
          child: _KanjiSelection(
            matches: matchingKanji,
            onSelect: (kanji) {
              selectedRadicals.value = [];
              queryProvider.insertText(kanji);
            },
            onReset: () => selectedRadicals.value = [],
          ),
        ),
        const Divider(height: 0),
        Expanded(
          flex: 3,
          child: _RadicalSelection(
            selected: selectedRadicals.value,
            valid: matchingKanji.isNotEmpty
                ? findValidRadicals(matchingKanji)
                : [],
            onSelect: (radical) => selectedRadicals.value = [
              ...selectedRadicals.value,
              radical,
            ],
            onDeselect: (radical) => selectedRadicals.value =
                selectedRadicals.value.where((r) => r != radical).toList(),
          ),
        ),
      ],
    );
  }
}

class _RadicalSelection extends StatelessWidget {
  const _RadicalSelection({
    required this.selected,
    required this.valid,
    required this.onSelect,
    required this.onDeselect,
  });

  final List<String> selected;
  final List<String> valid;

  final Function(String radical) onSelect;
  final Function(String radical) onDeselect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textColor = theme.textTheme.bodyLarge?.color;
    final selectedColor = theme.colorScheme.surfaceContainerHighest;
    final disabledColor = theme.focusColor;

    return SingleChildScrollView(
      child: Center(
        child: Wrap(
          children: radicalsByStrokeCount.entries
              .map(
                (entry) => [
                  _CustomButton(
                    entry.key.toString(),
                    backgroundColor: theme.highlightColor,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                    padding: 3,
                  ),
                  ...entry.value.map((radical) {
                    final isSelected = selected.contains(radical);
                    final isValid = valid.isEmpty || valid.contains(radical);

                    return _CustomButton(
                      radical,
                      onPressed: isSelected
                          ? () => onDeselect(radical)
                          : isValid
                              ? () => onSelect(radical)
                              : null,
                      backgroundColor: isSelected ? selectedColor : null,
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: isValid ? textColor : disabledColor,
                      ),
                    );
                  }),
                ],
              )
              .flattened
              .toList(),
        ),
      ),
    );
  }
}

class _KanjiSelection extends StatelessWidget {
  const _KanjiSelection({
    required this.matches,
    required this.onSelect,
    required this.onReset,
  });

  final List<String> matches;
  final Function(String kanji) onSelect;
  final Function() onReset;

  static const displayLimit = 100;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge!.color;
    final backgroundColor = theme.colorScheme.surfaceContainerHighest;

    return matches.isEmpty
        ? const Center(child: Text("Select radicals"))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
                    _CustomButton.icon(
                      Icons.refresh,
                      iconSize: 20,
                      iconColor: textColor,
                      onPressed: onReset,
                    ),
                    ...matches.take(displayLimit).map(
                          (kanji) => _CustomButton(
                            kanji,
                            onPressed: () => onSelect(kanji),
                            backgroundColor: backgroundColor,
                            textStyle:
                                TextStyle(fontSize: 20, color: textColor),
                            padding: 1.5,
                          ),
                        ),
                  ],
                ),
              ),
            ),
          );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(
    this.text, {
    this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.padding = 0,
  })  : iconData = null,
        iconColor = null,
        iconSize = 0;

  const _CustomButton.icon(
    this.iconData, {
    this.onPressed,
    this.iconSize = 16,
    this.iconColor,
  })  : text = "",
        textStyle = null,
        backgroundColor = null,
        padding = 0;

  final Function()? onPressed;
  final Color? backgroundColor;
  final double padding;

  final String text;
  final TextStyle? textStyle;

  final IconData? iconData;
  final double iconSize;
  final Color? iconColor;

  static const _size = 32;
  double get size => _size - (padding * 2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          fixedSize: Size(size, size),
          minimumSize: Size.zero,
        ),
        child: iconData != null
            ? Icon(iconData, size: iconSize, color: iconColor)
            : JpText(text, style: textStyle),
      ),
    );
  }
}
