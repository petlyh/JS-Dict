import 'package:flutter/material.dart';
import 'package:jsdict/providers/query_provider.dart';
import 'package:jsdict/widgets/radical_search/radical_search_widget.dart';
import 'package:provider/provider.dart';

class SearchOptionsScreen extends StatelessWidget {
  const SearchOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryProvider = Provider.of<QueryProvider>(context, listen: false);
    final searchController = queryProvider.searchController;

    return WillPopScope(
      onWillPop: () async {
        queryProvider.updateQueryIfChanged();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: TextField(
            controller: searchController,
            autofocus: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: searchController.clear,
                  tooltip: "Clear",
                )),
          ),
        ),
        body: RadicalSearchWidget(onKanjiSelect: queryProvider.insertText),
      ),
    );
  }
}
