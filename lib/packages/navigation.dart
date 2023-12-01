import "package:flutter/material.dart";

void Function() pushScreen(BuildContext context, Widget screen) =>
    () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

void popAll(BuildContext context) =>
    Navigator.of(context).popUntil((route) => route.isFirst);
