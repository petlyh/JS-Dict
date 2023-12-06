import "package:flutter/material.dart";
import "package:flutter/services.dart";

void copyText(BuildContext context, String text, {String? name}) =>
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Copied ${name ?? text} to clipboard")),
      );
    });
