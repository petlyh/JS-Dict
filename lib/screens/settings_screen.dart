import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Column(
        children: [
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