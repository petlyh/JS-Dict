import "package:flutter/material.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/screens/search_options/radical_search_screen.dart";
import "package:jsdict/screens/search_options/tag_selection_screen.dart";
import "package:jsdict/screens/settings_screen.dart";
import "package:provider/provider.dart";

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const placeholder = Center(child: Text("JS-Dict", style: TextStyle(fontSize: 32.0)));

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);
    final searchController = queryProvider.searchController;
    final searchFocusNode = FocusNode();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: screenPusher(context, const RadicalSearchScreen()),
          child: const Text("部", style: TextStyle(fontSize: 20)),
        ),
        appBar: AppBar(
          title: TextField(
            focusNode: searchFocusNode,
            controller: searchController,
            onSubmitted: (_) => queryProvider.updateQuery(),
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
              hintText: "Search...",
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchFocusNode.requestFocus();
                  searchController.clear();
                },
                tooltip: "Clear",
              )
            ),
          ),
          actions: [
            IconButton(
              onPressed: screenPusher(context, const TagSelectionScreen()),
              icon: const Icon(Icons.tag),
              tooltip: "Tags",
            ),
            IconButton(
              onPressed: screenPusher(context, const SettingScreen()),
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
            ),
          ],
          bottom: Provider.of<QueryProvider>(context).query.isEmpty ? null : const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Words"),
              Tab(text: "Kanji"),
              Tab(text: "Names"),
              Tab(text: "Sentences"),
            ]
          ),
        ),
        body: Consumer<QueryProvider>(
          builder: (_, provider, __) => provider.query.isEmpty ?
            placeholder :
            TabBarView(
              children: [
                ResultPage<Word>(provider.query, key: UniqueKey()),
                ResultPage<Kanji>(provider.query, key: UniqueKey()),
                ResultPage<Name>(provider.query, key: UniqueKey()),
                ResultPage<Sentence>(provider.query, key: UniqueKey()),
              ]
            ),
          ),
      ),
    );
  }
}