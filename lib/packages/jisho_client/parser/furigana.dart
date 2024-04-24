part of "parser.dart";

Furigana _parseSentenceFurigana(Element element) {
  final nodes =
      element.querySelector("ul.japanese_sentence, ul.japanese")!.nodes;

  return nodes.map((node) {
    if (node.nodeType == Node.TEXT_NODE) {
      return FuriganaPart.textOnly(node.text!.trim());
    } else {
      final element = (node as Element);
      final text =
          element.querySelector("span.unlinked")!.firstChild!.text!.trim();
      final furiganaElement = element.querySelector("span.furigana");
      if (furiganaElement == null) {
        return FuriganaPart.textOnly(text);
      } else {
        final furiganaText = furiganaElement.text.trim();
        return FuriganaPart(text, furiganaText);
      }
    }
  }).toList();
}

List<String> _limitTextPartsSize(List<String> list, int size) =>
    list.sublist(0, size - 1) + [list.sublist(size - 1).join("")];

bool _hasEmpty(List<String> list) =>
    list.firstWhereOrNull((part) => part.isEmpty) != null;

Furigana _parseWordFurigana(Element element) {
  if (element.querySelector("span.furigana > ruby") != null) {
    return _parseRubyFurigana(element);
  }

  final furiganaParts = element
      .querySelectorAll(
          "div.concept_light-representation > span.furigana > span")
      .map((e) => e.text.trim())
      .toList();

  if (furiganaParts.length == 1) {
    final text = element
        .querySelector("div.concept_light-representation > span.text")!
        .transform((e) => e.text.trim());
    return [FuriganaPart(text, furiganaParts.first)];
  }

  var textParts = element
      .querySelector("div.concept_light-representation > span.text")!
      .nodes
      .map((node) {
        final text = node.text!.trim();
        // split kanji if it's a text node
        return node.nodeType == Node.TEXT_NODE ? text.split("") : [text];
      })
      // flatten list
      .expand((e) => e)
      .toList();

  if (textParts.length > furiganaParts.length) {
    textParts = _limitTextPartsSize(textParts, furiganaParts.length);
  }

  assert(furiganaParts.length == textParts.length);

  final text = textParts.join("");

  // kanji compounds that don't specify ruby locations
  if (isKanji(text) && _hasEmpty(furiganaParts)) {
    return [FuriganaPart(text, furiganaParts.join(""))];
  }

  return textParts
      .mapIndexed((index, text) => FuriganaPart(text, furiganaParts[index]))
      .toList();
}

Furigana _parseRubyFurigana(Element element) {
  final furiganaParts = element
      .querySelectorAll("div.concept_light-representation > span.furigana > *")
      .map(
        (e) => e.localName == "ruby"
            ? e.querySelector("rt")!.text.trim()
            : e.text.trim(),
      )
      .toList();

  final textParts = element
      .querySelector("div.concept_light-representation > span.text")!
      .nodes
      .map((node) => node.text!.trim())
      .whereNot((text) => text.isEmpty)
      .toList();

  assert(furiganaParts.length == textParts.length);

  return textParts
      .mapIndexed((index, text) => FuriganaPart(text, furiganaParts[index]))
      .toList();
}
