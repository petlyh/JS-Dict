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

    if (snapshot.data case final data?) {
      return builder(context, handler(data), data);
    }

    if (snapshot.error case final error?) {
      return builder(
        context,
        ErrorIndicator(
          error: error,
          stackTrace: snapshot.stackTrace,
          onRetry: () => future.value = onLoad(),
        ),
        null,
      );
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return builder(context, loadingIndicator, null);
    }

    // If it completed without data.
    return const SizedBox.shrink();
  }
}
