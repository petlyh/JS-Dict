# KanjiVg data

Data from [KanjiVg](https://kanjivg.tagaini.net/index.html) is used to generate the kanji stroke order diagrams. While the generation is done at runtime, the following preprocessing is applied to reduce the file size impact of bundling this data.

Currently used commit: [4c2b391](https://github.com/KanjiVG/kanjivg/tree/4c2b391f36f639002d1198a40a414e9c12bb3cff)

## Preprocessing

```sh
$ git clone https://github.com/KanjiVG/kanjivg
$ dart run process.dart kanjivg/kanji/ kanjivg_data
```

## License

KanjiVG is copyright Ulrich Apel and released under the Creative Commons Attribution-Share Alike 3.0 licence. The license text can be found in the `LICENSE.kanjivg.txt` file in this directory and at the Creative Commons website: http://creativecommons.org/licenses/by-sa/3.0/