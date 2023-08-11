import "package:flutter/material.dart";

void Function() screenPusher(BuildContext context, Widget screen) {
  return () => pushScreen(context, screen);
}

void pushScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}