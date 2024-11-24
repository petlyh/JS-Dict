import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jsdict/providers/prefs.dart";
import "package:jsdict/screens/search/search_screen.dart";
import "package:podprefs/podprefs.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  registerKanjivgLicense();

  runApp(
    ProviderScope(
      overrides: [await initializePreferences()],
      child: const JsDictApp(),
    ),
  );
}

void registerKanjivgLicense() => LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(
        ["KanjiVg"],
        await rootBundle.loadString("assets/kanjivg/LICENSE.kanjivg.txt"),
      );
    });

class JsDictApp extends ConsumerWidget {
  const JsDictApp();

  static const _mainColor = Color(0xFF27CA27);

  /// Returns [title] with an added "Debug" suffix if the app is running in debug mode.
  String _createTitle(String title) {
    var fullTitle = title;
    assert(() {
      fullTitle += " Debug";
      return true;
    }());
    return fullTitle;
  }

  /// Modifies [scheme] to account for dynamic_color not supporting tone-based colors yet.
  /// Also needed to fix surfaceContainerLow for schemes created with [ColorScheme.fromSeed].
  ///
  /// See https://github.com/material-foundation/flutter-packages/issues/582
  ColorScheme _fixScheme(ColorScheme scheme) => scheme.copyWith(
        // Color used for cards, apply tint manually.
        surfaceContainerLow: ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.primary,
          1,
        ),
        surfaceContainerHigh: ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.onSurface,
          5,
        ),
        // ignore: deprecated_member_use
        surfaceContainerHighest: scheme.surfaceVariant,
      );

  ThemeData _createThemeData({
    required ColorScheme? dynamicColorScheme,
    required bool isDynamicColorsEnabled,
    Brightness brightness = Brightness.light,
  }) =>
      ThemeData(
        brightness: brightness,
        colorScheme: _fixScheme(
          isDynamicColorsEnabled && dynamicColorScheme != null
              ? dynamicColorScheme
              : ColorScheme.fromSeed(
                  seedColor: _mainColor,
                  brightness: brightness,
                ),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDynamicColorsEnabled = ref.watch(prefDynamicColors);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        title: _createTitle("JS-Dict"),
        themeMode: ref.watch(prefThemeMode),
        theme: _createThemeData(
          dynamicColorScheme: lightDynamic,
          isDynamicColorsEnabled: isDynamicColorsEnabled,
        ),
        darkTheme: _createThemeData(
          dynamicColorScheme: darkDynamic,
          isDynamicColorsEnabled: isDynamicColorsEnabled,
          brightness: Brightness.dark,
        ),
        home: const SearchScreen(),
      ),
    );
  }
}
