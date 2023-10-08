import "package:collection/collection.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:jsdict/widgets/info_chips.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/items/name_item.dart";
import "package:jsdict/widgets/items/sentence_item.dart";
import "package:jsdict/widgets/items/word_item.dart";
import "package:provider/provider.dart";

class ResultPage<T extends SearchType> extends StatefulWidget {
  const ResultPage(this.query, {super.key});

  final String query;

  @override
  State<ResultPage<T>> createState() => _ResultPageState<T>();
}

class _ResultPageState<T extends SearchType> extends State<ResultPage<T>>
    with AutomaticKeepAliveClientMixin<ResultPage<T>> {
  @override
  final bool wantKeepAlive = true;

  final _pagingController = PagingController<int, T>(firstPageKey: 1);

  List<String> noMatchesFor = [];

  final zenInfo = ValueNotifier<ZenInfo?>(null);
  final correction = ValueNotifier<Correction?>(null);
  final grammarInfo = ValueNotifier<GrammarInfo?>(null);
  final conversion = ValueNotifier<Conversion?>(null);

  String get query => zenInfo.value?.selectedEntry ?? widget.query;

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  void _selectZenEntry(int index) {
    if (zenInfo.value == null) {
      return;
    }

    zenInfo.value = zenInfo.value!.withSelected(index);
    _pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    noMatchesFor = [];

    if (pageKey == 1) {
      correction.value = null;
      grammarInfo.value = null;
      conversion.value = null;
    }

    try {
      final cachedQuery = query;
      final response = await getClient().search<T>(cachedQuery, page: pageKey);

      // avoid accessing the PagingController after the widget has been disposed
      if (!mounted) return;

      // restart if selected zen entry was changed during request
      if (cachedQuery != query) {
        return _fetchPage(pageKey);
      }

      if (response.noMatchesFor.isNotEmpty) {
        noMatchesFor = response.noMatchesFor;
      }

      if (pageKey == 1) {
        if (zenInfo.value == null && response.zenEntries.isNotEmpty) {
          zenInfo.value = ZenInfo(response.zenEntries);
        }
        correction.value = response.correction;
        grammarInfo.value = response.grammarInfo;
        conversion.value = response.conversion;
      }

      if (!response.hasNextPage) {
        _pagingController.appendLastPage(response.results);
        return;
      }

      _pagingController.appendPage(response.results, pageKey + 1);
    } catch (error, stackTrace) {
      _pagingController.error = (error, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        ValueListenableBuilder(
          valueListenable: zenInfo,
          builder: (_, zenInfoValue, __) =>
              _ZenBar(zenInfoValue, _selectZenEntry),
        ),
        ValueListenableBuilder(
          valueListenable: conversion,
          builder: (_, conversionValue, __) => _ConversionInfo(conversionValue),
        ),
        ValueListenableBuilder(
          valueListenable: grammarInfo,
          builder: (_, grammarInfoValue, __) => _GrammarInfo(grammarInfoValue),
        ),
        ValueListenableBuilder(
          valueListenable: correction,
          builder: (_, correctionValue, __) => _CorrectionInfo(correctionValue),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: PagedSliverList<int, T>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<T>(
                itemBuilder: (context, item, index) => _createItem(item),
                firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                      (_pagingController.error.$1 as Object),
                      stackTrace: (_pagingController.error.$2 as StackTrace),
                      onRetry: _pagingController.refresh,
                    ),
                noItemsFoundIndicatorBuilder: (context) {
                  return Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      noMatchesFor.isNotEmpty
                          ? "No matches for:\n${noMatchesFor.join("\n")}"
                          : "No matches found",
                      textAlign: TextAlign.center,
                      style: const TextStyle(height: 1.75),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget _createItem(T item) {
    return switch (T) {
      Word => WordItem(word: item as Word),
      Kanji => KanjiItem(kanji: item as Kanji),
      Sentence => SentenceItem(sentence: item as Sentence),
      Name => NameItem(name: item as Name),
      _ => throw Exception("Unknown type"),
    };
  }

  @override
  void dispose() {
    _pagingController.dispose();
    zenInfo.dispose();
    correction.dispose();
    grammarInfo.dispose();
    conversion.dispose();
    super.dispose();
  }
}

class _CorrectionInfo extends StatelessWidget {
  const _CorrectionInfo(this.correction);

  final Correction? correction;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final linkColor = Theme.of(context).colorScheme.primary;
    final queryProvider = Provider.of<QueryProvider>(context, listen: false);

    return SliverPadding(
      padding: correction != null
          ? const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12)
          : EdgeInsets.zero,
      sliver: SliverToBoxAdapter(
          child: correction != null
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: textColor, height: 1.5),
                    children: [
                      const TextSpan(text: "Searched for "),
                      TextSpan(
                          text: correction!.effective,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      const TextSpan(text: "\n"),
                      if (!correction!.noMatchesForOriginal) ...[
                        const TextSpan(text: "Try searching for "),
                        TextSpan(
                          text: correction!.original,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: linkColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              queryProvider.searchController.text =
                                  correction!.original;
                              queryProvider.updateQuery();
                            },
                        ),
                      ] else
                        TextSpan(
                            text: "No matches for ${correction!.original}"),
                    ],
                  ))
              : null),
    );
  }
}

class _GrammarInfo extends StatelessWidget {
  const _GrammarInfo(this.grammarInfo);

  final GrammarInfo? grammarInfo;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final linkColor = Theme.of(context).colorScheme.primary;

    return SliverPadding(
      padding: grammarInfo != null
          ? const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12)
          : EdgeInsets.zero,
      sliver: SliverToBoxAdapter(
          child: grammarInfo != null
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: textColor, height: 1.5),
                    children: [
                      TextSpan(text: grammarInfo!.word),
                      const TextSpan(text: " could be an inflection of "),
                      TextSpan(
                        text: grammarInfo!.possibleInflectionOf,
                        style: TextStyle(
                          color: linkColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = pushScreen(
                              context,
                              WordDetailsScreen(
                                  grammarInfo!.possibleInflectionOf,
                                  search: true)),
                      ),
                    ],
                  ))
              : null),
    );
  }
}

class _ConversionInfo extends StatelessWidget {
  const _ConversionInfo(this.conversion);

  final Conversion? conversion;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: conversion != null
          ? const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12)
          : EdgeInsets.zero,
      sliver: SliverToBoxAdapter(
          child: conversion != null
              ? Text(
                  "${conversion!.original} is ${conversion!.converted}",
                  textAlign: TextAlign.center,
                )
              : null),
    );
  }
}

class ZenInfo {
  final List<String> entries;
  final int selectedIndex;

  ZenInfo(this.entries, {this.selectedIndex = 0});

  String get selectedEntry => entries[selectedIndex];

  ZenInfo withSelected(int index) => ZenInfo(entries, selectedIndex: index);
}

class _ZenBar extends StatelessWidget {
  const _ZenBar(this.zenInfo, this.onSelect);

  final ZenInfo? zenInfo;
  final void Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: zenInfo != null
          ? const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12)
          : EdgeInsets.zero,
      sliver: SliverToBoxAdapter(
          child: zenInfo != null
              ? Wrap(
                  alignment: WrapAlignment.center,
                  children: zenInfo!.entries.mapIndexed((index, entry) {
                    final selected = zenInfo!.selectedIndex == index;

                    return InfoChip(
                      entry,
                      icon: selected ? Icons.check : null,
                      onTap: !selected ? () => onSelect(index) : null,
                    );
                  }).toList(),
                )
              : null),
    );
  }
}
