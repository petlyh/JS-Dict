import "package:flutter/material.dart";

class QueryProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  String _query = "";
  String get query => _query;

  void updateQuery() {
    _sanitizeQuery();
    _query = searchController.text;
    notifyListeners();
  }

  void updateQueryIfChanged() {
    if (_query != searchController.text) {
      updateQuery();
    }
  }

  void insertText(String text) {
    final selection = searchController.selection;
    final selectionStart = selection.baseOffset;

    if (selectionStart == -1) {
      searchController.text += text;
    }

    final newText = searchController.text.replaceRange(selectionStart, selection.extentOffset, text);
    searchController.text = newText;
    searchController.selection = TextSelection.collapsed(offset: selectionStart + 1);
  }

  void _sanitizeQuery() {
    searchController.text = searchController.text.replaceAll(RegExp(r"#\w+"), "").trim();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}