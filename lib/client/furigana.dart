import 'package:collection/collection.dart';
import 'package:html/dom.dart';
import 'package:jsdict/models.dart';

Furigana parseSentenceFurigana(final Element element) {
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

Furigana parseWordFurigana(final Element element) {
  final furiganaParts = element
      .querySelectorAll("div.concept_light-representation > span.furigana > span")
      .map((element) => element.text.trim())
      .toList();

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
