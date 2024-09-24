import "package:collection/collection.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:jsdict/jp_text.dart";
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
import "package:jsdict/widgets/link_span.dart";
import "package:provider/provider.dart";

class ResultPageScreen<T extends SearchType> extends StatelessWidget {
  const ResultPageScreen(this.query, {super.key});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(query)),
      body: ResultPage<T>(query),
    );
  }
}

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

  final pagingController = PagingController<int, T>(firstPageKey: 1);

  List<String> noMatchesFor = [];

  final zenInfo = ValueNotifier<ZenInfo?>(null);
  final correction = ValueNotifier<Correction?>(null);
  final grammarInfo = ValueNotifier<GrammarInfo?>(null);
  final conversion = ValueNotifier<Conversion?>(null);

  String get query => zenInfo.value?.selectedEntry ?? widget.query;

  @override
  void initState() {
    pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  void _selectZenEntry(int index) {
    if (zenInfo.value == null) {
      return;
    }

    zenInfo.value = zenInfo.value!.withSelected(index);
    pagingController.refresh();
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
        pagingController.appendLastPage(response.results);
        return;
      }

      pagingController.appendPage(response.results, pageKey + 1);
    } catch (error, stackTrace) {
      pagingController.error = (error, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    final queryProvider = Provider.of<QueryProvider>(context, listen: false);

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SearchMetaInfo(
          listenable: zenInfo,
          builder: (context, value) => Wrap(
            alignment: WrapAlignment.center,
            children: value.entries.mapIndexed((index, entry) {
              final selected = value.selectedIndex == index;

              return InfoChip(
                entry,
                icon: selected ? Icons.check : null,
                onTap: !selected ? () => _selectZenEntry(index) : null,
              );
            }).toList(),
          ),
        ),
        SearchMetaInfo(
          listenable: conversion,
          builder: (_, value) => SelectableText(
            "${value.original} is ${value.converted}",
            textAlign: TextAlign.center,
            style: jpTextStyle,
          ),
        ),
        SearchMetaInfo(
          listenable: grammarInfo,
          builder: (context, value) => SelectableText.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: TextStyle(color: textColor, height: 1.5).jp(),
              children: [
                TextSpan(text: value.word),
                const TextSpan(text: " could be an inflection of "),
                LinkSpan(
                  context,
                  text: value.possibleInflectionOf,
                  onTap: pushScreen(
                    context,
                    WordDetailsScreen.search(
                      value.possibleInflectionOf,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SearchMetaInfo(
          listenable: correction,
          builder: (_, value) => SelectableText.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: TextStyle(color: textColor, height: 1.5).jp(),
              children: [
                const TextSpan(text: "Searched for "),
                TextSpan(
                  text: value.effective,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const TextSpan(text: "\n"),
                if (!value.noMatchesForOriginal) ...[
                  const TextSpan(text: "Try searching for "),
                  LinkSpan(
                    context,
                    text: value.original,
                    bold: true,
                    onTap: () {
                      queryProvider.searchController.text = value.original;
                      queryProvider.updateQuery();
                    },
                  ),
                ] else
                  TextSpan(text: "No matches for ${value.original}"),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: PagedSliverList<int, T>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<T>(
              itemBuilder: (context, item, index) => _createItem(item),
              firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                (pagingController.error as (Object, StackTrace)).$1,
                stackTrace: (pagingController.error as (Object, StackTrace)).$2,
                onRetry: pagingController.refresh,
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
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _createItem(T item) {
    return switch (T) {
      const (Word) => WordItem(word: item as Word),
      const (Kanji) => KanjiItem(kanji: item as Kanji),
      const (Sentence) => SentenceItem(sentence: item as Sentence),
      const (Name) => NameItem(name: item as Name),
      _ => throw Exception("Unknown type"),
    };
  }

  @override
  void dispose() {
    pagingController.dispose();
    zenInfo.dispose();
    correction.dispose();
    grammarInfo.dispose();
    conversion.dispose();
    super.dispose();
  }
}

class SearchMetaInfo<T> extends StatelessWidget {
  const SearchMetaInfo({
    super.key,
    required this.listenable,
    required this.builder,
  });

  final ValueListenable<T?> listenable;
  final Widget Function(BuildContext context, T value) builder;

  static final padding =
      const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T?>(
      valueListenable: listenable,
      builder: (_, value, __) => SliverPadding(
        padding: value != null ? padding : EdgeInsets.zero,
        sliver: SliverToBoxAdapter(
          child: value != null ? builder(context, value) : null,
        ),
      ),
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
