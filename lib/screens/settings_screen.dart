import "package:dynamic_color/dynamic_color.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jsdict/providers/prefs.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:podprefs/podprefs.dart";

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
              trailing: _EnumPref(
                preference: prefThemeMode,
                stringMap: const {
                  ThemeMode.system: "System",
                  ThemeMode.light: "Light",
                  ThemeMode.dark: "Dark",
                },
              ),
            ),
            if (dynamicColorScheme != null)
              ListTile(
                leading: const Icon(Icons.format_color_fill, size: 32),
                title: const Text("Dynamic Colors"),
                trailing: _BoolPref(preference: prefDynamicColors),
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

class _EnumPref<T> extends ConsumerWidget {
  const _EnumPref({required this.preference, required this.stringMap});

  final Preference<T> preference;
  final Map<T, String> stringMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton(
      value: ref.watch(preference),
      items: stringMap.entries
          .map(
            (entry) => DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            ),
          )
          .toList(),
      onChanged: (value) => ref.read(preference.notifier).update(value as T),
    );
  }
}

class _BoolPref extends ConsumerWidget {
  const _BoolPref({required this.preference});

  final Preference<bool> preference;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Switch(
      value: ref.watch(preference),
      onChanged: ref.read(preference.notifier).update,
    );
  }
}
