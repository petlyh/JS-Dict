import "package:collection/collection.dart";
import "package:jsdict/packages/deduplicate.dart";

import "package:jsdict/packages/radical_search/kanji_radicals.dart";

List<String> kanjiByRadicals(List<String> radicals) => kanjiRadicals.entries
    .where(
      (entry) => radicals
          .where(
            (radical) => !entry.value.contains(radical),
          )
          .isEmpty,
    )
    .map((entry) => entry.key)
    .toList();

List<String> findValidRadicals(List<String> kanjiList) => kanjiList
    .map((kanji) => kanjiRadicals[kanji]!)
    .flattened
    .deduplicated
    .toList();

const Map<int, String> radicalsByStrokeCount = {
  1: "一｜丶ノ乙亅",
  2: "二亠人⺅𠆢儿入ハ丷冂冖冫几凵刀⺉力勹匕匚十卜卩厂厶又マ九ユ乃𠂉",
  3: "⻌口囗土士夂夕大女子宀寸小⺌尢尸屮山川巛工已巾干幺广廴廾弋弓ヨ彑彡彳⺖⺘⺡⺨⺾⻏⻖也亡及久",
  4: "⺹心戈戸手支攵文斗斤方无日曰月木欠止歹殳比毛氏气水火⺣爪父爻爿片牛犬⺭王元井勿尤五屯巴毋",
  5: "玄瓦甘生用田疋疒癶白皮皿目矛矢石示禸禾穴立⻂世巨冊母⺲牙",
  6: "瓜竹米糸缶羊羽而耒耳聿肉自至臼舌舟艮色虍虫血行衣西",
  7: "臣見角言谷豆豕豸貝赤走足身車辛辰酉釆里舛麦",
  8: "金長門隶隹雨青非奄岡免斉",
  9: "面革韭音頁風飛食首香品",
  10: "馬骨高髟鬥鬯鬲鬼竜韋",
  11: "魚鳥鹵鹿麻亀啇黄黒",
  12: "黍黹無歯",
  13: "黽鼎鼓鼠",
  14: "鼻齊",
  17: "龠",
};
