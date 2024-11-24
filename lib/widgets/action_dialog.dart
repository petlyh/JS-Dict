import "package:flutter/material.dart";
import "package:jsdict/packages/copy.dart";
import "package:share_plus/share_plus.dart";
import "package:url_launcher/url_launcher.dart";

void showActionDialog(BuildContext context, List<ActionTile> actions) =>
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: actions,
        ),
      ),
      showDragHandle: true,
    );

class ActionTile extends StatelessWidget {
  const ActionTile.text(this.text, {this.name = "Text"}) : url = null;

  const ActionTile.url(this.url)
      : name = "Link",
        text = null;

  final String name;
  final String? text;
  final String? url;

  void _onCopy(BuildContext context) =>
      copyText(context, url ?? text!, name: name.toLowerCase());

  void _onShare(BuildContext context) =>
      url != null ? Share.shareUri(Uri.parse(url!)) : Share.share(text!);

  void _onOpenBrowser(BuildContext context) =>
      launchUrl(Uri.parse(url!), mode: LaunchMode.externalApplication);

  void _pop(BuildContext context, void Function(BuildContext) callback) {
    Navigator.of(context).pop();
    callback(context);
  }

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
          if (url != null)
            IconButton(
              tooltip: "Open in Browser",
              onPressed: () => _pop(context, _onOpenBrowser),
              icon: const Icon(Icons.open_in_browser),
            ),
          IconButton(
            tooltip: "Copy",
            onPressed: () => _pop(context, _onCopy),
            icon: const Icon(Icons.copy),
          ),
          IconButton(
            tooltip: "Share",
            onPressed: () => _pop(context, _onShare),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}
