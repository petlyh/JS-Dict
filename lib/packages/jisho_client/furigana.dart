import "package:collection/collection.dart";
import "package:html/dom.dart";
import "package:jsdict/packages/jisho_client/parsing_helper.dart";
import "package:jsdict/models/models.dart";

Furigana parseSentenceFurigana(Element element) {
  final nodes = element.querySelector("ul.japanese_sentence")!.nodes;

  return nodes.map((node) {
    if (node.nodeType == Node.TEXT_NODE) {
      return FuriganaPart.textOnly(node.text!.trim());
    } else {
      final element = (node as Element);
      final text = element.querySelector("span.unlinked")!.innerHtml.trim();
      final furiganaElement = element.querySelector("span.furigana");
      if (furiganaElement == null) {
        return FuriganaPart.textOnly(text);
      } else {
        final furiganaText = furiganaElement.innerHtml.trim();
        return FuriganaPart(text, furiganaText);
      }
    }
  }).toList();
}

Furigana parseWordFurigana(Element element) {
  if (element.querySelector("span.furigana > ruby") != null) {
    return parseRubyFurigana(element);
  }

  final furiganaParts = element.collectAll(
      "div.concept_light-representation > span.furigana > span",
      (e) => e.text.trim());

  if (furiganaParts.length == 1) {
    final text = element.collect("div.concept_light-representation > span.text", (e) => e.text.trim())!;
    return [FuriganaPart(text, furiganaParts.first)];
  }

  final textParts = element
      .querySelector("div.concept_light-representation > span.text")!
      .nodes
      .map((node) {
        var text = node.text!.trim();
        // split kanji if it's a text node
        return node.nodeType == Node.TEXT_NODE ? text.split("") : [text];
      })
      // flatten list
      .expand((e) => e)
      .toList();

  assert(furiganaParts.length == textParts.length);

  return textParts
      .mapIndexed((index, text) => FuriganaPart(text, furiganaParts[index]))
      .toList();
}

Furigana parseRubyFurigana(Element element) {
  final furiganaParts = element.collectAll(
    "div.concept_light-representation > span.furigana > *",
    (e) => e.localName == "ruby"
        ? e.querySelector("rt")!.text.trim()
        : e.text.trim(),
  );

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
