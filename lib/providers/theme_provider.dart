import "package:flutter/material.dart";
import "package:jsdict/singletons.dart";
import "package:shared_preferences/shared_preferences.dart";

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences _preferences = getPreferences();

  static const _themeKey = "ThemeMode";
  static const _defaultThemeString = "System";
  static const themes = ["System", "Light", "Dark"];

  ThemeMode get currentTheme => switch (currentThemeString) {
        "System" => ThemeMode.system,
        "Light" => ThemeMode.light,
        "Dark" => ThemeMode.dark,
        _ => throw Exception("Unknown theme: $currentThemeString"),
      };

  String get currentThemeString =>
      _preferences.getString(_themeKey) ?? _defaultThemeString;

  void setTheme(String name) async {
    await _preferences.setString(_themeKey, name);
    notifyListeners();
  }

  static const _dynamicColorsKey = "DynamicColors";
  bool get dynamicColors => _preferences.getBool(_dynamicColorsKey) ?? true;

  void setDynamicColors(bool value) async {
    await _preferences.setBool(_dynamicColorsKey, value);
    notifyListeners();
  }
}
