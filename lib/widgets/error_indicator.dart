import "dart:io";

import "package:expandable_text/expandable_text.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(this.error, {super.key, this.stackTrace, this.onRetry});

  final Object error;
  final Function()? onRetry;
  final StackTrace? stackTrace;

  String get _errorType => error.runtimeType.toString();
  String get _errorMessage => error.toString();

  String get _userMessage {
    if (error is NotFoundException) {
      return "Page not found";
    }

    if (error is SocketException || error is ClientException) {
      return "A network error occured.\nCheck your connection.";
    }

    return "An error occured";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userMessage, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text("Show Error"),
              onPressed: () => showErrorInfoDialog(context),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 4),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text("Retry"),
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoText(String title, String info, {TextStyle? style}) {
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(
              text: title, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: info),
        ],
      ),
    );
  }

  void showErrorInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 28, bottom: 12, left: 28, right: 28),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        title: const Text("Error Info", style: TextStyle(fontSize: 20)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoText("Type: ", _errorType),
              _infoText("Message: ", _errorMessage),
              if (stackTrace != null) ...[
                _infoText("Stack trace: ", ""),
                ExpandableText(
                  stackTrace.toString(),
                  expandText: "Show",
                  collapseText: "Hide",
                  maxLines: 1,
                  linkColor: Theme.of(context).primaryColor,
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Copy"),
            onPressed: () => _copyError(context),
          ),
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ));
  }

  void _copyError(BuildContext context) {
    final copyText = "Type: $_errorType  \nMessage: $_errorMessage  \nStack trace:\n```\n${stackTrace.toString()}```";

    Clipboard.setData(ClipboardData(text: copyText)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Copied error info")),
      );
    });

    Navigator.pop(context);
  }
}
