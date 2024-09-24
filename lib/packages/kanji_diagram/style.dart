class Style {
  final bool darkTheme;

  String get lineColor => darkTheme ? "#444" : "#ddd";
  String get currentStrokeColor => darkTheme ? "#eee" : "#000";
  String get existingStrokeColor => darkTheme ? "#999" : "#aaa";

  static const _lineCommon = "stroke-width:2;stroke-linecap:square";
  String get boundingBox => "$_lineCommon;stroke:$lineColor";
  String get guideLine => "$boundingBox;stroke-dasharray:5,5";

  String get currentStroke => "stroke:$currentStrokeColor";
  String get existingStroke => "stroke:$existingStrokeColor";

  const Style(this.darkTheme);

  static const global =
      "fill:none;stroke-width:3;stroke-linecap:round;stroke-linejoin:round";

  static const startPoint = "fill:rgba(255,0,0,0.7);stroke:none";
}
