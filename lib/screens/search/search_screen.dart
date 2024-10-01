import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/intent_handler.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/screens/search_options/radical_search_screen.dart";
import "package:jsdict/screens/search_options/tag_selection_screen.dart";
import "package:jsdict/screens/settings_screen.dart";
import "package:provider/provider.dart";

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  static const _placeholder = Center(
    child: Text("JS-Dict", style: TextStyle(fontSize: 32)),
  );

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);

    final searchController = queryProvider.searchController;
    final searchFocusNode = useFocusNode();

    final tabController = useTabController(initialLength: 4);

    useIntentHandler(tabController: tabController);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: pushScreen(context, const RadicalSearchScreen()),
        tooltip: "Radicals",
        child: const Text("部", style: TextStyle(fontSize: 20)),
      ),
      appBar: AppBar(
        title: TextField(
          style: jpTextStyle,
          focusNode: searchFocusNode,
          controller: searchController,
          onSubmitted: (_) => queryProvider.updateQuery(),
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
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: pushScreen(context, const TagSelectionScreen()),
            icon: const Icon(Icons.tag),
            tooltip: "Tags",
          ),
          IconButton(
            onPressed: pushScreen(context, const SettingScreen()),
            icon: const Icon(Icons.settings),
            tooltip: "Settings",
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: const [
            Tab(text: "Words"),
            Tab(text: "Kanji"),
            Tab(text: "Names"),
            Tab(text: "Sentences"),
          ],
        ),
      ),
      body: Consumer<QueryProvider>(
        builder: (_, provider, __) => provider.query.isEmpty
            ? _placeholder
            : TabBarView(
                controller: tabController,
                children: [
                  ResultPage<Word>(query: provider.query, key: UniqueKey()),
                  ResultPage<Kanji>(query: provider.query, key: UniqueKey()),
                  ResultPage<Name>(query: provider.query, key: UniqueKey()),
                  ResultPage<Sentence>(query: provider.query, key: UniqueKey()),
                ],
              ),
      ),
    );
  }
}
