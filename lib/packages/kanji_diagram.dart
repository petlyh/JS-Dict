import "package:collection/collection.dart";
import "package:xml/xml.dart";

const _diagramSize = 200;
const _canvasHeight = _diagramSize ~/ 2;
const _frameSize = _canvasHeight;

/// Generate SVG data for a kanji stroke order diagram.
///
/// [paths] must be a list of SVG path definitions
/// for a kanji from KanjiVg.
String generateStrokeOrderDiagram(List<String> paths, Style style) {
  final canvasWidth = (paths.length * _diagramSize) ~/ 2;

  final rootElement = _createElement(
    "svg",
    {"viewBox": "0 0 $canvasWidth $_canvasHeight"},
    [
      _createElement(
        "g",
        {"style": style.global},
        [
          ..._createGlobalGuides(canvasWidth, style),
          ..._createStrokes(paths, style),
        ],
      ),
    ],
  );

  return XmlDocument([rootElement]).toXmlString();
}

List<XmlElement> _createStrokes(List<String> paths, Style style) =>
    paths.foldIndexed([], (index, previous, currentPath) {
      final drawnPaths = paths.sublist(0, index);

      final strokes = [
        ...drawnPaths
            .map(_createPathElement)
            .map((e) => e.withStyle(style.existingStroke)),
        _createPathElement(currentPath).withStyle(style.currentStroke),
        _createStartPoint(currentPath, style),
      ];

      final xOffset = _frameSize * index;
      final isLast = index == (paths.length - 1);

      return [
        ...previous,
        _createElement(
          "g",
          {"transform": "translate($xOffset)"},
          [
            _createFrameGuideLine(style),
            if (!isLast) _createFrameBoundingBox(style),
            _createElement("g", {"transform": "translate(-4, -4)"}, strokes),
          ],
        ),
      ];
    });

XmlElement _createPathElement(String pathData) =>
    _createElement("path", {"d": pathData});

XmlElement _createStartPoint(String pathData, Style style) {
  final strokePattern = RegExp(
    r"^[LMT]\s*(\d+(?:\.\d+)?)[,\s](\d+(?:\.\d+)?)",
    caseSensitive: false,
  );

  final match = strokePattern.firstMatch(pathData)!;

  return _createElement(
    "circle",
    {"cx": match.group(1), "cy": match.group(2), "r": "4"},
  ).withStyle(style.startPoint);
}

XmlElement _createFrameGuideLine(Style style) => _createLine(
      _frameSize ~/ 2,
      1,
      _frameSize - (_frameSize ~/ 2),
      _canvasHeight - 1,
    ).withStyle(style.guideLine);

XmlElement _createFrameBoundingBox(Style style) =>
    _createLine(_frameSize - 1, 1, _frameSize - 1, _canvasHeight - 1)
        .withStyle(style.boundingBox);

List<XmlElement> _createGlobalGuides(int canvasWidth, Style style) => [
      _createLine(1, 1, canvasWidth - 1, 1).withStyle(style.boundingBox),
      _createLine(0, _canvasHeight ~/ 2, canvasWidth, _canvasHeight ~/ 2)
          .withStyle(style.guideLine),
    ];

XmlElement _createLine(int x1, int y1, int x2, int y2) =>
    _createElement("line", {"x1": x1, "y1": y1, "x2": x2, "y2": y2});

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

extension _WithStyleExtension on XmlElement {
  XmlElement withStyle(String style) => copy()..setAttribute("style", style);
}

class Style {
  const Style(this.isDark);

  final bool isDark;

  String get lineColor => isDark ? "#444" : "#ddd";
  String get currentStrokeColor => isDark ? "#eee" : "#000";
  String get existingStrokeColor => isDark ? "#999" : "#aaa";

  String get boundingBox =>
      "stroke-width:2;stroke-linecap:square;stroke:$lineColor";
  String get guideLine => "$boundingBox;stroke-dasharray:5,5";

  String get currentStroke => "stroke:$currentStrokeColor";
  String get existingStroke => "stroke:$existingStrokeColor";

  String get global =>
      "fill:none;stroke-width:3;stroke-linecap:round;stroke-linejoin:round";

  String get startPoint => "fill:rgba(255,0,0,0.7);stroke:none";
}
