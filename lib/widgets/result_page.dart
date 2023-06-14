import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/error_indicator.dart';
import 'package:jsdict/widgets/items/kanji.dart';
import 'package:jsdict/widgets/items/name.dart';
import 'package:jsdict/widgets/items/sentence.dart';
import 'package:jsdict/widgets/items/word.dart';

class ResultPage<T> extends StatefulWidget {
  const ResultPage(this.query, {super.key});

  final String query;

  @override
  State<ResultPage<T>> createState() => _ResultPageState<T>();
}

class _ResultPageState<T> extends State<ResultPage<T>> {
  final PagingController<int, T> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await getClient().search<T>(widget.query, page: pageKey);

      if (!response.hasNextPage) {
        _pagingController.appendLastPage(response.results);
        return;
      }

      _pagingController.appendPage(response.results, pageKey + 1);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: PagedListView<int, T>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<T>(
                  itemBuilder: (context, item, index) => _createItem(item),
                  firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                    _pagingController.error,
                    onRetry: _pagingController.refresh,
                  ),
                  noItemsFoundIndicatorBuilder: (context) => Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(20.0),
                    child: const Text("No matches found"),
                  ),
                ),
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