import "package:jsdict/models/models.dart";
import "package:jsdict/packages/inflection.dart";
import "package:test/test.dart";

void main() {
  test("Code to name", () {
    _testCodeName("見る", "v1", "Ichidan verb");
    _testCodeName("呼ぶ", "v5b", "Godan verb with 'bu' ending");
    _testCodeName("騒ぐ", "v5g", "Godan verb with 'gu' ending");
    _testCodeName("聞く", "v5k", "Godan verb with 'ku' ending");
    _testCodeName("行く", "v5k-s", "Godan verb - Iku/Yuku special class");
    _testCodeName("望む", "v5m", "Godan verb with 'mu' ending");
    _testCodeName("死ぬ", "v5n", "Godan verb with 'nu' ending");
    _testCodeName("乗る", "v5r", "Godan verb with 'ru' ending");
    _testCodeName("返す", "v5s", "Godan verb with 'su' ending");
    _testCodeName("育つ", "v5t", "Godan verb with 'tsu' ending");
    _testCodeName("違う", "v5u", "Godan verb with 'u' ending");
    _testCodeName("屯する", "vs-i", "Suru verb - included");
    _testCodeName("来る", "vk", "Kuru verb - special class");
  });

  test(
    "I-adjective",
    () => _testStringData("寒い", "adj-i", {
      "Non-past": ("寒い", "寒くない"),
      "Past": ("寒かった", "寒くなかった"),
    }),
  );

  test(
    "Ichidan verb",
    () => _testStringData("上げる", "v1", {
      "Non-past": ("上げる", "上げない"),
      "Non-past, polite": ("上げます", "上げません"),
      "Past": ("上げた", "上げなかった"),
      "Past, polite": ("上げました", "上げませんでした"),
      "Te-form": ("上げて", "上げなくて"),
      "Potential": ("上げられる", "上げられない"),
      "Passive": ("上げられる", "上げられない"),
      "Causative": ("上げさせる", "上げさせない"),
      "Causative, Passive": ("上げさせられる", "上げさせられない"),
      "Imperative": ("上げろ", "上げるな"),
    }),
  );

  test(
    "Godan verb with u ending",
    () => _testStringData("歌う", "v5u", {
      "Non-past": ("歌う", "歌わない"),
      "Non-past, polite": ("歌います", "歌いません"),
      "Past": ("歌った", "歌わなかった"),
      "Past, polite": ("歌いました", "歌いませんでした"),
      "Te-form": ("歌って", "歌わなくて"),
      "Potential": ("歌える", "歌えない"),
      "Passive": ("歌われる", "歌われない"),
      "Causative": ("歌わせる", "歌わせない"),
      "Causative, Passive": ("歌わせられる", "歌わせられない"),
      "Imperative": ("歌え", "歌うな"),
    }),
  );

  test(
    "Godan verb with mu ending",
    () => _testStringData("占む", "v5m", {
      "Non-past": ("占む", "占まない"),
      "Non-past, polite": ("占みます", "占みません"),
      "Past": ("占んだ", "占まなかった"),
      "Past, polite": ("占みました", "占みませんでした"),
      "Te-form": ("占んで", "占まなくて"),
      "Potential": ("占める", "占めない"),
      "Passive": ("占まれる", "占まれない"),
      "Causative": ("占ませる", "占ませない"),
      "Causative, Passive": ("占ませられる", "占ませられない"),
      "Imperative": ("占め", "占むな"),
    }),
  );

  test(
    "Godan verb with su ending",
    () => _testStringData("渡す", "v5s", {
      "Non-past": ("渡す", "渡さない"),
      "Non-past, polite": ("渡します", "渡しません"),
      "Past": ("渡した", "渡さなかった"),
      "Past, polite": ("渡しました", "渡しませんでした"),
      "Te-form": ("渡して", "渡さなくて"),
      "Potential": ("渡せる", "渡せない"),
      "Passive": ("渡される", "渡されない"),
      "Causative": ("渡させる", "渡させない"),
      "Causative, Passive": ("渡させられる", "渡させられない"),
      "Imperative": ("渡せ", "渡すな"),
    }),
  );

  test(
    "Godan verb with tsu ending",
    () => _testStringData("待つ", "v5t", {
      "Non-past": ("待つ", "待たない"),
      "Non-past, polite": ("待ちます", "待ちません"),
      "Past": ("待った", "待たなかった"),
      "Past, polite": ("待ちました", "待ちませんでした"),
      "Te-form": ("待って", "待たなくて"),
      "Potential": ("待てる", "待てない"),
      "Passive": ("待たれる", "待たれない"),
      "Causative": ("待たせる", "待たせない"),
      "Causative, Passive": ("待たせられる", "待たせられない"),
      "Imperative": ("待て", "待つな"),
    }),
  );

  test(
    "Godan verb with nu ending",
    () => _testStringData("死ぬ", "v5n", {
      "Non-past": ("死ぬ", "死なない"),
      "Non-past, polite": ("死にます", "死にません"),
      "Past": ("死んだ", "死ななかった"),
      "Past, polite": ("死にました", "死にませんでした"),
      "Te-form": ("死んで", "死ななくて"),
      "Potential": ("死ねる", "死ねない"),
      "Passive": ("死なれる", "死なれない"),
      "Causative": ("死なせる", "死なせない"),
      "Causative, Passive": ("死なせられる", "死なせられない"),
      "Imperative": ("死ね", "死ぬな"),
    }),
  );

  test(
    "Godan verb with ru ending",
    () => _testStringData("巡る", "v5r", {
      "Non-past": ("巡る", "巡らない"),
      "Non-past, polite": ("巡ります", "巡りません"),
      "Past": ("巡った", "巡らなかった"),
      "Past, polite": ("巡りました", "巡りませんでした"),
      "Te-form": ("巡って", "巡らなくて"),
      "Potential": ("巡れる", "巡れない"),
      "Passive": ("巡られる", "巡られない"),
      "Causative": ("巡らせる", "巡らせない"),
      "Causative, Passive": ("巡らせられる", "巡らせられない"),
      "Imperative": ("巡れ", "巡るな"),
    }),
  );

  test(
    "Godan verb with bu ending",
    () => _testStringData("遊ぶ", "v5b", {
      "Non-past": ("遊ぶ", "遊ばない"),
      "Non-past, polite": ("遊びます", "遊びません"),
      "Past": ("遊んだ", "遊ばなかった"),
      "Past, polite": ("遊びました", "遊びませんでした"),
      "Te-form": ("遊んで", "遊ばなくて"),
      "Potential": ("遊べる", "遊べない"),
      "Passive": ("遊ばれる", "遊ばれない"),
      "Causative": ("遊ばせる", "遊ばせない"),
      "Causative, Passive": ("遊ばせられる", "遊ばせられない"),
      "Imperative": ("遊べ", "遊ぶな"),
    }),
  );

  test(
    "Godan verb with ku ending",
    () => _testStringData("焼く", "v5k", {
      "Non-past": ("焼く", "焼かない"),
      "Non-past, polite": ("焼きます", "焼きません"),
      "Past": ("焼いた", "焼かなかった"),
      "Past, polite": ("焼きました", "焼きませんでした"),
      "Te-form": ("焼いて", "焼かなくて"),
      "Potential": ("焼ける", "焼けない"),
      "Passive": ("焼かれる", "焼かれない"),
      "Causative": ("焼かせる", "焼かせない"),
      "Causative, Passive": ("焼かせられる", "焼かせられない"),
      "Imperative": ("焼け", "焼くな"),
    }),
  );

  test(
    "Godan verb with gu ending",
    () => _testStringData("泳ぐ", "v5g", {
      "Non-past": ("泳ぐ", "泳がない"),
      "Non-past, polite": ("泳ぎます", "泳ぎません"),
      "Past": ("泳いだ", "泳がなかった"),
      "Past, polite": ("泳ぎました", "泳ぎませんでした"),
      "Te-form": ("泳いで", "泳がなくて"),
      "Potential": ("泳げる", "泳げない"),
      "Passive": ("泳がれる", "泳がれない"),
      "Causative": ("泳がせる", "泳がせない"),
      "Causative, Passive": ("泳がせられる", "泳がせられない"),
      "Imperative": ("泳げ", "泳ぐな"),
    }),
  );

  test(
    "Godan verb - Iku/Yuku special class",
    () => _testStringData("行く", "v5k-s", {
      "Non-past": ("行く", "行かない"),
      "Non-past, polite": ("行きます", "行きません"),
      "Past": ("行った", "行かなかった"),
      "Past, polite": ("行きました", "行きませんでした"),
      "Te-form": ("行って", "行かなくて"),
      "Potential": ("行ける", "行けない"),
      "Passive": ("行かれる", "行かれない"),
      "Causative": ("行かせる", "行かせない"),
      "Causative, Passive": ("行かせられる", "行かせられない"),
      "Imperative": ("行け", "行くな"),
    }),
  );

  test(
    "Kuru verb",
    () => _testFuriganaData("来る", "vk", {
      "Non-past": ([("来", "く"), "る"], [("来", "こ"), "ない"]),
      "Non-past, polite": ([("来", "き"), "ます"], [("来", "き"), "ません"]),
      "Past": ([("来", "き"), "た"], [("来", "こ"), "なかった"]),
      "Past, polite": ([("来", "き"), "ました"], [("来", "き"), "ませんでした"]),
      "Te-form": ([("来", "き"), "て"], [("来", "こ"), "なくて"]),
      "Potential": ([("来", "こ"), "られる"], [("来", "こ"), "られない"]),
      "Passive": ([("来", "こ"), "られる"], [("来", "こ"), "られない"]),
      "Causative": ([("来", "こ"), "させる"], [("来", "こ"), "させない"]),
      "Causative, Passive": (
        [("来", "こ"), "させられる"],
        [("来", "こ"), "させられない"],
      ),
      "Imperative": ([("来", "こ"), "い"], [("来", "く"), "るな"]),
    }),
  );

  test(
    "Suru special class",
    () => _testFuriganaData("為る", "vs-i", {
      "Non-past": ([("為", "す"), "る"], [("為", "し"), "ない"]),
      "Past": ([("為", "し"), "た"], [("為", "し"), "なかった"]),
      "Non-past, polite": ([("為", "し"), "ます"], [("為", "し"), "ません"]),
      "Past, polite": ([("為", "し"), "ました"], [("為", "し"), "ませんでした"]),
      "Te-form": ([("為", "し"), "て"], [("為", "し"), "なくて"]),
      "Potential": (["できる"], ["できない"]),
      "Passive": ([("為", "さ"), "れる"], [("為", "さ"), "れない"]),
      "Causative": ([("為", "さ"), "せる"], [("為", "さ"), "せない"]),
      "Causative, Passive": ([("為", "さ"), "せられる"], [("為", "さ"), "せられない"]),
      "Imperative": ([("為", "し"), "ろ"], [("為", "す"), "るな"]),
    }),
  );

  test(
    "Suru verb",
    () => _testStringData("恋する", "vs-i", {
      "Non-past": ("恋する", "恋しない"),
      "Past": ("恋した", "恋しなかった"),
      "Non-past, polite": ("恋します", "恋しません"),
      "Past, polite": ("恋しました", "恋しませんでした"),
      "Te-form": ("恋して", "恋しなくて"),
      "Potential": ("恋できる", "恋できない"),
      "Passive": ("恋される", "恋されない"),
      "Causative": ("恋させる", "恋させない"),
      "Causative, Passive": ("恋させられる", "恋させられない"),
      "Imperative": ("恋しろ", "恋するな"),
    }),
  );
}

void _testCodeName(String word, String code, String expectedName) =>
    expect(InflectionData(word, code).name, equals(expectedName));

void _testStringData(
  String word,
  String code,
  Map<String, (String, String)> expected,
) =>
    _testData(
      word,
      code,
      expected.map(
        (key, value) => MapEntry(
          key,
          (
            affermative: value.$1.furigana,
            negative: value.$2.furigana,
          ),
        ),
      ),
    );

Furigana _furigana(Iterable<dynamic> input) => input
    .map(
      (e) => e is (String, String)
          ? FuriganaPart(e.$1, e.$2)
          : FuriganaPart(e.toString()),
    )
    .toList();

void _testFuriganaData(
  String word,
  String code,
  Map<String, (Iterable<dynamic>, Iterable<dynamic>)> expected,
) =>
    _testData(
      word,
      code,
      expected.map(
        (key, value) => MapEntry(
          key,
          (
            affermative: _furigana(value.$1),
            negative: _furigana(value.$2),
          ),
        ),
      ),
    );

void _testData(
  String word,
  String code,
  Map<String, InflectionEntry> expected,
) {
  final actual = InflectionData(word, code).toMap();

  expect(actual, hasLength(expected.length));

  for (final entry in expected.entries) {
    expect(
      actual,
      containsPair(entry.key, _InflectionEntryMatcher(entry.value)),
      reason: entry.key,
    );
  }
}

class _InflectionEntryMatcher extends Matcher {
  final InflectionEntry expected;

  const _InflectionEntryMatcher(this.expected);

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    if (item is! InflectionEntry) {
      return false;
    }

    orderedEquals(expected.affermative).matches(item.affermative, matchState);
    orderedEquals(expected.negative).matches(item.negative, matchState);

    if (matchState.isNotEmpty) {
      matchState["actual"] = item.toString();
      return false;
    }

    return true;
  }

  @override
  Description describe(Description description) =>
      description.add(expected.toString());

  @override
  Description describeMismatch(
    _,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool __,
  ) =>
      mismatchDescription.add(matchState["actual"] as String);
}
