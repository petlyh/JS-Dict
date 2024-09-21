import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/providers/query_provider.dart";

class SearchOptionsScreen extends StatelessWidget {
  const SearchOptionsScreen(
      {super.key, required this.body, this.floatingActionButton});

  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);
    final searchController = queryProvider.searchController;

    return PopScope(
      onPopInvokedWithResult: (_, __) => queryProvider.updateQueryIfChanged(),
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: TextField(
            style: jpTextStyle,
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
        body: body,
      ),
    );
  }
}
