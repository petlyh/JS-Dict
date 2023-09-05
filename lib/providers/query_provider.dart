import "package:flutter/material.dart";
import 'package:jsdict/packages/remove_tags.dart';
import "package:provider/provider.dart";

class QueryProvider extends ChangeNotifier {
  static QueryProvider of(BuildContext context) {
    return Provider.of<QueryProvider>(context, listen: false);
  }

  TextEditingController searchController = TextEditingController();

  String _query = "";
  String get query => _query;

  void sanitizeText() {
    searchController.text =
        searchController.text.trim().replaceAll(RegExp(r"\s+"), " ");
  }

  void updateQuery() {
    sanitizeText();
    _query = searchController.text;
    notifyListeners();
  }

  void updateQueryIfChanged() {
    if (_query != searchController.text) {
      updateQuery();
    }
  }

  void addTag(String tag) {
    sanitizeText();
    if (searchController.text.isNotEmpty) {
      searchController.text += " ";
    }
    searchController.text += "#$tag";
  }

  void clearTags() {
    searchController.text = removeTags(searchController.text);
    sanitizeText();
  }

  void insertText(String text) {
    final selection = searchController.selection;
    final selectionStart = selection.baseOffset;

    if (selectionStart == -1) {
      searchController.text += text;
      return;
    }

    final newText = searchController.text
        .replaceRange(selectionStart, selection.extentOffset, text);
    searchController.text = newText;
    searchController.selection =
        TextSelection.collapsed(offset: selectionStart + 1);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
