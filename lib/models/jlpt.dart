part of "models.dart";

enum JLPTLevel {
  n1, n2, n3, n4, n5, none;

  @override
  String toString() {
    return switch (this) {
      n1 => "N1",
      n2 => "N2",
      n3 => "N3",
      n4 => "N4",
      n5 => "N5",
      _ => "",
    };
  }

  static JLPTLevel fromString(String level) {
    return switch (level.toLowerCase()) {
      "n1" => n1,
      "n2" => n2,
      "n3" => n3,
      "n4" => n4,
      "n5" => n5,
      _ =>  none,
    };
  }

  static JLPTLevel findInText(String text) {
    final pattern = RegExp(r"JLPT (N\d)");
    final match = pattern.firstMatch(text.toUpperCase());
    if (match == null) return none;
    return fromString(match.group(1)!);
  }
}