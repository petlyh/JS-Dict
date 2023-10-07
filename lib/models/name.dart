part of "models.dart";

class Name implements SearchType {
  final String reading;
  final List<String> meanings;

  const Name(this.reading, this.meanings);
}