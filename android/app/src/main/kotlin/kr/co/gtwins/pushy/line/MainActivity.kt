package kr.co.gtwins.pushy.line

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.lang.Boolean


object BuildConfig {
    val DEBUG = Boolean.parseBoolean("true")
    const val APPLICATION_ID = "com.seosh817.androidconfigs.stage.debug"
    const val BUILD_TYPE = "debug"
    const val FLAVOR = "line"
    const val VERSION_CODE = 1
    const val VERSION_NAME = "1.0-stage"
}

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flavor").setMethodCallHandler {
                call, result ->result.success(BuildConfig.FLAVOR)
        }
    }
}
