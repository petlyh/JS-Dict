part of "parser.dart";

Option<Furigana> _parseSentenceFurigana(Element element) => element
    .queryOption("ul.japanese_sentence, ul.japanese")
    .map((e) => e.nodes.map(_parseSentenceFuriganaPart).whereSome().toList());

Option<FuriganaPart> _parseSentenceFuriganaPart(Node node) => Option.Do(($) {
      if (node.nodeType == Node.TEXT_NODE) {
        final text = $(node.textOption).trim();

        return FuriganaPart(
          $(Option.fromPredicate(text, (t) => t.isNotEmpty)),
        );
      }

      final element = node as Element;

      final unlinked = $(element.queryOption(".unlinked"));
      final unlinkedChild = $(unlinked.firstChildOption);
      final text = $(unlinkedChild.textOption).trim();

      final furigana = element.queryOption(".furigana").map(
            (e) => e.text.trim(),
          );

      return FuriganaPart(text, furigana.toNullable());
    });

Option<Furigana> _parseWordFurigana(Element element) => Option.Do(($) {
      if (element.hasElement(".furigana > ruby")) {
        return $(_parseRubyFurigana(element));
      }

      final furiganaParts = element
          .querySelectorAll(".concept_light-representation > .furigana > span")
          .allTrimmedText;

      if (furiganaParts.length == 1) {
        return [
          FuriganaPart(
            $(element.queryOption(".concept_light-representation > .text"))
                .text
                .trim(),
            $(furiganaParts.firstOption),
          ),
        ];
      }

      final originalTextParts =
          $(element.queryOption(".concept_light-representation > .text"))
              .nodes
              .map(
                (node) => node.textOption.map(
                  // split kanji if it's a text node
                  (text) => node.nodeType == Node.TEXT_NODE
                      ? text.trim().split("")
                      : [text.trim()],
                ),
              )
              .whereSome()
              .flattened
              .toList();

      final textParts = originalTextParts.length > furiganaParts.length
          ? _limitTextPartsSize(originalTextParts, furiganaParts.length)
          : originalTextParts;

      final text = textParts.join();

      // kanji compounds that don't specify ruby locations
      if (isKanjiOnly(text) && _hasEmpty(furiganaParts)) {
        return [FuriganaPart(text, furiganaParts.join())];
      }

      return textParts
          .zip(furiganaParts)
          .map(
            (record) => FuriganaPart(
              record.$1,
              record.$2.isNotEmpty ? record.$2 : null,
            ),
          )
          .toList();
    });

Option<Furigana> _parseRubyFurigana(Element element) => Option.Do(($) {
      final furiganaParts = element
          .querySelectorAll(".concept_light-representation > .furigana > *")
          .map(
            (e) => e.localName == "ruby"
                ? $(e.queryOption("rt")).text.trim()
                : e.text.trim(),
          )
          .toList();

      final textParts = $(
        element.queryOption(".concept_light-representation > .text"),
      )
          .nodes
          .map((node) => $(node.textOption).trim())
          .where((text) => text.isNotEmpty)
          .toList();

      assert(furiganaParts.length == textParts.length);

      return textParts
          .zip(furiganaParts)
          .map((record) => FuriganaPart(record.$1, record.$2))
          .toList();
    });

List<String> _limitTextPartsSize(List<String> list, int size) => [
      ...list.sublist(0, size - 1),
      list.sublist(size - 1).join(),
    ];

bool _hasEmpty(List<String> list) =>
    list.where((part) => part.isEmpty).isNotEmpty;
