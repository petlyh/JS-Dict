# KanjiVg data

Data from [KanjiVg](https://kanjivg.tagaini.net/index.html) is used to generate the kanji stroke order diagrams. While the generation is done at runtime, the following preprocessing is applied to reduce the file size impact of bundling this data.

Currently used commit: [d642ea9](https://github.com/KanjiVG/kanjivg/tree/d642ea972efa70dc5155d7fb62b9a6eea92585d6)

## Preprocessing

```sh
$ git clone https://github.com/KanjiVG/kanjivg
$ dart run process.dart kanjivg/kanji/ kanjivg_data
```

## License

KanjiVG is copyright Ulrich Apel and released under the Creative Commons Attribution-Share Alike 3.0 licence. The license text can be found in the `LICENSE.kanjivg.txt` file in this directory and at the Creative Commons website: http://creativecommons.org/licenses/by-sa/3.0/