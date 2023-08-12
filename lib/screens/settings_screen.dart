import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/material.dart";
import "package:jsdict/providers/theme_provider.dart";
import "package:provider/provider.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => Scaffold(
              appBar: AppBar(title: const Text("Settings")),
              body: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.water_drop, size: 32.0),
                    title: const Text("Theme"),
                    trailing: Consumer<ThemeProvider>(
                        builder: (context, provider, _) {
                      return DropdownButton(
                        value: provider.currentThemeString,
                        items: ThemeProvider.themes
                            .map((theme) => DropdownMenuItem(
                                value: theme, child: Text(theme)))
                            .toList(),
                        onChanged: (value) => provider.setTheme(value!),
                      );
                    }),
                  ),
                  if (lightDynamic != null || darkDynamic != null)
                    ListTile(
                      leading: const Icon(Icons.format_color_fill, size: 32.0),
                      title: const Text("Dynamic Colors"),
                      trailing: Consumer<ThemeProvider>(
                        builder: (context, provider, _) => Switch(
                          value: provider.dynamicColors,
                          onChanged: provider.setDynamicColors,
                        ),
                      ),
                    ),
                  const Divider(),
                  ListTile(
                    onTap: () => showAboutDialog(
                      context: context,
                      applicationVersion: "0.0.1",
                      applicationLegalese: "Licensed under GPLv3.",
                    ),
                    leading: const Icon(Icons.info, size: 32.0),
                    title: const Text("About"),
                  ),
                ],
              ),
            ));
  }
}
