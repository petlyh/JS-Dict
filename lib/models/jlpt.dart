part of "models.dart";

enum JLPTLevel {
  n1,
  n2,
  n3,
  n4,
  n5;

  @override
  String toString() => switch (this) {
        n1 => "N1",
        n2 => "N2",
        n3 => "N3",
        n4 => "N4",
        n5 => "N5",
      };

  static JLPTLevel? fromString(String level) => switch (level.toLowerCase()) {
        "n1" => n1,
        "n2" => n2,
        "n3" => n3,
        "n4" => n4,
        "n5" => n5,
        _ => null,
      };
}
