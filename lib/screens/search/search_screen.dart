import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:jsdict/hooks/intent_handler.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/screens/search_options/radical_search_screen.dart";
import "package:jsdict/screens/search_options/tag_selection_screen.dart";
import "package:jsdict/screens/settings_screen.dart";
import "package:jsdict/widgets/search_field.dart";

class SearchScreen extends HookConsumerWidget {
  const SearchScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController(text: "");

    // Update search field text when query is changed from somewhere else.
    ref.listen(queryProvider, (_, query) => searchController.text = query);

    final tabController = useTabController(initialLength: 4);

    useIntentHandler(
      tabController: tabController,
      queryController: ref.read(queryProvider.notifier),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            pushScreen(context, RadicalSearchScreen(searchController.text))
                .call(),
        tooltip: "Radicals",
        child: const Text("部", style: TextStyle(fontSize: 20)),
      ),
      appBar: AppBar(
        title: SearchField(
          controller: searchController,
          onSubmitted: ref.read(queryProvider.notifier).update,
          showSearchIcon: true,
          focusOnClear: true,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                pushScreen(context, TagSelectionScreen(searchController.text))
                    .call(),
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
      body: _SearchScreenContent(tabController: tabController),
    );
  }
}

class _SearchScreenContent extends ConsumerWidget {
  const _SearchScreenContent({required this.tabController});

  final TabController tabController;

  static const _placeholder = Center(
    child: Text("JS-Dict", style: TextStyle(fontSize: 32)),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(queryProvider);

    if (query.isEmpty) {
      return _placeholder;
    }

    return TabBarView(
      controller: tabController,
      children: [
        ResultPage<Word>(query: query, key: ValueKey((query, Word))),
        ResultPage<Kanji>(query: query, key: ValueKey((query, Kanji))),
        ResultPage<Name>(query: query, key: ValueKey((query, Name))),
        ResultPage<Sentence>(query: query, key: ValueKey((query, Sentence))),
      ],
    );
  }
}
