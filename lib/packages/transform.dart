extension TransformExtension<T> on T {
  /// The value modified by [toElement].
  ///
  /// Similar to [Iterable.map], but for a single value.
  R transform<R>(R Function(T value) toElement) => toElement(this);
}
