import 'package:flutter/material.dart';

class QueryProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  String _query = "";
  String get query => _query;

  void updateQuery() {
    _sanitizeQuery();
    _query = searchController.text;
    notifyListeners();
  }

  void _sanitizeQuery() {
    searchController.text = searchController.text.replaceAll(RegExp(r"#\w+"), "").trim();
  }
}