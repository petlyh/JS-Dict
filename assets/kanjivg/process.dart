import "dart:io";

Future<Iterable<File>> findFiles(String dir) async =>
    (await Directory(dir).list().toList()).whereType<File>().where((file) {
      final filename = file.uri.pathSegments.last;

      return filename.endsWith(".svg") && !filename.contains("-");
    });

typedef Character = ({String name, List<String> paths});

Future<Character> loadCharacter(File file) async => (
      name: file.uri.pathSegments.last.split(".").first,
      paths: (await file.readAsLines())
          .where((l) => l.trim().startsWith("<path "))
          .map((l) => RegExp(' d="(.*?)"').firstMatch(l)?.group(1))
          .nonNulls
          .toList(),
    );

String serializeCharacter(Character character) =>
    "${character.name}:${character.paths.join("_")}";

void main(List<String> args) async {
  if (args.length < 2) {
    stderr.write("Not enough arguments");
    return;
  }

  final inputDir = args[0];
  final outputFilename = args[1];

  final files = await findFiles(inputDir);

  final characters = await Future.wait(
    files.map((file) => loadCharacter(file).then(serializeCharacter)),
  );

  stdout.write("${characters.length} files processed");

  await File(outputFilename).writeAsString(characters.join("\n"));
  stdout.write("Written to $outputFilename");
}
