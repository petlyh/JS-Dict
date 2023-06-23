import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:jsdict/providers/query_provider.dart';
import 'package:jsdict/providers/theme_provider.dart';
import 'package:jsdict/screens/search/search_screen.dart';
import 'package:jsdict/singletons.dart';
import 'package:provider/provider.dart';

void main() async {
  await registerSingletons();
  runApp(const JsDictApp());
}

const mainColor = Color(0xFF27CA27);

class JsDictApp extends StatelessWidget {
  const JsDictApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => QueryProvider()),
              ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ],
            builder: (context, _) => MaterialApp(
              title: "JS-Dict",
              themeMode: Provider.of<ThemeProvider>(context).currentTheme,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightDynamic,
                colorSchemeSeed: lightDynamic == null ? mainColor : null,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                useMaterial3: true,
                colorScheme: darkDynamic,
                colorSchemeSeed: darkDynamic == null ? mainColor : null,
              ),
              home: const SearchScreen(),
            ),
        );
      }
    );
  }
}