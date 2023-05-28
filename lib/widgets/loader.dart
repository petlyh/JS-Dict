import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
          return errorWidget(context, snapshot.error!);
        }

        if (snapshot.hasData && snapshot.data != null) {
          return handler(snapshot.data as T);
        }

        throw AssertionError();
      }
    );
  }

  String errorMessage(Object error) {
    if (error is SocketException || error is ClientException) {
        return "A network error occured.\nCheck your connection.";
    }

    return "An error occured";
  }

  Widget errorWidget(BuildContext context, Object error) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage(error), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text("Show Error"),
              onPressed: () => showErrorInfoDialog(context, error),
            ),
          ],
        ),
      ),
    );
  }

  Widget errorDetailText(String title, String info, {TextStyle? style}) {
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: info),
        ],
      ),
    );
  }
  
  void showErrorInfoDialog(BuildContext context, Object error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 28, bottom: 12, left: 28, right: 28),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        title: const Text("Error Info", style: TextStyle(fontSize: 20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            errorDetailText("Type: ", error.runtimeType.toString()),
            errorDetailText("Message: ", error.toString()),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      )
    );
  }
}