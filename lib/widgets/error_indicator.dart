import "dart:io";

import "package:expandable_text/expandable_text.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart";
import "package:jsdict/packages/jisho_client/jisho_client.dart";

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(
    this.error, {
    super.key,
    this.stackTrace,
    this.onRetry,
    this.isCompact = false,
  });

  final Object error;
  final StackTrace? stackTrace;
  final void Function()? onRetry;
  final bool isCompact;

  String get _userMessage {
    if (error is NotFoundException) {
      return "Page not found";
    }

    if (error is SocketException || error is ClientException) {
      return "A network error occured.\nCheck your connection.";
    }

    return "An error occured";
  }

  Widget _createButton({
    required String name,
    required IconData icon,
    void Function()? onTap,
  }) =>
      isCompact
          ? IconButton.filledTonal(
              icon: Icon(icon),
              tooltip: name,
              onPressed: onTap,
            )
          : ElevatedButton.icon(
              icon: Icon(icon),
              label: Text(name),
              onPressed: onTap,
            );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(isCompact ? 12 : 24),
        child: Flex(
          direction: isCompact ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userMessage, textAlign: TextAlign.center),
            const SizedBox(height: 16, width: 16),
            _createButton(
              name: "Show Error",
              icon: Icons.info_outline,
              onTap: () => showErrorInfoDialog(
                context: context,
                error: error,
                stackTrace: stackTrace,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 2, width: 2),
              _createButton(name: "Retry", icon: Icons.refresh, onTap: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}

void showErrorInfoDialog({
  required BuildContext context,
  required Object error,
  StackTrace? stackTrace,
}) =>
    showDialog(
      context: context,
      builder: (context) => ErrorInfoDialog(error, stackTrace: stackTrace),
    );

class ErrorInfoDialog extends StatelessWidget {
  const ErrorInfoDialog(this.error, {super.key, this.stackTrace});

  final Object error;
  final StackTrace? stackTrace;

  String get _errorType => error.runtimeType.toString();
  String get _errorMessage => error.toString();

  Widget _infoText(String title, String info, {TextStyle? style}) {
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: info),
        ],
      ),
    );
  }

  void _copyError(BuildContext context) {
    final copyText =
        "Type: $_errorType  \nMessage: $_errorMessage  \nStack trace:\n```\n$stackTrace```";

    Clipboard.setData(ClipboardData(text: copyText)).then((_) {
      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Copied error info")),
      );
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding:
          const EdgeInsets.only(top: 28, bottom: 12, left: 28, right: 28),
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
                linkColor: Theme.of(context).colorScheme.primary,
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
    );
  }
}
