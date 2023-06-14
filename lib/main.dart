import 'package:flutter/material.dart';
import 'package:jsdict/query_provider.dart';
import 'package:jsdict/screens/search_screen.dart';
import 'package:jsdict/singletons.dart';
import 'package:provider/provider.dart';

void main() {
  setClient();
  runApp(const JsDictApp());
}

class JsDictApp extends StatelessWidget {
  const JsDictApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      title: 'JS-Dict',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF27CA27),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF27CA27),
        brightness: Brightness.dark
      ),
      home: ChangeNotifierProvider(
        create: (_) => QueryProvider(),
        child: const SearchScreen()
      ),
    );
  }
}