import "package:flutter/material.dart";
import "package:jsdict/packages/copy.dart";
import "package:share_plus/share_plus.dart";
import "package:url_launcher/url_launcher.dart";

void showActionDialog(BuildContext context, List<ActionTile> actions) =>
    showModalBottomSheet(
      context: context,
      builder: (_) => ActionDialog(actions: actions),
      showDragHandle: true,
    );

class ActionDialog extends StatelessWidget {
  const ActionDialog({super.key, required this.actions});

  final List<ActionTile> actions;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: actions,
    );
  }
}

List<ActionTile> urlActionTiles(String url) => [
      BrowserActionTile(url),
      ShareActionTile(url),
      CopyActionTile("link", url),
    ];

sealed class ActionTile extends StatelessWidget {
  const ActionTile({super.key});

  IconData get icon;
  String get text;
  Function(BuildContext context) get onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.of(context).pop();
        onTap(context);
      },
    );
  }
}

class CopyActionTile extends ActionTile {
  const CopyActionTile(this.name, this.data, {super.key});

  final String name;
  final String data;

  @override
  IconData get icon => Icons.copy;
  @override
  String get text => "Copy $name";
  @override
  Function(BuildContext) get onTap =>
      (context) => copyText(context, data, name: name);
}

class ShareActionTile extends ActionTile {
  const ShareActionTile(this.url, {super.key});

  final String url;

  @override
  IconData get icon => Icons.share;
  @override
  String get text => "Share link";
  @override
  Function(BuildContext) get onTap =>
      (context) => Share.shareUri(Uri.parse(url));
}

class BrowserActionTile extends ActionTile {
  const BrowserActionTile(this.url, {super.key});

  final String url;

  @override
  IconData get icon => Icons.open_in_browser;
  @override
  String get text => "Open in Browser";
  @override
  Function(BuildContext) get onTap => (context) =>
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}
