import "dart:async";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:jsdict/jp_text.dart";
import "package:jsdict/models/models.dart";
import "package:jsdict/packages/is_kanji.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/remove_tags.dart";
import "package:jsdict/packages/transform.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/kanji_details/kanji_details_screen.dart";
import "package:jsdict/screens/search/result_page.dart";
import "package:jsdict/screens/search_options/radical_search_screen.dart";
import "package:jsdict/screens/search_options/tag_selection_screen.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/screens/settings_screen.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:provider/provider.dart";
import "package:uni_links/uni_links.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const placeholder =
      Center(child: Text("JS-Dict", style: TextStyle(fontSize: 32.0)));

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late StreamSubscription<Uri?> _sub;
  late TabController _tabController;

  static const types = ["word", "kanji", "name", "sentence"];

  RegExp _getTypeRegex(String type) =>
      RegExp(r"(?:^|\s)#" + type + r"s?(?:$|\s)", caseSensitive: false);

  /// Returns a tab index based on what search type tag (if any) is found in [searchQuery].
  /// If none is found, 0 (word tab) is returned.
  int _getTabIndex(String searchQuery) =>
      types
          .firstWhereOrNull((type) => _getTypeRegex(type).hasMatch(searchQuery))
          ?.transform((value) => types.indexOf(value)) ??
      0;

  void _handleUrl(BuildContext context, Uri? url) {
    if (url == null) {
      return;
    }

    if (url.path.startsWith("/word/")) {
      final word = url.pathSegments.last;
      pushScreen(context, WordDetailsScreen.search(word)).call();
      return;
    }

    if (url.path.startsWith("/sentences/")) {
      final sentenceId = url.pathSegments.last;
      pushScreen(context, SentenceDetailsScreen.id(sentenceId)).call();
      return;
    }

    if (url.path.startsWith("/search/")) {
      final searchQuery = url.pathSegments.last;

      if (_getTypeRegex("kanji").hasMatch(searchQuery)) {
        final rawQuery = removeTags(searchQuery).trim();

        if (rawQuery.length == 1 && isKanji(rawQuery)) {
          pushScreen(context, KanjiDetailsScreen.id(rawQuery)).call();
          return;
        }
      }

      _tabController.index = _getTabIndex(searchQuery);
      QueryProvider.of(context).query = searchQuery;
      popAll(context);
      return;
    }
  }

  StreamSubscription<Uri?> _handleIncomingLinks() {
    return uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      _handleUrl(context, uri);
    }, onError: (Object error) {
      if (!mounted) return;
      showErrorInfoDialog(context, error);
    });
  }

  Future<void> _handleInitialLink() async {
    try {
      final uri = await getInitialUri();
      if (!mounted) return;
      _handleUrl(context, uri);
    } on PlatformException {
      // Platform messages may fail but we ignore the exception
    } on FormatException catch (error) {
      if (!mounted) return;
      showErrorInfoDialog(context, error);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _sub = _handleIncomingLinks();
    _handleInitialLink();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);
    final searchController = queryProvider.searchController;
    final searchFocusNode = FocusNode();

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
        bottom: Provider.of<QueryProvider>(context).query.isEmpty
            ? null
            : TabBar(
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
