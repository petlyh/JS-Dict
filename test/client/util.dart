import "package:test/test.dart";

/// Tests for both object equality and equality of [Object.toString] result.
void expectEquals(Object? actual, Object? expected) {
  expect(actual?.toString(), equals(expected?.toString()));
  expect(actual, equals(expected));
}
