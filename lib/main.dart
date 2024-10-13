import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/providers/theme_provider.dart";
import "package:jsdict/screens/search/search_screen.dart";
import "package:jsdict/singletons.dart";
import "package:provider/provider.dart";

void main() async {
  await registerSingletons();
  registerKanjivgLicense();
  runApp(const JsDictApp());
}

void registerKanjivgLicense() => LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(
        ["KanjiVg"],
        await rootBundle.loadString("assets/kanjivg/LICENSE.kanjivg.txt"),
      );
    });

class JsDictApp extends StatelessWidget {
  const JsDictApp({super.key});

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
  ///
  /// See https://github.com/material-foundation/flutter-packages/issues/582
  ColorScheme? _fixDynamicScheme(ColorScheme? scheme) => scheme?.copyWith(
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

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => QueryProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ],
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return MaterialApp(
              title: _createTitle("JS-Dict"),
              themeMode: themeProvider.currentTheme,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: themeProvider.dynamicColors
                    ? _fixDynamicScheme(lightDynamic)
                    : null,
                colorSchemeSeed:
                    (lightDynamic == null || !themeProvider.dynamicColors)
                        ? _mainColor
                        : null,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                useMaterial3: true,
                colorScheme: themeProvider.dynamicColors
                    ? _fixDynamicScheme(darkDynamic)
                    : null,
                colorSchemeSeed:
                    (darkDynamic == null || !themeProvider.dynamicColors)
                        ? _mainColor
                        : null,
              ),
              home: const SearchScreen(),
            );
          },
        );
      },
    );
  }
}
