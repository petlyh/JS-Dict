import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

/// Creates a [PagingController] that will be disposed automatically.
///
/// See also:
/// - [PagingController]
PagingController<PageKey, Item> usePagingController<PageKey, Item>({
  required PageKey firstPageKey,
  required _RequestListener<PageKey, Item> requestListener,
  PagingState<PageKey, Item>? initialState,
  int? invisibleItemsThreshold,
}) =>
    use(
      _PagingControllerHook(
        firstPageKey: firstPageKey,
        requestListener: requestListener,
        initialState: initialState,
        invisibleItemsThreshold: invisibleItemsThreshold,
      ),
    );

class _PagingControllerHook<PageKey, Item>
    extends Hook<PagingController<PageKey, Item>> {
  const _PagingControllerHook({
    required this.firstPageKey,
    required this.requestListener,
    this.initialState,
    this.invisibleItemsThreshold,
    super.keys,
  });

  final PageKey firstPageKey;
  final _RequestListener<PageKey, Item> requestListener;
  final PagingState<PageKey, Item>? initialState;
  final int? invisibleItemsThreshold;

  @override
  HookState<PagingController<PageKey, Item>,
          Hook<PagingController<PageKey, Item>>>
      createState() => _PagingControllerHookState<PageKey, Item>();
}

class _PagingControllerHookState<PageKey, Item> extends HookState<
    PagingController<PageKey, Item>, _PagingControllerHook<PageKey, Item>> {
  late final controller = PagingController<PageKey, Item>.fromValue(
    hook.initialState ?? PagingState(nextPageKey: hook.firstPageKey),
    firstPageKey: hook.firstPageKey,
    invisibleItemsThreshold: hook.invisibleItemsThreshold,
  );

  @override
  void initHook() => controller.addPageRequestListener(
        (key) => hook.requestListener(controller, key),
      );

  @override
  PagingController<PageKey, Item> build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => "usePagingController";
}

typedef _RequestListener<PageKey, Item> = void Function(
  PagingController<PageKey, Item> controller,
  PageKey key,
);
