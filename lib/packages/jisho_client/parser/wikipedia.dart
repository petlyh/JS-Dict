part of "parser.dart";

Option<WikipediaInfo> _parseWikipediaInfo(Element element) => Option.Do(($) {
      final title = $(element.queryOption(".meaning-meaning")).text.trim();

      final text = $(
        element
            .queryOption(".meaning-abstract")
            .flatMap((abstractElement) => abstractElement.nodes.firstOption)
            .flatMap((node) => node.textOption),
      );

      return WikipediaInfo(
        title: title,
        textAbstract: _parseWikipediaAbstract(title, text),
        wikipediaEnglish: _parseWikipediaPage(
          element,
          "English Wikipedia",
        ).toNullable(),
        wikipediaJapanese: _parseWikipediaPage(
          element,
          "Japanese Wikipedia",
        ).toNullable(),
        dbpedia: _parseWikipediaPage(element, "DBpedia").toNullable(),
      );
    });

Option<WikipediaPage> _parseWikipediaPage(
  Element definitionElement,
  String name,
) =>
    definitionElement
        .querySelectorAll(".meaning-abstract > a")
        .where((element) => element.text.contains(name))
        .firstOption
        .flatMap(
          (element) => Option.Do(
            ($) => WikipediaPage(
              title: $(
                RegExp("“(.+?)”")
                    .firstMatchOption(element.text)
                    .flatMap((match) => match.groupOption(1)),
              ),
              url: $(element.attributes.extract<String>("href").map(Uri.parse))
                  // Query parameter for page version is removed
                  .replace(queryParameters: {}).toString(),
            ),
          ),
        );

final _abstractFixPattern = RegExp(r"^(?:is |was |, |\()");

String _parseWikipediaAbstract(String title, String text) =>
    _abstractFixPattern.hasMatch(text) ? "$title $text" : text;
