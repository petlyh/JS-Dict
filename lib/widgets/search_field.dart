import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:jsdict/jp_text.dart";

class SearchField extends HookWidget {
  const SearchField({
    required this.controller,
    this.onSubmitted,
    this.focusOnClear = false,
    this.showSearchIcon = false,
  });

  final TextEditingController controller;
  final bool focusOnClear;
  final bool showSearchIcon;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return TextField(
      style: jpTextStyle,
      focusNode: focusNode,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        prefixIcon: showSearchIcon ? const Icon(Icons.search) : null,
        border: InputBorder.none,
        hintText: "Search...",
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (focusOnClear) {
              focusNode.requestFocus();
            }

            controller.clear();
          },
          tooltip: "Clear",
        ),
      ),
    );
  }
}
