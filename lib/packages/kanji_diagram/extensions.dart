import "package:xml/xml.dart";

extension XmlBuilderExtension on XmlBuilder {
  void copyElement(XmlElement xmlElement) =>
      xml(xmlElement.copy().toXmlString());

  void style(String styleData) => attribute("style", styleData);
  void opacity(double value) => attribute("opacity", value.toStringAsFixed(2));

  void line(String styleData, int x1, int y1, int x2, int y2) => element(
        "line",
        nest: () {
          style(styleData);
          attribute("x1", x1);
          attribute("y1", y1);
          attribute("x2", x2);
          attribute("y2", y2);
        },
      );
}

extension XmlElementExtension on XmlElement {
  XmlElement withAttribute(String name, String value) {
    final newElement = copy();
    newElement.setAttribute(name, value);
    return newElement;
  }

  XmlElement withStyle(String style) => withAttribute("style", style);
}
