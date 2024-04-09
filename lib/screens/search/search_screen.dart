import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/link_handler.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/screens/search_options/radical_search_screen.dart";
import "package:jsdict/screens/search_options/tag_selection_screen.dart";
import "package:jsdict/screens/settings_screen.dart";
import "package:provider/provider.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const placeholder =
      Center(child: Text("JS-Dict", style: TextStyle(fontSize: 32.0)));

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late LinkHandler _linkHandler;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _linkHandler = LinkHandler(context, _tabController);
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _linkHandler.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);
    final searchController = queryProvider.searchController;

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
          focusNode: _searchFocusNode,
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
                  _searchFocusNode.requestFocus();
                  searchController.clear();
                },
                tooltip: "Clear",
              )),
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
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(text: "Words"),
              Tab(text: "Kanji"),
              Tab(text: "Names"),
              Tab(text: "Sentences"),
            ]),
      ),
      body: Consumer<QueryProvider>(
        builder: (_, provider, __) => provider.query.isEmpty
            ? SearchScreen.placeholder
            : TabBarView(controller: _tabController, children: [
                ResultPage<Word>(provider.query, key: UniqueKey()),
                ResultPage<Kanji>(provider.query, key: UniqueKey()),
                ResultPage<Name>(provider.query, key: UniqueKey()),
                ResultPage<Sentence>(provider.query, key: UniqueKey()),
              ]),
      ),
    );
  }
}
