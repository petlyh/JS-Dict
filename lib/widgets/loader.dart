import 'package:flutter/material.dart';

class LoaderWidget<T> extends StatelessWidget {
  const LoaderWidget({
    super.key,
    required this.future,
    required this.handler,
    this.placeholder = const Text("")}
  );

  final Future<T>? future;
  final Widget Function(T data) handler;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: const CircularProgressIndicator()
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.none) {
          return placeholder;
        }
        if (snapshot.hasError) {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Text(snapshot.error.toString())
            ),
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          return handler(snapshot.data as T);
        }

        return const Text("Something went wrong");
      }
    );
  }
}