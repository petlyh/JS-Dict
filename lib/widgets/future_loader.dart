import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "package:jsdict/widgets/error_indicator.dart";

final loadingIndicator = Center(
  child: Container(
    margin: const EdgeInsets.all(20),
    child: const CircularProgressIndicator(),
  ),
);

class FutureLoader<T> extends HookWidget {
  const FutureLoader({
    super.key,
    required this.onLoad,
    required this.handler,
    this.frameBuilder,
  });

  final Future<T> Function() onLoad;
  final Widget Function(T data) handler;
  final Widget Function(BuildContext context, Widget child, T? data)?
      frameBuilder;

  @override
  Widget build(BuildContext context) {
    final initialFuture = useMemoized(onLoad);
    final future = useState(initialFuture);
    final snapshot = useFuture(future.value);

    final builder = frameBuilder ?? (_, child, __) => child;

    if (snapshot.hasData) {
      return builder(context, handler(snapshot.data as T), snapshot.data as T);
    }

    if (snapshot.hasError) {
      return builder(
        context,
        ErrorIndicator(
          snapshot.error!,
          stackTrace: snapshot.stackTrace,
          onRetry: () => future.value = onLoad(),
        ),
        null,
      );
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return builder(context, loadingIndicator, null);
    }

    throw StateError("Unhandled async state");
  }
}
