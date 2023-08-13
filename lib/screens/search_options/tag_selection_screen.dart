import "package:flutter/material.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/screens/search_options/search_options_screen.dart";
import "package:jsdict/packages/tags.dart";
import "package:jsdict/widgets/info_chips.dart";

class TagSelectionScreen extends SearchOptionsScreen {
  const TagSelectionScreen({super.key})
      : super(
            body: const _TagSelection(), floatingActionButton: const _TagFAB());
}

class _TagFAB extends StatelessWidget {
  const _TagFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: QueryProvider.of(context).clearTags,
      tooltip: "Clear Tags",
      child: const Icon(Icons.clear),
    );
  }
}

class _TagSelection extends StatelessWidget {
  const _TagSelection();

  @override
  Widget build(BuildContext context) {
    final queryProvider = QueryProvider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: wordTags.entries
            .map((entry) => ListTile(
                  title: Text(entry.key),
                  subtitle: Wrap(
                    children: entry.value.entries
                        .map((tagEntry) => InfoChip(tagEntry.key,
                            onTap: () => queryProvider.addTag(tagEntry.value)))
                        .toList(),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
