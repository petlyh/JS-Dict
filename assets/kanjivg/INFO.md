# KanjiVg data

Data from [KanjiVg](https://kanjivg.tagaini.net/index.html) is used to generate the kanji stroke order diagrams. While the generation is done at runtime, the following preprocessing is applied to reduce the file size impact of bundling these files.

Currently used commit: [3ec0014](https://github.com/KanjiVG/kanjivg/tree/3ec001413336228e91e4317fbdbd8ddab526d284)

## Preprocessing

1. Remove variants (Kaisho, Insatsu, etc.)

    These are unneeded, as the app only shows diagrams for the main schoolbook style.

    ```sh
    $ fd '-' -e svg --batch-size 100 -X rm -v
    ```

2. Run the preprocessing script on the files

    The script removes everything that isn't needed for the diagram generation.

    ```sh
    $ fd . './data/' -e svg -X python ./kanjivg_preprocess.py
    ```

## License

KanjiVG is copyright Ulrich Apel and released under the Creative Commons Attribution-Share Alike 3.0 licence. The license text can be found in the `LICENSE.kanjivg.txt` file in this directory and at the Creative Commons website: http://creativecommons.org/licenses/by-sa/3.0/