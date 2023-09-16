import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/error_indicator.dart";
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

class _ResultPageState<T extends SearchType> extends State<ResultPage<T>> with AutomaticKeepAliveClientMixin<ResultPage<T>> {
  @override
  final bool wantKeepAlive = true;

  final PagingController<int, T> _pagingController = PagingController(firstPageKey: 1);

  List<String> noMatchesFor = [];

  ValueNotifier<Correction?> correction = ValueNotifier<Correction?>(null);
  ValueNotifier<GrammarInfo?> grammarInfo = ValueNotifier<GrammarInfo?>(null);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    noMatchesFor = [];

    if (pageKey == 1) {
      correction.value = null;
      grammarInfo.value = null;
    }

    try {
      final response = await getClient().search<T>(widget.query, page: pageKey);

      if (!mounted) return;

      if (response.noMatchesFor.isNotEmpty) {
        noMatchesFor = response.noMatchesFor;
      }

      if (pageKey == 1) {
        correction.value = response.correction;
        grammarInfo.value = response.grammarInfo;
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
              }
            ),
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
                      TextSpan(text: correction!.searchedFor, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const TextSpan(text: "\n"),
                      const TextSpan(text: "Try searching for "),
                      TextSpan(
                        text: correction!.suggestion,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: linkColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            queryProvider.searchController.text = correction!.suggestion;
                            queryProvider.updateQuery();
                          },
                      ),
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
    final queryProvider = Provider.of<QueryProvider>(context, listen: false);

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
                          ..onTap = () {
                            queryProvider.searchController.text = grammarInfo!.possibleInflectionOf;
                            queryProvider.updateQuery();
                          },
                      ),
                    ],
                  ))
              : null),
    );
  }
}