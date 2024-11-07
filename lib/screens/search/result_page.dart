import "dart:async";

import "package:collection/collection.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search/paging_hook.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:jsdict/widgets/info_chip.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/items/name_item.dart";
import "package:jsdict/widgets/items/sentence_item.dart";
import "package:jsdict/widgets/items/word_item.dart";
import "package:jsdict/widgets/link_span.dart";
import "package:provider/provider.dart";

class ResultPageScreen<T extends ResultType> extends StatelessWidget {
  const ResultPageScreen({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(query)),
      body: ResultPage<T>(query: query),
    );
  }
}

class ResultPage<T extends ResultType> extends HookWidget {
  const ResultPage({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();

    return FutureLoader(
      onLoad: () => getClient().search<T>(query),
      handler: (response) => _ResultPageContent(
        query: query,
        initialResponse: response,
      ),
    );
  }
}

class _ResultPageContent<T extends ResultType> extends HookWidget {
  const _ResultPageContent({
    required this.query,
    required this.initialResponse,
  });

  final String query;
  final SearchResponse<T> initialResponse;

  List<Widget> _onReponse(SearchResponse<T> response, {required int key}) => [
        if (response.results.isEmpty)
          _NoResultsText(noMatchesFor: response.noMatchesFor),
        if (response.conversion case final conversion?)
          _ConversionText(conversion: conversion),
        if (response.grammarInfo case final grammarInfo?)
          _GrammarInfoText(info: grammarInfo),
        if (response.correction case final correction?)
          _CorrectionText(correction: correction),
        if (response.results.isNotEmpty)
          _PagedResultList(
            key: ValueKey(key),
            query: query,
            initialState: PagingState<int, T>(
              itemList: response.results,
              nextPageKey: response.hasNextPage ? 2 : null,
            ),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    final zenIndex = useRef(0);
    final zenEntries = initialResponse.zenEntries;

    final future = useState<Future<SearchResponse<T>>>(
      SynchronousFuture(initialResponse),
    );

    final snapshot = useFuture(future.value, preserveState: false);

    final cache = useRef(<int, SearchResponse<T>>{});

    if (snapshot.hasData && !cache.value.containsKey(zenIndex.value)) {
      cache.value[zenIndex.value] = snapshot.requireData;
    }

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        if (zenEntries.isNotEmpty)
          _ZenBar(
            entries: zenEntries,
            selectedIndex: zenIndex.value,
            onSelect: (index) {
              zenIndex.value = index;
              future.value = cache.value.containsKey(index)
                  ? SynchronousFuture(cache.value[index]!)
                  : getClient().search<T>(zenEntries[index]);
            },
          ),
        if (snapshot.data case final data?)
          ..._onReponse(data, key: zenIndex.value)
        else if (snapshot.error case final error?)
          _paddedSliverAdapter(
            child: ErrorIndicator(
              error: error,
              stackTrace: snapshot.stackTrace,
              onRetry: () => future.value =
                  getClient().search<T>(zenEntries[zenIndex.value]),
            ),
          )
        else if (snapshot.connectionState == ConnectionState.waiting)
          _paddedSliverAdapter(child: loadingIndicator),
      ],
    );
  }
}

class _PagedResultList<T extends ResultType> extends HookWidget {
  const _PagedResultList({
    super.key,
    required this.query,
    required this.initialState,
  });

  final String query;
  final PagingState<int, T> initialState;

  Future<void> _onRequest(PagingController<int, T> controller, int key) async {
    try {
      final response = await getClient().search<T>(query, page: key);

      controller.appendPage(
        response.results,
        response.hasNextPage ? key + 1 : null,
      );
    } catch (error, stackTrace) {
      controller.error = (error, stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = usePagingController(
      firstPageKey: 1,
      requestListener: _onRequest,
      initialState: initialState,
    );

    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: PagedSliverList<int, T>(
        pagingController: controller,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: (context, item, index) => switch (item) {
            final Word word => WordItem(word: word),
            final Kanji kanji => KanjiItem(kanji: kanji),
            final Sentence sentence => SentenceItem(sentence: sentence),
            final Name name => NameItem(name: name),
          },
          newPageErrorIndicatorBuilder: (context) {
            final (error, stackTrace) =
                controller.error as (Object, StackTrace);

            return ErrorIndicator(
              error: error,
              stackTrace: stackTrace,
              onRetry: controller.retryLastFailedRequest,
              isCompact: true,
            );
          },
        ),
      ),
    );
  }
}

class _ZenBar extends StatelessWidget {
  const _ZenBar({
    required this.entries,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<String> entries;
  final int selectedIndex;
  final void Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return _paddedSliverAdapter(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: entries.mapIndexed((index, entry) {
          final isSelected = index == selectedIndex;

          return InfoChip(
            entry,
            icon: isSelected ? Icons.check : null,
            onTap: !isSelected ? () => onSelect(index) : null,
          );
        }).toList(),
      ),
    );
  }
}

class _ConversionText extends StatelessWidget {
  const _ConversionText({required this.conversion});

  final Conversion conversion;

  @override
  Widget build(BuildContext context) {
    return _paddedSliverAdapter(
      child: Text(
        "${conversion.original} is ${conversion.converted}",
        textAlign: TextAlign.center,
        style: jpTextStyle,
      ),
    );
  }
}

class _CorrectionText extends StatelessWidget {
  const _CorrectionText({required this.correction});

  final Correction correction;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return _paddedSliverAdapter(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: textColor, height: 1.5).jp(),
          children: [
            const TextSpan(text: "Searched for "),
            TextSpan(
              text: "${correction.effective}\n",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            if (correction.noMatchesForOriginal)
              TextSpan(text: "No matches for ${correction.original}")
            else ...[
              const TextSpan(text: "Try searching for "),
              LinkSpan(
                context: context,
                text: correction.original,
                bold: true,
                onTap: () => Provider.of<QueryProvider>(context, listen: false)
                  ..searchController.text = correction.original
                  ..updateQuery(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NoResultsText extends StatelessWidget {
  const _NoResultsText({required this.noMatchesFor});

  final List<String> noMatchesFor;

  @override
  Widget build(BuildContext context) {
    return _paddedSliverAdapter(
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(16),
        child: Text(
          noMatchesFor.isNotEmpty
              ? "No matches for:\n${noMatchesFor.join("\n")}"
              : "No matches found",
          textAlign: TextAlign.center,
          style: const TextStyle(height: 1.75),
        ),
      ),
    );
  }
}

class _GrammarInfoText extends StatelessWidget {
  const _GrammarInfoText({required this.info});

  final GrammarInfo info;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return _paddedSliverAdapter(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: textColor, height: 1.5).jp(),
          children: [
            TextSpan(text: "${info.word} could be an inflection of "),
            LinkSpan(
              context: context,
              text: info.possibleInflectionOf,
              onTap: pushScreen(
                context,
                WordDetailsScreen.search(query: info.possibleInflectionOf),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _paddedSliverAdapter({required Widget child}) => SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12),
      sliver: SliverToBoxAdapter(child: child),
    );
