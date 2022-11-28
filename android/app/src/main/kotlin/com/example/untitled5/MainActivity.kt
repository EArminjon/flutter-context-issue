package com.example.untitled5

import io.flutter.embedding.android.FlutterActivity
import androidx.core.view.WindowCompat

class MainActivity : FlutterActivity() {
    override fun onPostResume() {
        super.onPostResume()
        // Used to let the app control system color (status bar, bottom nav bar)
        WindowCompat.setDecorFitsSystemWindows(window, false)
    }
}
