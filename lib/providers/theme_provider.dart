import 'package:flutter/material.dart';
import 'package:jsdict/singletons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences _preferences = getPreferences();

  static const _themeKey = "ThemeMode";
  static const _defaultTheme = ThemeMode.system;
  static const themes = ["System", "Light", "Dark"];

  String _currentTheme = "";

  ThemeMode get currentTheme {
    if (_currentTheme.isNotEmpty) {
      return _themeFromString(_currentTheme);
    }

    final preferenceTheme = _preferences.getString(_themeKey);

    if (preferenceTheme == null) {
      return _defaultTheme;
    }

    return _themeFromString(preferenceTheme);
  }

  void setTheme(String name) {
    _currentTheme = name;
    notifyListeners();
    _preferences.setString(_themeKey, name);
  }

  String get currentThemeString => switch (currentTheme) {
    ThemeMode.system => "System",
    ThemeMode.light => "Light",
    ThemeMode.dark => "Dark",
  };

  ThemeMode _themeFromString(String name) => switch (name) {
    "System" => ThemeMode.system,
    "Light" => ThemeMode.light,
    "Dark" => ThemeMode.dark,
    _ => throw Exception("Unknown theme: $name"),
  };
}