import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:jsdict/jp_text.dart";

class LinkSpan extends TextSpan {
  LinkSpan(BuildContext context,
      {required String text,
      required Function() onTap,
      bool bold = false,
      bool underline = true})
      : super(
            text: text,
            style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: underline ? TextDecoration.underline : null,
                    fontWeight: bold ? FontWeight.w600 : null)
                .jp(),
            recognizer: TapGestureRecognizer()..onTap = onTap);
}
