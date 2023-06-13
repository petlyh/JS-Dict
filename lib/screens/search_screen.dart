import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/screens/settings_screen.dart';
import 'package:jsdict/widgets/result_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  void search(String submittedQuery) {
    // remove tags
    searchController.text = submittedQuery.replaceAll(RegExp(r"#\w+"), "").trim();

    setState(() {
      query = searchController.text;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  static const placeholder = Center(child: Text("JS-Dict", style: TextStyle(fontSize: 32.0)));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextField(
            focusNode: searchFocusNode,
            controller: searchController,
            onSubmitted: search,
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
              hintText: "Search...",
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => {
                  searchFocusNode.requestFocus(),
                  searchController.clear()
                },
                tooltip: "Clear",
              )
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingScreen()))
              },
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
            ),
          ],
          bottom: query.isEmpty ? null : const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Words"),
              Tab(text: "Kanji"),
              Tab(text: "Names"),
              Tab(text: "Sentences"),
            ]
          ),
        ),
        body: query.isEmpty ?
          placeholder :
          TabBarView(
            children: [
              ResultPage<Word>(query: query),
              ResultPage<Kanji>(query: query),
              ResultPage<Name>(query: query),
              ResultPage<Sentence>(query: query),
            ]
          ),
      ),
    );
  }
}