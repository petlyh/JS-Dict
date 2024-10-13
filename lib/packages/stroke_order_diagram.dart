import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:xml/xml.dart";

const _diagramSize = 200;
const _canvasHeight = _diagramSize ~/ 2;
const _frameSize = _canvasHeight;

/// Generate SVG data for a kanji stroke order diagram.
///
/// [paths] must be a list of SVG path definitions
/// for a kanji from KanjiVg.
String generateStrokeOrderDiagram({
  required List<String> paths,
  required ColorScheme scheme,
}) {
  final styleData = _StyleData(scheme: scheme);
  final canvasWidth = (paths.length * _diagramSize) ~/ 2;

  final rootElement = _createElement(
    "svg",
    {"viewBox": "0 0 $canvasWidth $_canvasHeight"},
    [
      _createElement(
        "g",
        {"style": styleData.global},
        [
          ..._createGlobalGuides(canvasWidth, styleData),
          ..._createStrokes(paths, styleData),
        ],
      ),
    ],
  );

  return XmlDocument([rootElement]).toXmlString();
}

List<XmlElement> _createStrokes(List<String> paths, _StyleData styleData) =>
    paths.foldIndexed([], (index, previous, currentPath) {
      final drawnPaths = paths.sublist(0, index);

      final strokes = [
        ...drawnPaths
            .map((path) => _createPathElement(path, styleData.existingStroke)),
        _createPathElement(currentPath, styleData.currentStroke),
        _createStartPoint(currentPath, styleData),
      ];

      final xOffset = _frameSize * index;
      final isLast = index == (paths.length - 1);

      return [
        ...previous,
        _createElement(
          "g",
          {"transform": "translate($xOffset)"},
          [
            _createFrameGuideLine(styleData),
            if (!isLast) _createFrameBoundingBox(styleData),
            _createElement("g", {"transform": "translate(-4, -4)"}, strokes),
          ],
        ),
      ];
    });

XmlElement _createPathElement(String pathData, [String? style]) =>
    _createElement("path", {"d": pathData, if (style != null) "style": style});

XmlElement _createStartPoint(String pathData, _StyleData styleData) {
  final strokePattern = RegExp(
    r"^[LMT]\s*(\d+(?:\.\d+)?)[,\s](\d+(?:\.\d+)?)",
    caseSensitive: false,
  );

  final match = strokePattern.firstMatch(pathData)!;

  return _createElement(
    "circle",
    {
      "cx": match.group(1),
      "cy": match.group(2),
      "r": "4",
      "style": styleData.startPoint,
    },
  );
}

XmlElement _createFrameGuideLine(_StyleData styleData) => _createLine(
      _frameSize ~/ 2,
      1,
      _frameSize - (_frameSize ~/ 2),
      _canvasHeight - 1,
      styleData.guideLine,
    );

XmlElement _createFrameBoundingBox(_StyleData styleData) => _createLine(
      _frameSize - 1,
      1,
      _frameSize - 1,
      _canvasHeight - 1,
      styleData.boundingBox,
    );

List<XmlElement> _createGlobalGuides(int canvasWidth, _StyleData styleData) => [
      _createLine(1, 1, canvasWidth - 1, 1, styleData.boundingBox),
      _createLine(
        0,
        _canvasHeight ~/ 2,
        canvasWidth,
        _canvasHeight ~/ 2,
        styleData.guideLine,
      ),
    ];

XmlElement _createLine(int x1, int y1, int x2, int y2, [String? style]) =>
    _createElement("line", {
      "x1": x1,
      "y1": y1,
      "x2": x2,
      "y2": y2,
      if (style != null) "style": style,
    });

XmlElement _createElement(
  String name,
  Map<String, Object?> attributes, [
  List<XmlElement>? children,
]) =>
    XmlElement.tag(
      name,
      attributes: attributes.entries.map(
        (entry) => XmlAttribute(
          XmlName.fromString(entry.key),
          entry.value.toString(),
        ),
      ),
      children: children ?? [],
    );

class _StyleData {
  const _StyleData({required this.scheme});

  final ColorScheme scheme;

  String get _lineColor => scheme.surfaceContainerHigh.css;
  String get _startPointColor => scheme.primary.withOpacity(0.7).css;
  String get _currentStrokeColor => scheme.primary.css;
  String get _existingStrokeColor => ElevationOverlay.applySurfaceTint(
        scheme.surfaceContainerHighest,
        scheme.primary,
        5,
      ).css;

  String get global =>
      "fill:none;stroke-width:3;stroke-linecap:round;stroke-linejoin:round";

  String get startPoint => "fill:$_startPointColor;stroke:none";

  String get boundingBox =>
      "stroke-width:2;stroke-linecap:square;stroke:$_lineColor";

  String get guideLine => "$boundingBox;stroke-dasharray:5,5";

  String get currentStroke => "stroke:$_currentStrokeColor";
  String get existingStroke => "stroke:$_existingStrokeColor";
}

extension _ColorToCss on Color {
  String get css =>
      "rgba($red,$green,$blue,${(alpha / 255).toStringAsFixed(2)})";
}
