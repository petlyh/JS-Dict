package io.github.petlyh.jsdict

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    // https://github.com/flutter/flutter/issues/66212#issuecomment-924980973
    protected override fun onPause() {
        super.onPause()
        try {
            java.lang.Thread.sleep(200);
        } catch (e: InterruptedException) {
            e.printStackTrace()
        }
    }

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)
        if (hasFocus) {
            flutterEngine?.dartExecutor?.binaryMessenger?.let {
                MethodChannel(it, "jsdict/window").invokeMethod("windowFocused", null)
            }
        }
    }
}
