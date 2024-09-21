import "dart:async";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:jsdict/packages/is_kanji.dart";
import "package:jsdict/packages/navigation.dart";
import "package:jsdict/packages/remove_tags.dart";
import "package:jsdict/packages/transform.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/kanji_details/kanji_details_screen.dart";
import "package:jsdict/screens/sentence_details_screen.dart";
import "package:jsdict/screens/word_details/word_details_screen.dart";
import "package:jsdict/widgets/error_indicator.dart";
import "package:app_links/app_links.dart";

/// Handles app/universal links by opening the corresponding screen.
/// Search links are handled by returning to the top-level search screen
/// and setting the search query and tab.
///
/// Should only be initialized and used in the top-level screen.
class LinkHandler {
  final BuildContext context;
  final TabController tabController;

  late StreamSubscription<Uri?> _stream;

  /// Creates and initializes a [LinkHandler].
  ///
  /// [context] must be the [BuildContext] for the widget wherein this constructor is called.
  /// [tabController] must be the controller for the tab bar on the search screen.
  LinkHandler(this.context, this.tabController) {
    _stream = AppLinks().uriLinkStream.listen(_handleUrl, onError: _showError);
  }

  /// Cancels the subscription stream that handles incoming links.
  Future<void> dispose() => _stream.cancel();

  void _showError(dynamic error) =>
      // Ignore platform message error from intial link.
      context.mounted && error is! PlatformException
          ? showErrorInfoDialog(context, error as Object)
          : null;

  void _handleUrl(Uri? url) {
    if (url == null || !context.mounted) {
      return;
    }

    final type = url.pathSegments.first;
    final data = url.pathSegments.last;

    final widget = switch (type) {
      "word" => WordDetailsScreen(data),
      "sentences" => SentenceDetailsScreen.id(data),
      "search" => () {
          final rawQuery = removeTags(data).trim();

          // Go directly to kanji details if it's
          // a kanji search with only one character
          if (_typeTagRegex("kanji").hasMatch(data) &&
              rawQuery.length == 1 &&
              isKanji(rawQuery)) {
            return KanjiDetailsScreen.id(rawQuery);
          }

          tabController.index = _tabIndex(data);
          QueryProvider.of(context).query = data;
          popAll(context);
        }.call(),
      _ => null,
    };

    if (widget != null) {
      pushScreen(context, widget).call();
    }
  }

  static const _tabs = ["word", "kanji", "name", "sentence"];

  /// Creates a regex pattern that matches a tag
  RegExp _typeTagRegex(String type) =>
      RegExp(r"(?:^|\s)#" + type + r"s?(?:$|\s)", caseSensitive: false);

  /// Returns a tab index based on what search type tag (if any) is found in [searchQuery].
  /// If none is found, 0 (word tab) is returned.
  int _tabIndex(String searchQuery) =>
      _tabs
          .firstWhereOrNull((type) => _typeTagRegex(type).hasMatch(searchQuery))
          ?.transform((value) => _tabs.indexOf(value)) ??
      0;
}
