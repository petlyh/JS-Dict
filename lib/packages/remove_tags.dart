String removeTags(String input) => input
    .replaceAll(RegExp(r"(?<= |^)#[A-Za-z0-9-]+"), "")
    .trim()
    .replaceAll(RegExp(r"\s+"), " ")
    .replaceFirst(RegExp(" \"\$"), "\"");
  
String removeTypeTags(String input) => input
  .replaceAll(RegExp(r'(?<= |^)#(words?|kanji|names?|sentences?)(?=\s|"|$)', caseSensitive: false), "")
  .trim()
  .replaceAll(RegExp(r"\s+"), " ")
  .replaceFirst(RegExp(" \"\$"), "\"");
