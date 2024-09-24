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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  const ActionTile.text(this.name, this.data, {super.key}) : isURL = false;
  const ActionTile.url(this.data, {super.key})
      : isURL = true,
        name = "Link";

  final String name;
  final String data;
  final bool isURL;

  void onCopy(BuildContext context) =>
      copyText(context, data, name: name.toLowerCase());

  void onShare(BuildContext context) =>
      isURL ? Share.shareUri(Uri.parse(data)) : Share.share(data);

  void onOpenBrowser(BuildContext context) =>
      launchUrl(Uri.parse(data), mode: LaunchMode.externalApplication);

  void Function() pop(
    BuildContext context,
    void Function(BuildContext context) callback,
  ) =>
      () {
        Navigator.of(context).pop();
        callback(context);
      };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(name),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isURL)
            IconButton(
              tooltip: "Open in Browser",
              onPressed: pop(context, onOpenBrowser),
              icon: const Icon(Icons.open_in_browser),
            ),
          IconButton(
            tooltip: "Copy",
            onPressed: pop(context, onCopy),
            icon: const Icon(Icons.copy),
          ),
          IconButton(
            tooltip: "Share",
            onPressed: pop(context, onShare),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}
