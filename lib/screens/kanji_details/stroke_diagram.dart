import "package:expansion_tile_card/expansion_tile_card.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:jsdict/packages/stroke_order_diagram.dart";
import "package:jsdict/widgets/future_loader.dart";

class StrokeDiagramWidget extends StatelessWidget {
  const StrokeDiagramWidget(this.kanjiCode, {super.key});

  final String kanjiCode;

  Future<List<String>?> _loadPaths() async =>
      (await rootBundle.loadString("assets/kanjivg/kanjivg_data"))
          .split("\n")
          .where((line) => line.startsWith(kanjiCode))
          .map((line) => line.split(":").lastOrNull?.split("_"))
          .firstOrNull;

  @override
  Widget build(BuildContext context) {
    return FutureLoader(
      onLoad: _loadPaths,
      handler: (paths) => paths != null
          ? ExpansionTileCard(
              shadowColor: Theme.of(context).colorScheme.shadow,
              title: const Text("Stroke Order Diagram"),
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SvgPicture.string(
                    generateStrokeOrderDiagram(
                      paths: paths,
                      scheme: Theme.of(context).colorScheme,
                    ),
                    height: 90,
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
