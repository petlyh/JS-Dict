import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:jsdict/packages/kanji_diagram/kanji_diagram.dart";
import "package:jsdict/providers/theme_provider.dart";
import "package:jsdict/widgets/future_loader.dart";
import "package:provider/provider.dart";

class StrokeDiagramWidget extends StatelessWidget {
  const StrokeDiagramWidget(this.kanjiCode, {super.key});

  final String kanjiCode;

  Future<List<String>?> loadPaths() async =>
      (await rootBundle.loadString("assets/kanjivg/kanjivg_data"))
          .split("\n")
          .where((line) => line.startsWith(kanjiCode))
          .map((line) => line.split(":").lastOrNull?.split("_"))
          .firstOrNull;

  @override
  Widget build(BuildContext context) {
    return FutureLoader(
      onLoad: loadPaths,
      handler: (data) {
        if (data == null) {
          return const SizedBox();
        }

        return ExpansionTileCard(
          shadowColor: Theme.of(context).colorScheme.shadow,
          title: const Text("Stroke Order Diagram"),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BrightnessBuilder(
                builder: (context, brightness) {
                  return SvgPicture.string(
                    KanjiDiagram(darkTheme: brightness == Brightness.dark)
                        .create(data),
                    height: 90,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Builder that provides the current [Brightness] value of the app.
///
/// Rebuilds itself when [ThemeProvider] is modified and when the
/// platform brightness is changed if [ThemeMode.system] is selected.
class BrightnessBuilder extends StatelessWidget {
  const BrightnessBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, Brightness brightness) builder;

  Brightness getBrightness(BuildContext context, ThemeMode themeMode) {
    if (themeMode == ThemeMode.system) {
      return Theme.of(context).brightness;
    }

    return themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MediaQuery(
          data: const MediaQueryData(),
          child: Builder(
            builder: (context) => builder(
              context,
              getBrightness(context, themeProvider.currentTheme),
            ),
          ),
        );
      },
    );
  }
}
