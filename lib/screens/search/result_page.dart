import "package:flutter/material.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/singletons.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:jsdict/widgets/items/kanji_item.dart";
import "package:jsdict/widgets/items/name_item.dart";
import "package:jsdict/widgets/items/sentence_item.dart";
import "package:jsdict/widgets/items/word_item.dart";

class ResultPage<T> extends StatefulWidget {
  const ResultPage(this.query, {super.key});

  final String query;

  @override
  State<ResultPage<T>> createState() => _ResultPageState<T>();
}

class _ResultPageState<T> extends State<ResultPage<T>> with AutomaticKeepAliveClientMixin<ResultPage<T>> {
  @override
  final bool wantKeepAlive = true;

  final PagingController<int, T> _pagingController = PagingController(firstPageKey: 1);

  List<String> noMatchesFor = [];

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    noMatchesFor = [];

    try {
      final response = await getClient().search<T>(widget.query, page: pageKey);

      if (!mounted) return;

      if (response.noMatchesFor.isNotEmpty) {
        noMatchesFor = response.noMatchesFor;
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

    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: PagedListView<int, T>(
              padding: const EdgeInsets.all(8.0),
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
                    margin: const EdgeInsets.all(20.0),
                    child: Text(
                        noMatchesFor.isNotEmpty
                            ? "No matches for:\n${noMatchesFor.join("\n")}"
                            : "No matches found",
                        textAlign: TextAlign.center,
                        style: const TextStyle(height: 2),
                      ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
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