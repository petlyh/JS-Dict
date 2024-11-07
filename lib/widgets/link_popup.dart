import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class LinkPopupButton extends StatelessWidget {
  const LinkPopupButton(this.data);

  final List<(String text, String url)> data;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => data
          .map(
            (entry) => PopupMenuItem(
              child: Text(entry.$1),
              onTap: () => launchUrl(
                Uri.parse(entry.$2),
                mode: LaunchMode.externalApplication,
              ),
            ),
          )
          .toList(),
    );
  }
}
