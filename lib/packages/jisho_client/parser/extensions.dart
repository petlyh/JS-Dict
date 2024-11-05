part of "parser.dart";

extension _IterableOption<T> on Iterable<T> {
  Option<T> getOption(int index) => skip(index).firstOption;
}

extension _WhereSome<T extends Object> on Iterable<Option<T>> {
  Iterable<T> whereSome() => map((option) => option.toNullable()).nonNulls;
}

extension _DocumentExtensions on Document {
  Option<Element> queryOption(String selector) => Option.fromNullable(body)
      .flatMap((element) => element.queryOption(selector));

  bool hasElement(String selector) => queryOption(selector).isSome();
}

extension _ElementExtensions on Element {
  Option<Element> queryOption(String selector) =>
      Option.fromNullable(querySelector(selector));

  Option<Element> get nextElementSiblingOption =>
      Option.fromNullable(nextElementSibling);

  Option<Element> get previousElementSiblingOption =>
      Option.fromNullable(previousElementSibling);

  bool hasElement(String selector) => queryOption(selector).isSome();
}

extension _NodeOption on Node {
  Option<String> get textOption => Option.fromNullable(text);

  Option<Node> get firstChildOption => Option.fromNullable(firstChild);
}

extension _ElementsTrimmedText on List<Element> {
  List<String> get allTrimmedText =>
      map((element) => element.text.trim()).toList();
}

extension _RegExpOption on RegExp {
  Option<RegExpMatch> firstMatchOption(String input) =>
      Option.fromNullable(firstMatch(input));
}

extension _RegExpMatchOption on RegExpMatch {
  Option<String> groupOption(int group) =>
      Option.fromNullable(this.group(group));
}
