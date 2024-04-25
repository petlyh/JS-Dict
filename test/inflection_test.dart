import "package:jsdict/models/models.dart";
import "package:jsdict/packages/inflection/inflection.dart";
import "package:test/test.dart";

void main() {
  test("Inflection.getType", () {
    final kanashii = Inflection.getType("悲しい", "adj-i");
    expect(kanashii, isA<IAdjective>());

    final arifureru = Inflection.getType("あり触れる", "v1");
    expect(arifureru, isA<IchidanVerb>());

    final noboru = Inflection.getType("上る", "v5r");
    expect(noboru, isA<GodanVerb>());

    final iku = Inflection.getType("行く", "v5k-s");
    expect(iku, isA<GodanVerb>());

    final kuru = Inflection.getType("来る", "vk");
    expect(kuru, isA<Kuru>());

    final suru = Inflection.getType("為る", "vs-i");
    expect(suru, isA<SuruSpecial>());

    final koisuru = Inflection.getType("恋する", "vs-i");
    expect(koisuru, isA<SuruVerb>());
  });

  test("I-adjective", () {
    final InflectionType samui = IAdjective("寒い");
    expect(samui.name, equals("I-adjective"));

    expect(samui.nonPast(true), equals("寒い"));
    expect(samui.past(true), equals("寒かった"));
    expect(samui.nonPast(false), equals("寒くない"));
    expect(samui.past(false), equals("寒くなかった"));
  });

  test("Ichidan verb", () {
    final Verb ageru = IchidanVerb("上げる");
    expect(ageru.name, equals("Ichidan verb"));

    expect(ageru.nonPast(true), equals("上げる"));
    expect(ageru.nonPastPolite(true), equals("上げます"));
    expect(ageru.past(true), equals("上げた"));
    expect(ageru.pastPolite(true), equals("上げました"));
    expect(ageru.teForm(true), equals("上げて"));
    expect(ageru.potential(true), equals("上げられる"));
    expect(ageru.passive(true), equals("上げられる"));
    expect(ageru.causative(true), equals("上げさせる"));
    expect(ageru.causativePassive(true), equals("上げさせられる"));
    expect(ageru.imperative(true), equals("上げろ"));

    expect(ageru.nonPast(false), equals("上げない"));
    expect(ageru.nonPastPolite(false), equals("上げません"));
    expect(ageru.past(false), equals("上げなかった"));
    expect(ageru.pastPolite(false), equals("上げませんでした"));
    expect(ageru.teForm(false), equals("上げなくて"));
    expect(ageru.potential(false), equals("上げられない"));
    expect(ageru.passive(false), equals("上げられない"));
    expect(ageru.causative(false), equals("上げさせない"));
    expect(ageru.causativePassive(false), equals("上げさせられない"));
    expect(ageru.imperative(false), equals("上げるな"));
  });

  test("Godan verb with u ending", () {
    final Verb utau = GodanVerb("歌う", "u");
    expect(utau.name, equals("Godan verb with u ending"));

    expect(utau.nonPast(true), equals("歌う"));
    expect(utau.nonPastPolite(true), equals("歌います"));
    expect(utau.past(true), equals("歌った"));
    expect(utau.pastPolite(true), equals("歌いました"));
    expect(utau.teForm(true), equals("歌って"));
    expect(utau.potential(true), equals("歌える"));
    expect(utau.passive(true), equals("歌われる"));
    expect(utau.causative(true), equals("歌わせる"));
    expect(utau.causativePassive(true), equals("歌わせられる"));
    expect(utau.imperative(true), equals("歌え"));

    expect(utau.nonPast(false), equals("歌わない"));
    expect(utau.nonPastPolite(false), equals("歌いません"));
    expect(utau.past(false), equals("歌わなかった"));
    expect(utau.pastPolite(false), equals("歌いませんでした"));
    expect(utau.teForm(false), equals("歌わなくて"));
    expect(utau.potential(false), equals("歌えない"));
    expect(utau.passive(false), equals("歌われない"));
    expect(utau.causative(false), equals("歌わせない"));
    expect(utau.causativePassive(false), equals("歌わせられない"));
    expect(utau.imperative(false), equals("歌うな"));
  });

  test("Godan verb with mu ending", () {
    final Verb shimu = GodanVerb("占む", "m");
    expect(shimu.name, equals("Godan verb with mu ending"));

    expect(shimu.nonPast(true), equals("占む"));
    expect(shimu.nonPastPolite(true), equals("占みます"));
    expect(shimu.past(true), equals("占んだ"));
    expect(shimu.pastPolite(true), equals("占みました"));
    expect(shimu.teForm(true), equals("占んで"));
    expect(shimu.potential(true), equals("占める"));
    expect(shimu.passive(true), equals("占まれる"));
    expect(shimu.causative(true), equals("占ませる"));
    expect(shimu.causativePassive(true), equals("占ませられる"));
    expect(shimu.imperative(true), equals("占め"));

    expect(shimu.nonPast(false), equals("占まない"));
    expect(shimu.nonPastPolite(false), equals("占みません"));
    expect(shimu.past(false), equals("占まなかった"));
    expect(shimu.pastPolite(false), equals("占みませんでした"));
    expect(shimu.teForm(false), equals("占まなくて"));
    expect(shimu.potential(false), equals("占めない"));
    expect(shimu.passive(false), equals("占まれない"));
    expect(shimu.causative(false), equals("占ませない"));
    expect(shimu.causativePassive(false), equals("占ませられない"));
    expect(shimu.imperative(false), equals("占むな"));
  });

  test("Godan verb with su ending", () {
    final Verb watasu = GodanVerb("渡す", "s");
    expect(watasu.name, equals("Godan verb with su ending"));

    expect(watasu.nonPast(true), equals("渡す"));
    expect(watasu.nonPastPolite(true), equals("渡します"));
    expect(watasu.past(true), equals("渡した"));
    expect(watasu.pastPolite(true), equals("渡しました"));
    expect(watasu.teForm(true), equals("渡して"));
    expect(watasu.potential(true), equals("渡せる"));
    expect(watasu.passive(true), equals("渡される"));
    expect(watasu.causative(true), equals("渡させる"));
    expect(watasu.causativePassive(true), equals("渡させられる"));
    expect(watasu.imperative(true), equals("渡せ"));

    expect(watasu.nonPast(false), equals("渡さない"));
    expect(watasu.nonPastPolite(false), equals("渡しません"));
    expect(watasu.past(false), equals("渡さなかった"));
    expect(watasu.pastPolite(false), equals("渡しませんでした"));
    expect(watasu.teForm(false), equals("渡さなくて"));
    expect(watasu.potential(false), equals("渡せない"));
    expect(watasu.passive(false), equals("渡されない"));
    expect(watasu.causative(false), equals("渡させない"));
    expect(watasu.causativePassive(false), equals("渡させられない"));
    expect(watasu.imperative(false), equals("渡すな"));
  });

  test("Godan verb with tsu ending", () {
    final Verb matsu = GodanVerb("待つ", "t");
    expect(matsu.name, equals("Godan verb with tsu ending"));

    expect(matsu.nonPast(true), equals("待つ"));
    expect(matsu.nonPastPolite(true), equals("待ちます"));
    expect(matsu.past(true), equals("待った"));
    expect(matsu.pastPolite(true), equals("待ちました"));
    expect(matsu.teForm(true), equals("待って"));
    expect(matsu.potential(true), equals("待てる"));
    expect(matsu.passive(true), equals("待たれる"));
    expect(matsu.causative(true), equals("待たせる"));
    expect(matsu.causativePassive(true), equals("待たせられる"));
    expect(matsu.imperative(true), equals("待て"));

    expect(matsu.nonPast(false), equals("待たない"));
    expect(matsu.nonPastPolite(false), equals("待ちません"));
    expect(matsu.past(false), equals("待たなかった"));
    expect(matsu.pastPolite(false), equals("待ちませんでした"));
    expect(matsu.teForm(false), equals("待たなくて"));
    expect(matsu.potential(false), equals("待てない"));
    expect(matsu.passive(false), equals("待たれない"));
    expect(matsu.causative(false), equals("待たせない"));
    expect(matsu.causativePassive(false), equals("待たせられない"));
    expect(matsu.imperative(false), equals("待つな"));
  });

  test("Godan verb with nu ending", () {
    final Verb shinu = GodanVerb("死ぬ", "n");
    expect(shinu.name, equals("Godan verb with nu ending"));

    expect(shinu.nonPast(true), equals("死ぬ"));
    expect(shinu.nonPastPolite(true), equals("死にます"));
    expect(shinu.past(true), equals("死んだ"));
    expect(shinu.pastPolite(true), equals("死にました"));
    expect(shinu.teForm(true), equals("死んで"));
    expect(shinu.potential(true), equals("死ねる"));
    expect(shinu.passive(true), equals("死なれる"));
    expect(shinu.causative(true), equals("死なせる"));
    expect(shinu.causativePassive(true), equals("死なせられる"));
    expect(shinu.imperative(true), equals("死ね"));

    expect(shinu.nonPast(false), equals("死なない"));
    expect(shinu.nonPastPolite(false), equals("死にません"));
    expect(shinu.past(false), equals("死ななかった"));
    expect(shinu.pastPolite(false), equals("死にませんでした"));
    expect(shinu.teForm(false), equals("死ななくて"));
    expect(shinu.potential(false), equals("死ねない"));
    expect(shinu.passive(false), equals("死なれない"));
    expect(shinu.causative(false), equals("死なせない"));
    expect(shinu.causativePassive(false), equals("死なせられない"));
    expect(shinu.imperative(false), equals("死ぬな"));
  });

  test("Godan verb with ru ending", () {
    final Verb meguru = GodanVerb("巡る", "r");
    expect(meguru.name, equals("Godan verb with ru ending"));

    expect(meguru.nonPast(true), equals("巡る"));
    expect(meguru.nonPastPolite(true), equals("巡ります"));
    expect(meguru.past(true), equals("巡った"));
    expect(meguru.pastPolite(true), equals("巡りました"));
    expect(meguru.teForm(true), equals("巡って"));
    expect(meguru.potential(true), equals("巡れる"));
    expect(meguru.passive(true), equals("巡られる"));
    expect(meguru.causative(true), equals("巡らせる"));
    expect(meguru.causativePassive(true), equals("巡らせられる"));
    expect(meguru.imperative(true), equals("巡れ"));

    expect(meguru.nonPast(false), equals("巡らない"));
    expect(meguru.nonPastPolite(false), equals("巡りません"));
    expect(meguru.past(false), equals("巡らなかった"));
    expect(meguru.pastPolite(false), equals("巡りませんでした"));
    expect(meguru.teForm(false), equals("巡らなくて"));
    expect(meguru.potential(false), equals("巡れない"));
    expect(meguru.passive(false), equals("巡られない"));
    expect(meguru.causative(false), equals("巡らせない"));
    expect(meguru.causativePassive(false), equals("巡らせられない"));
    expect(meguru.imperative(false), equals("巡るな"));
  });

  test("Godan verb with bu ending", () {
    final Verb asobu = GodanVerb("遊ぶ", "b");
    expect(asobu.name, equals("Godan verb with bu ending"));

    expect(asobu.nonPast(true), equals("遊ぶ"));
    expect(asobu.nonPastPolite(true), equals("遊びます"));
    expect(asobu.past(true), equals("遊んだ"));
    expect(asobu.pastPolite(true), equals("遊びました"));
    expect(asobu.teForm(true), equals("遊んで"));
    expect(asobu.potential(true), equals("遊べる"));
    expect(asobu.passive(true), equals("遊ばれる"));
    expect(asobu.causative(true), equals("遊ばせる"));
    expect(asobu.causativePassive(true), equals("遊ばせられる"));
    expect(asobu.imperative(true), equals("遊べ"));

    expect(asobu.nonPast(false), equals("遊ばない"));
    expect(asobu.nonPastPolite(false), equals("遊びません"));
    expect(asobu.past(false), equals("遊ばなかった"));
    expect(asobu.pastPolite(false), equals("遊びませんでした"));
    expect(asobu.teForm(false), equals("遊ばなくて"));
    expect(asobu.potential(false), equals("遊べない"));
    expect(asobu.passive(false), equals("遊ばれない"));
    expect(asobu.causative(false), equals("遊ばせない"));
    expect(asobu.causativePassive(false), equals("遊ばせられない"));
    expect(asobu.imperative(false), equals("遊ぶな"));
  });

  test("Godan verb with ku ending", () {
    final Verb yaku = GodanVerb("焼く", "k");
    expect(yaku.name, equals("Godan verb with ku ending"));

    expect(yaku.nonPast(true), equals("焼く"));
    expect(yaku.nonPastPolite(true), equals("焼きます"));
    expect(yaku.past(true), equals("焼いた"));
    expect(yaku.pastPolite(true), equals("焼きました"));
    expect(yaku.teForm(true), equals("焼いて"));
    expect(yaku.potential(true), equals("焼ける"));
    expect(yaku.passive(true), equals("焼かれる"));
    expect(yaku.causative(true), equals("焼かせる"));
    expect(yaku.causativePassive(true), equals("焼かせられる"));
    expect(yaku.imperative(true), equals("焼け"));

    expect(yaku.nonPast(false), equals("焼かない"));
    expect(yaku.nonPastPolite(false), equals("焼きません"));
    expect(yaku.past(false), equals("焼かなかった"));
    expect(yaku.pastPolite(false), equals("焼きませんでした"));
    expect(yaku.teForm(false), equals("焼かなくて"));
    expect(yaku.potential(false), equals("焼けない"));
    expect(yaku.passive(false), equals("焼かれない"));
    expect(yaku.causative(false), equals("焼かせない"));
    expect(yaku.causativePassive(false), equals("焼かせられない"));
    expect(yaku.imperative(false), equals("焼くな"));
  });

  test("Godan verb with gu ending", () {
    final Verb oyogu = GodanVerb("泳ぐ", "g");
    expect(oyogu.name, equals("Godan verb with gu ending"));

    expect(oyogu.nonPast(true), equals("泳ぐ"));
    expect(oyogu.nonPastPolite(true), equals("泳ぎます"));
    expect(oyogu.past(true), equals("泳いだ"));
    expect(oyogu.pastPolite(true), equals("泳ぎました"));
    expect(oyogu.teForm(true), equals("泳いで"));
    expect(oyogu.potential(true), equals("泳げる"));
    expect(oyogu.passive(true), equals("泳がれる"));
    expect(oyogu.causative(true), equals("泳がせる"));
    expect(oyogu.causativePassive(true), equals("泳がせられる"));
    expect(oyogu.imperative(true), equals("泳げ"));

    expect(oyogu.nonPast(false), equals("泳がない"));
    expect(oyogu.nonPastPolite(false), equals("泳ぎません"));
    expect(oyogu.past(false), equals("泳がなかった"));
    expect(oyogu.pastPolite(false), equals("泳ぎませんでした"));
    expect(oyogu.teForm(false), equals("泳がなくて"));
    expect(oyogu.potential(false), equals("泳げない"));
    expect(oyogu.passive(false), equals("泳がれない"));
    expect(oyogu.causative(false), equals("泳がせない"));
    expect(oyogu.causativePassive(false), equals("泳がせられない"));
    expect(oyogu.imperative(false), equals("泳ぐな"));
  });

  test("Godan verb - Iku/Yuku special class", () {
    final Verb iku = GodanVerb("行く", "k-s");
    expect(iku.name, equals("Godan verb - Iku/Yuku special class"));

    expect(iku.nonPast(true), equals("行く"));
    expect(iku.nonPastPolite(true), equals("行きます"));
    expect(iku.past(true), equals("行った"));
    expect(iku.pastPolite(true), equals("行きました"));
    expect(iku.teForm(true), equals("行って"));
    expect(iku.potential(true), equals("行ける"));
    expect(iku.passive(true), equals("行かれる"));
    expect(iku.causative(true), equals("行かせる"));
    expect(iku.causativePassive(true), equals("行かせられる"));
    expect(iku.imperative(true), equals("行け"));

    expect(iku.nonPast(false), equals("行かない"));
    expect(iku.nonPastPolite(false), equals("行きません"));
    expect(iku.past(false), equals("行かなかった"));
    expect(iku.pastPolite(false), equals("行きませんでした"));
    expect(iku.teForm(false), equals("行かなくて"));
    expect(iku.potential(false), equals("行けない"));
    expect(iku.passive(false), equals("行かれない"));
    expect(iku.causative(false), equals("行かせない"));
    expect(iku.causativePassive(false), equals("行かせられない"));
    expect(iku.imperative(false), equals("行くな"));
  });

  test("Kuru verb", () {
    final Verb kuru = Kuru();
    expect(kuru.name, equals("Kuru verb - special class"));

    expect(kuru.nonPastFurigana(true).reading, equals("くる"));
    expect(kuru.nonPastPoliteFurigana(true).reading, equals("きます"));
    expect(kuru.pastFurigana(true).reading, equals("きた"));
    expect(kuru.pastPoliteFurigana(true).reading, equals("きました"));
    expect(kuru.teFormFurigana(true).reading, equals("きて"));
    expect(kuru.potentialFurigana(true).reading, equals("こられる"));
    expect(kuru.passiveFurigana(true).reading, equals("こられる"));
    expect(kuru.causativeFurigana(true).reading, equals("こさせる"));
    expect(kuru.causativePassiveFurigana(true).reading, equals("こさせられる"));
    expect(kuru.imperativeFurigana(true).reading, equals("こい"));

    expect(kuru.nonPastFurigana(false).reading, equals("こない"));
    expect(kuru.nonPastPoliteFurigana(false).reading, equals("きません"));
    expect(kuru.pastFurigana(false).reading, equals("こなかった"));
    expect(kuru.pastPoliteFurigana(false).reading, equals("きませんでした"));
    expect(kuru.teFormFurigana(false).reading, equals("こなくて"));
    expect(kuru.potentialFurigana(false).reading, equals("こられない"));
    expect(kuru.passiveFurigana(false).reading, equals("こられない"));
    expect(kuru.causativeFurigana(false).reading, equals("こさせない"));
    expect(kuru.causativePassiveFurigana(false).reading, equals("こさせられない"));
    expect(kuru.imperativeFurigana(false).reading, equals("くるな"));
  });

  test("Suru special class", () {
    final Verb suru = SuruSpecial();
    expect(suru.name, "Suru verb - included");

    expect(suru.nonPastFurigana(true).reading, equals("する"));
    expect(suru.nonPastPoliteFurigana(true).reading, equals("します"));
    expect(suru.pastFurigana(true).reading, equals("した"));
    expect(suru.pastPoliteFurigana(true).reading, equals("しました"));
    expect(suru.teFormFurigana(true).reading, equals("して"));
    expect(suru.potentialFurigana(true).reading, equals("できる"));
    expect(suru.passiveFurigana(true).reading, equals("される"));
    expect(suru.causativeFurigana(true).reading, equals("させる"));
    expect(suru.causativePassiveFurigana(true).reading, equals("させられる"));
    expect(suru.imperativeFurigana(true).reading, equals("しろ"));

    expect(suru.nonPastFurigana(false).reading, equals("しない"));
    expect(suru.nonPastPoliteFurigana(false).reading, equals("しません"));
    expect(suru.pastFurigana(false).reading, equals("しなかった"));
    expect(suru.pastPoliteFurigana(false).reading, equals("しませんでした"));
    expect(suru.teFormFurigana(false).reading, equals("しなくて"));
    expect(suru.potentialFurigana(false).reading, equals("できない"));
    expect(suru.passiveFurigana(false).reading, equals("されない"));
    expect(suru.causativeFurigana(false).reading, equals("させない"));
    expect(suru.causativePassiveFurigana(false).reading, equals("させられない"));
    expect(suru.imperativeFurigana(false).reading, equals("するな"));
  });

  test("Suru verb", () {
    final Verb koisuru = SuruVerb("恋する");
    expect(koisuru.name, "Suru verb - included");

    expect(koisuru.nonPast(true), equals("恋する"));
    expect(koisuru.nonPastPolite(true), equals("恋します"));
    expect(koisuru.past(true), equals("恋した"));
    expect(koisuru.pastPolite(true), equals("恋しました"));
    expect(koisuru.teForm(true), equals("恋して"));
    expect(koisuru.potential(true), equals("恋できる"));
    expect(koisuru.passive(true), equals("恋される"));
    expect(koisuru.causative(true), equals("恋させる"));
    expect(koisuru.causativePassive(true), equals("恋させられる"));
    expect(koisuru.imperative(true), equals("恋しろ"));

    expect(koisuru.nonPast(false), equals("恋しない"));
    expect(koisuru.nonPastPolite(false), equals("恋しません"));
    expect(koisuru.past(false), equals("恋しなかった"));
    expect(koisuru.pastPolite(false), equals("恋しませんでした"));
    expect(koisuru.teForm(false), equals("恋しなくて"));
    expect(koisuru.potential(false), equals("恋できない"));
    expect(koisuru.passive(false), equals("恋されない"));
    expect(koisuru.causative(false), equals("恋させない"));
    expect(koisuru.causativePassive(false), equals("恋させられない"));
    expect(koisuru.imperative(false), equals("恋するな"));
  });
}
