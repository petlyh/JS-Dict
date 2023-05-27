import 'package:flutter/material.dart';
import 'package:jsdict/models.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/loader.dart';
import 'package:jsdict/widgets/result_list.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.query, required this.type});

  final String query;
  final JishoTag type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: LoaderWidget(
                future: getClient().searchTag(query, type),
                handler: (data) {
                  if (data.hasNoMatches(type)) {
                    return Container(
                      margin: const EdgeInsets.all(20.0),
                      child: const Text("No matches found")
                    );
                  }

                  return ResultListWidget(searchResponse: data, type: type);
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}