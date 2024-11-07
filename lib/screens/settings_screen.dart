import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/material.dart";
import "package:jsdict/providers/theme_provider.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:provider/provider.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (dynamicColorScheme, _) => Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.water_drop, size: 32),
              title: const Text("Theme"),
              trailing: Consumer<ThemeProvider>(
                builder: (context, provider, _) {
                  return DropdownButton(
                    value: provider.currentThemeString,
                    items: ThemeProvider.themes
                        .map(
                          (theme) => DropdownMenuItem(
                            value: theme,
                            child: Text(theme),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => provider.setTheme(value!),
                  );
                },
              ),
            ),
            if (dynamicColorScheme != null)
              ListTile(
                leading: const Icon(Icons.format_color_fill, size: 32),
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
              onTap: () async {
                final packageInfo = await PackageInfo.fromPlatform();

                if (context.mounted) {
                  showAboutDialog(
                    context: context,
                    applicationVersion: packageInfo.version,
                    applicationLegalese: "Licensed under GPLv3.",
                  );
                }
              },
              leading: const Icon(Icons.info, size: 32),
              title: const Text("About"),
            ),
          ],
        ),
      ),
    );
  }
}
