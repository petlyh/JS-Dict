import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "package:jsdict/widgets/error_indicator.dart";

final loadingIndicator = Center(
  child: Container(
    margin: const EdgeInsets.all(20),
    child: const CircularProgressIndicator(),
  ),
);

class LoaderWidget<T> extends HookWidget {
  const LoaderWidget({
    super.key,
    required this.onLoad,
    required this.handler,
    this.placeholder = const SizedBox.shrink(),
  });

  final Future<T> Function() onLoad;
  final Widget Function(T data) handler;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    final initialFuture = useMemoized(onLoad);
    final future = useState(initialFuture);
    final snapshot = useFuture(future.value);

    return switch (snapshot.connectionState) {
      ConnectionState.none => placeholder,
      ConnectionState.waiting => loadingIndicator,
      ConnectionState.done => snapshot.hasData
          ? handler(snapshot.data as T)
          : ErrorIndicator(
              snapshot.error!,
              stackTrace: snapshot.stackTrace,
              onRetry: () => future.value = onLoad(),
            ),
      _ => throw StateError("Unhandled async state"),
    };
  }
}
