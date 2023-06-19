import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

List<PopupMenuEntry> createLinkPopupItems(List<(String text, String url)> data) {
  return data
      .map((entry) => PopupMenuItem(
        child: Text(entry.$1),
        onTap: () => launchUrlString(entry.$2),
      ))
      .toList();
}

List<PopupMenuEntry> Function(BuildContext) linkPopupItemsBuilder(List<(String text, String url)> data) {
  return (context) => createLinkPopupItems(data);
}