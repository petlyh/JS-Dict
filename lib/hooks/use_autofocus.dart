import "package:flutter/scheduler.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";

const _windowChannel = MethodChannel("jsdict/window");

void useAutoFocus(FocusNode node, TextEditingController controller) {
  final context = useContext();

  Future<void> show() async {
    // Don't steal focus if another screen or dialog is on top.
    // Don't request focus if we already searched for something.
    if (
      !context.mounted
      || ModalRoute.of(context)?.isCurrent != true
      || controller.text.isNotEmpty) {
      return;
    }

    if (!node.hasFocus) {
      node.requestFocus();
    }

    // Give the window a moment to finish taking input focus.
    await Future<void>.delayed(const Duration(milliseconds: 100));

    if (
      !context.mounted
      || controller.text.isNotEmpty) {
      return;
    }

    await SystemChannels.textInput.invokeMethod<void>("TextInput.show");
  }

  useEffect(() {
    // Android signals when the window gains focus (cold start and resume).
    _windowChannel.setMethodCallHandler((call) async {
      if (call.method == "windowFocused") {
        await show();
      }
    });

    // Covers the case where window focus arrived before this handler existed.
    SchedulerBinding.instance.addPostFrameCallback((_) => show());

    return () => _windowChannel.setMethodCallHandler(null);
  }, const []);
}
