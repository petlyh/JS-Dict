import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:jsdict/packages/remove_tags.dart";
import "package:jsdict/packages/tags.dart";
import "package:jsdict/providers/query_provider.dart";
import "package:jsdict/widgets/info_chip.dart";
import "package:jsdict/widgets/search_field.dart";

class TagSelectionScreen extends HookConsumerWidget {
  const TagSelectionScreen(this.initialQuery);

  final String initialQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialQuery);

    return PopScope(
      onPopInvokedWithResult: (_, __) =>
          ref.read(queryProvider.notifier).update(controller.text),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.text = removeTags(controller.text),
          tooltip: "Clear Tags",
          child: const Icon(Icons.clear),
        ),
        appBar: AppBar(
          title: SearchField(controller: controller),
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: wordTags.entries
                .map(
                  (entry) => ListTile(
                    title: Text(entry.key),
                    subtitle: Wrap(
                      children: entry.value.entries
                          .map(
                            (tagEntry) => InfoChip(
                              tagEntry.key,
                              onTap: () => controller.text =
                                  "${controller.text} #${tagEntry.value}"
                                      .trim(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
