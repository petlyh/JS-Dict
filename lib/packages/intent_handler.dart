import "dart:async";

import "package:app_links/app_links.dart";
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:jsdict/packages/is_kanji.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/remove_tags.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/kanji_details/kanji_details_screen.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:receive_sharing_intent/receive_sharing_intent.dart";

void useIntentHandler({required TabController tabController}) => use(
      _IntentHandlerHook(tabController),
    );

class _IntentHandlerHook extends Hook<void> {
  const _IntentHandlerHook(this.tabController);

  final TabController tabController;

  @override
  HookState<void, _IntentHandlerHook> createState() =>
      _IntentHandlerHookState();
}

class _IntentHandlerHookState extends HookState<void, _IntentHandlerHook> {
  late final StreamSubscription<List<SharedMediaFile>> _shareStream;
  late final StreamSubscription<Uri> _linkStream;

  @override
  void initHook() {
    ReceiveSharingIntent.instance
        .getInitialMedia()
        .then(_handleShare, onError: _showError);

    _shareStream = ReceiveSharingIntent.instance
        .getMediaStream()
        .listen(_handleShare, onError: _showError);

    _linkStream = AppLinks().uriLinkStream.listen(
          _handleLink,
          onError: _showError,
        );
  }

  @override
  void dispose() {
    _linkStream.cancel();
    _shareStream.cancel();
  }

  void _showError(dynamic error) {
    if (context.mounted) {
      showErrorInfoDialog(context: context, error: error as Object);
    }
  }

  void _handleShare(List<SharedMediaFile> files) => _search(
        files.firstWhereOrNull((file) => file.mimeType == "text/plain")?.path,
      );

  void _handleLink(Uri url) {
    final data = url.pathSegments.last;

    switch (url.pathSegments.first) {
      case "word":
        _push(WordDetailsScreen(data));
      case "sentences":
        _push(SentenceDetailsScreen.id(data));
      case "search":
        final rawQuery = removeTags(data).trim();

        // If it's a kanji search with only one character,
        // then it's a link to the details page for that kanji.
        if (_containsTag(data, "kanji") &&
            rawQuery.length == 1 &&
            isKanji(rawQuery)) {
          return _push(KanjiDetailsScreen.id(rawQuery));
        }

        _search(data);
    }
  }

  void _push(Widget widget) {
    if (context.mounted) {
      pushScreen(context, widget).call();
    }
  }

  /// Navigates to the search screen and initiates a search for [query].
  void _search(String? query) {
    if (query == null || !context.mounted) {
      return;
    }

    hook.tabController.index = _tabIndex(query);
    QueryProvider.of(context).query = removeTags(query);
    popAll(context);
  }

  /// Returns a tab index based on what search type tag (if any) is found in [searchQuery].
  ///
  /// If none is found, 0 (word tab) is returned.
  int _tabIndex(String query) =>
      ["word", "kanji", "name", "sentence"]
          .indexed
          .where((entry) => _containsTag(query, entry.$2))
          .map((entry) => entry.$1)
          .firstOrNull ??
      0;

  /// Returns true if [query] contains a [tag] tag.
  bool _containsTag(String query, String tag) =>
      RegExp(r"(?:^|\s)#" + tag + r"s?(?:$|\s)", caseSensitive: false)
          .hasMatch(query);

  @override
  void build(BuildContext context) {}

  @override
  String get debugLabel => "useIntentHandler";
}
