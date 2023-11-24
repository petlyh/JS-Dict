/// Allows text breaking.
const zeroWidthSpace = "\u200B";
/// Prevents text breaking.
const zeroWidthNoBreakSpace = "\uFEFF";

extension StringUtilsInternal on String {
  /// The string modified to now allow breaking in the middle of words.
  ///
  /// Has a [zeroWidthNoBreakSpace] added between every character except for spaces.
  ///
  /// Add a [zeroWidthSpace] to allow breaking at a specific point.
  ///
  // https://stackoverflow.com/a/71933168
  String get noBreak => split("")
      .join(zeroWidthNoBreakSpace)
      .replaceAll("$zeroWidthNoBreakSpace $zeroWidthNoBreakSpace", " ");
}
