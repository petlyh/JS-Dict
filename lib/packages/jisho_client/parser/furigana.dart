part of "parser.dart";

Furigana _parseSentenceFurigana(Element element) => element
    .querySelector("ul.japanese_sentence, ul.japanese")!
    .nodes
    .map((node) {
      if (node.nodeType == Node.TEXT_NODE) {
        final text = node.text!.trim();
        return text.isNotEmpty ? FuriganaPart(text) : null;
      }

      final element = node as Element;
      final text =
          element.querySelector("span.unlinked")!.firstChild!.text!.trim();

      final furiganaElement = element.querySelector("span.furigana");
      return FuriganaPart(text, furiganaElement?.trimmedText);
    })
    .nonNulls
    .toList();

List<String> _limitTextPartsSize(List<String> list, int size) => [
      ...list.sublist(0, size - 1),
      list.sublist(size - 1).join(),
    ];

bool _hasEmpty(List<String> list) =>
    list.firstWhereOrNull((part) => part.isEmpty) != null;

Furigana _parseWordFurigana(Element element) {
  if (element.querySelector("span.furigana > ruby") != null) {
    return _parseRubyFurigana(element);
  }

  final furiganaParts = element
      .querySelectorAll(
        "div.concept_light-representation > span.furigana > span",
      )
      .allTrimmedText;

  if (furiganaParts.length == 1) {
    return [
      FuriganaPart(
        element
            .querySelector("div.concept_light-representation > span.text")!
            .trimmedText,
        furiganaParts.first,
      ),
    ];
  }

  var textParts = element
      .querySelector("div.concept_light-representation > span.text")!
      .nodes
      .map((node) {
        final text = node.text!.trim();
        // split kanji if it's a text node
        return node.nodeType == Node.TEXT_NODE ? text.split("") : [text];
      })
      .flattened
      .toList();

  if (textParts.length > furiganaParts.length) {
    textParts = _limitTextPartsSize(textParts, furiganaParts.length);
  }

  assert(furiganaParts.length == textParts.length);

  final text = textParts.join();

  // kanji compounds that don't specify ruby locations
  if (isKanji(text) && _hasEmpty(furiganaParts)) {
    return [FuriganaPart(text, furiganaParts.join())];
  }

  return textParts.mapIndexed((index, text) {
    final furigana = furiganaParts[index];
    return FuriganaPart(text, furigana.isNotEmpty ? furigana : null);
  }).toList();
}

Furigana _parseRubyFurigana(Element element) {
  final furiganaParts = element
      .querySelectorAll("div.concept_light-representation > span.furigana > *")
      .map(
        (e) => e.localName == "ruby"
            ? e.querySelector("rt")!.trimmedText
            : e.trimmedText,
      )
      .toList();

  final textParts = element
      .querySelector("div.concept_light-representation > span.text")!
      .nodes
      .map((node) => node.text!.trim())
      .where((text) => text.isNotEmpty)
      .toList();

  assert(furiganaParts.length == textParts.length);

  return textParts
      .mapIndexed((index, text) => FuriganaPart(text, furiganaParts[index]))
      .toList();
}
