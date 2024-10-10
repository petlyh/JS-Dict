part of "parser.dart";

WikipediaInfo? _parseWikipediaInfo(Element element) {
  if (element.querySelector("span.meaning-abstract") == null) {
    return null;
  }

  final title = element.querySelector("span.meaning-meaning")!.trimmedText;

  final text = element
      .querySelector("span.meaning-abstract")
      ?.transform((e) => e.nodes.first.text!);

  return WikipediaInfo(
    title: title,
    textAbstract: text != null ? _parseWikipediaAbstract(title, text) : null,
    wikipediaEnglish: _parseWikipediaPage(element, "English Wikipedia"),
    wikipediaJapanese: _parseWikipediaPage(element, "Japanese Wikipedia"),
    dbpedia: _parseWikipediaPage(element, "DBpedia"),
  );
}

WikipediaPage? _parseWikipediaPage(Element definitionElement, String name) =>
    definitionElement
        .querySelectorAll("span.meaning-abstract > a")
        .firstWhereOrNull((e) => e.text.contains(name))
        ?.transform(
          (e) => WikipediaPage(
            title: RegExp("“(.+?)”").firstMatch(e.text)!.group(1)!,
            url: Uri.parse(e.attributes["href"]!)
                // Query parameter for page version is removed
                .replace(queryParameters: {}).toString(),
          ),
        );

final _abstractFixPattern = RegExp(r"^(?:is |was |, |\()");

String _parseWikipediaAbstract(String title, String text) =>
    _abstractFixPattern.hasMatch(text) ? "$title $text" : text;
