import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jsdict/client/client.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/widgets/result_list.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.query, required this.type});

  final String query;
  final JishoTag type;

  static const placeholder = Center(child: Text("JS-Dict", style: TextStyle(fontSize: 32.0)));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: getContentWidget()
            ),
          ),
        ],
      ),
    );
  }

  Widget getContentWidget() {
    if (query.isEmpty) {
      return placeholder;
    }

    return FutureBuilder(
      future: GetIt.I<JishoClient>().searchTag(query, type),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.all(20.0),
            child: const CircularProgressIndicator()
          );
        }
        if (snapshot.connectionState == ConnectionState.none) {
          return placeholder;
        }
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.all(20.0),
            child: Text(snapshot.error.toString())
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data!.hasNoMatches(type)) {
            return Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text("No matches found")
            );
          }

          return ResultListWidget(searchResponse: snapshot.data!, type: type);
        }
        return const Text("Something went wrong");
      }
    );
  }
}