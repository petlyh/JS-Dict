import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/packages/radical_search/radical_search.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search_options/search_options_screen.dart";

class RadicalSearchScreen extends SearchOptionsScreen {
  const RadicalSearchScreen({super.key}) : super(body: const _RadicalSearch());
}

class _RadicalSearch extends StatefulWidget {
  const _RadicalSearch();

  @override
  State<_RadicalSearch> createState() => _RadicalSearchState();
}

class _RadicalSearchState extends State<_RadicalSearch> {
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
    final queryProvider = QueryProvider.of(context);

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _KanjiSelection(
            matchingKanji,
            onSelect: (kanji) {
              reset();
              queryProvider.insertText(kanji);
            },
            onReset: reset,
          ),
        ),
        const Divider(height: 0),
        Expanded(
          flex: 3,
          child: _RadicalSelection(
              selectedRadicals, validRadicals, selectRadical, deselectRadical),
        ),
      ],
    );
  }
}

class _RadicalSelection extends StatelessWidget {
  const _RadicalSelection(this.selectedRadicals, this.validRadicals,
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
          children: List<Widget>.from(RadicalSearch.radicalsByStrokes.keys
              .map((strokeCount) => [
                    _CustomButton(
                      strokeCount.toString(),
                      backgroundColor: strokeIndicatorColor,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                      padding: 3,
                    ),
                    ...RadicalSearch.radicalsByStrokes[strokeCount]!
                        .map((radical) {
                      final isSelected = selectedRadicals.contains(radical);
                      final isValid = validRadicals.isEmpty ||
                          validRadicals.contains(radical);

                      return _CustomButton(
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
                    }),
                  ])
              .flattened),
        ),
      ),
    );
  }
}

class _KanjiSelection extends StatelessWidget {
  const _KanjiSelection(this.matchingKanji,
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
                    _CustomButton.icon(
                      Icons.refresh,
                      iconSize: 20,
                      iconColor: textColor,
                      onPressed: onReset,
                    ),
                    ...matchingKanji
                        .take(displayLimit)
                        .map((kanji) => _CustomButton(
                              kanji,
                              onPressed: () => onSelect(kanji),
                              backgroundColor: backgroundColor,
                              textStyle:
                                  TextStyle(fontSize: 20, color: textColor),
                              padding: 1.5,
                            )),
                  ],
                ),
              ),
            ),
          );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(this.text,
      {this.onPressed, this.textStyle, this.backgroundColor, this.padding = 0})
      : iconData = null,
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
  final double size = 32;
  final double padding;

  final String text;
  final TextStyle? textStyle;

  final IconData? iconData;
  final double iconSize;
  final Color? iconColor;

  double get _size => size - (padding * 2);

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
          fixedSize: Size(_size, _size),
          minimumSize: const Size(0, 0),
        ),
        child: iconData != null
            ? Icon(iconData, size: iconSize, color: iconColor)
            : JpText(text, style: textStyle),
      ),
    );
  }
}
