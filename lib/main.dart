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
      yield LicenseEntryWithLineBreaks(["KanjiVg"],
          await rootBundle.loadString("assets/kanjivg/LICENSE.kanjivg.txt"));
    });

const mainColor = Color(0xFF27CA27);

class JsDictApp extends StatelessWidget {
  const JsDictApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => QueryProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ],
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return MaterialApp(
              title: "JS-Dict",
              themeMode: themeProvider.currentTheme,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: themeProvider.dynamicColors ? lightDynamic : null,
                colorSchemeSeed:
                    (lightDynamic == null || !themeProvider.dynamicColors)
                        ? mainColor
                        : null,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                useMaterial3: true,
                colorScheme: themeProvider.dynamicColors ? darkDynamic : null,
                colorSchemeSeed:
                    (darkDynamic == null || !themeProvider.dynamicColors)
                        ? mainColor
                        : null,
              ),
              home: const SearchScreen(),
            );
          });
    });
  }
}
