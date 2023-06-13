import 'package:flutter/material.dart';
import 'package:jsdict/singletons.dart';
import 'package:jsdict/widgets/loader.dart';
import 'package:jsdict/widgets/result_list.dart';

class ResultPage<T> extends StatelessWidget {
  const ResultPage({super.key, required this.query});

  final String query;

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
                future: getClient().search<T>(query),
                handler: (data) {
                  if (data.results.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.all(20.0),
                      child: const Text("No matches found")
                    );
                  }

                  return ResultListWidget<T>(searchResponse: data);
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}