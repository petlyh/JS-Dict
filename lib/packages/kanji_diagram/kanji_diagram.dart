import "package:jsdict/packages/kanji_diagram/extensions.dart";
import "package:jsdict/packages/kanji_diagram/style.dart";
import "package:xml/xml.dart";

/// A class for generating stroke order diagrams for kanji.
class KanjiDiagram {
  /// [darkTheme] determines whether to use colors suitable for a dark theme.
  KanjiDiagram({required bool darkTheme}) : style = Style(darkTheme);

  final Style style;

  static const diagramSize = 200;
  static const canvasHeight = diagramSize ~/ 2;
  static const frameSize = diagramSize ~/ 2;

  void addGlobalGuides(XmlBuilder builder, int canvasWidth) {
    builder.line(style.boundingBox, 1, 1, canvasWidth - 1, 1);
    builder.line(
      style.guideLine,
      0,
      canvasHeight ~/ 2,
      canvasWidth,
      canvasHeight ~/ 2,
    );

    // For aesthetic reasons, left and bottom guides are not shown.
    // builder.line(style.boundingBox, 1, 1, 1, canvasHeight - 1);
    // builder.line(style.boundingBox, 1, canvasHeight - 1, canvasWidth - 1,
    //     canvasHeight - 1);
  }

  void addFrameGuideLine(XmlBuilder builder) => builder.line(
        style.guideLine,
        frameSize ~/ 2,
        1,
        frameSize - (frameSize ~/ 2),
        canvasHeight - 1,
      );

  void addFrameBoundingBox(XmlBuilder builder) => builder.line(
        style.boundingBox,
        frameSize - 1,
        1,
        frameSize - 1,
        canvasHeight - 1,
      );

  static final strokePattern = RegExp(
    r"^[LMT]\s*(\d+(?:\.\d+)?)[,\s](\d+(?:\.\d+)?)",
    caseSensitive: false,
  );

  void addStartPoint(XmlBuilder builder, String pathData) {
    final match = strokePattern.firstMatch(pathData)!;

    builder.element(
      "circle",
      nest: () {
        builder.style(Style.startPoint);
        builder.attribute("cx", match.group(1));
        builder.attribute("cy", match.group(2));
        builder.attribute("r", 4);
      },
    );
  }

  XmlElement createPathElement(String pathData) => XmlElement.tag(
        "path",
        attributes: [XmlAttribute(XmlName("d"), pathData)],
      );

  void addStrokes(XmlBuilder builder, List<String> paths) {
    var pathIndex = 1;
    final drawnPaths = <String>[];

    for (final currentPath in paths) {
      final xOffset = frameSize * (pathIndex - 1);

      builder.element(
        "g",
        nest: () {
          builder.attribute("transform", "translate($xOffset)");
          addFrameGuideLine(builder);

          if (pathIndex < paths.length) {
            addFrameBoundingBox(builder);
          }

          builder.element(
            "g",
            nest: () {
              // Offset strokes to align with grid.
              // Likely needed because we're using translate instead of matrix.
              builder.attribute("transform", "translate(-4, -4)");

              // Add previously drawn paths.
              for (final drawnPath in drawnPaths) {
                builder.copyElement(
                  createPathElement(drawnPath).withStyle(style.existingStroke),
                );
              }

              // Add current path and starting point.
              builder.copyElement(
                createPathElement(currentPath).withStyle(style.currentStroke),
              );

              addStartPoint(builder, currentPath);
            },
          );
        },
      );

      drawnPaths.add(currentPath);
      pathIndex++;
    }
  }

  /// Generate SVG data for a kanji stroke order diagram.
  ///
  /// [inputData] must be the contents of a KanjiVG file.
  ///
  /// Note: The KanjiVG file format is an extension of SVG.
  String create(List<String> paths) {
    final builder = XmlBuilder();

    builder.element(
      "svg",
      nest: () {
        final canvasWidth = (paths.length * diagramSize) ~/ 2;
        builder.attribute("viewBox", "0 0 $canvasWidth $canvasHeight");

        builder.element(
          "g",
          nest: () {
            builder.style(Style.global);

            addGlobalGuides(builder, canvasWidth);
            addStrokes(builder, paths);
          },
        );
      },
    );

    return builder.buildDocument().toXmlString();
  }
}
