import "dart:async";

import "package:flutter/material.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/remove_tags.dart";
import "package:jsdict/packages/transform.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:receive_sharing_intent/receive_sharing_intent.dart";

/// Handles share intents by using shared 'text/plain' files as a search query.
/// Recieving a shared file will set it as a query, return to the main search screen
/// and set the selected tab to the 'Words' tab.
///
/// Should only be initialized and used in the top-level screen.
class ShareIntentHandler {
  final BuildContext context;
  final TabController tabController;

  late StreamSubscription<List<SharedMediaFile>> _stream;

  /// Creates and initializes a [LinkHandler].
  ///
  /// [context] must be the [BuildContext] for the widget wherein this constructor is called.
  /// [tabController] must be the controller for the tab bar on the search screen.
  ShareIntentHandler(this.context, this.tabController) {
    // Initial share intent handling.
    ReceiveSharingIntent.getInitialMedia()
        .then(_handleShare, onError: _showError);
    // Incoming share intent handling.
    _stream = ReceiveSharingIntent.getMediaStream()
        .listen(_handleShare, onError: _showError);
  }

  /// Cancels the subscription stream that handles incoming share intents.
  Future<void> dispose() => _stream.cancel();

  void _showError(dynamic error) =>
      context.mounted ? showErrorInfoDialog(context, error as Object) : null;

  void _handleShare(List<SharedMediaFile> files) {
    if (files.isEmpty) {
      return;
    }

    final textFile =
        files.where((file) => file.mimeType == "text/plain").firstOrNull;

    if (textFile == null) {
      return;
    }

    final content = textFile.path
        .transform(removeTags)
        .replaceAll(RegExp(r"\s+"), " ")
        .trim();

    if (!context.mounted) {
      return;
    }

    tabController.index = 0;
    QueryProvider.of(context).query = content;
    popAll(context);
  }
}
