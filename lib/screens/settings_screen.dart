import "package:flutter/material.dart";
import "package:jsdict/providers/theme_provider.dart";
import "package:provider/provider.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  items: ThemeProvider.themes.map((theme) =>
                    DropdownMenuItem(value: theme, child: Text(theme))
                  ).toList(),
                  onChanged: (value) => provider.setTheme(value!),
                );
              }
            ),
          ),
          ListTile(
            leading: const Icon(Icons.format_color_fill, size: 32.0),
            title: const Text("Dynamic Colors"),
            subtitle: const Text("Use dynamic colors if available."),
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
    );
  }
}