part of "parser.dart";

WikipediaInfo? _parseWikipediaInfo(Element element) {
  if (element.querySelector("span.meaning-abstract") == null) {
    return null;
  }

  final title = element.collect("span.meaning-meaning", (e) => e.text.trim())!;

  return WikipediaInfo(
    title,
    textAbstract: _parseWikipediaAbstract(title,
        element.collect("span.meaning-abstract", (e) => e.nodes.first.text!)),
    wikipediaEnglish: _parseWikipediaPage(element, "English Wikipedia"),
    wikipediaJapanese: _parseWikipediaPage(element, "Japanese Wikipedia"),
    dbpedia: _parseWikipediaPage(element, "DBpedia"),
  );
}

WikipediaPage? _parseWikipediaPage(Element definitionElement, String name) {
  return definitionElement.collectFirstWhere(
    "span.meaning-abstract > a",
    (e) => e.text.contains(name),
    (e) => WikipediaPage(
        RegExp("“(.+?)”").firstMatch(e.text)!.group(1)!, e.attributes["href"]!),
  );
}

final _abstractFixPattern = RegExp(r"^(?:is |was |, |\()");

String? _parseWikipediaAbstract(String title, String? text) {
  if (text == null) {
    return null;
  }

  return _abstractFixPattern.hasMatch(text) ? "$title $text" : text;
}
