package io.github.petlyh.jsdict

import io.flutter.embedding.android.FlutterActivity

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
}
