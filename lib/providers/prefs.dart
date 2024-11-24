import "package:flutter/material.dart";
import "package:podprefs/podprefs.dart";

final prefThemeMode = createMappedPreference("ThemeMode", ThemeMode.system, {
  ThemeMode.system: "System",
  ThemeMode.light: "Light",
  ThemeMode.dark: "Dark",
});

final prefDynamicColors = createBoolPreference("DynamicColors", true);
