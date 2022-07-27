package com.fintasys.emoji_picker_flutter

import android.graphics.Paint
import androidx.annotation.NonNull
import androidx.core.graphics.PaintCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** EmojiPickerFlutterPlugin */
class EmojiPickerFlutterPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    val paint = Paint()

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "emoji_picker_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            /// returns list of boolean values that corresponds to the `source` list lenght
            /// each value indicates whether the `source` emoji is supported on the platform
            "getSupportedEmojis" -> {
                val list = call.argument<List<String>>("source")
                val supportedList: List<Boolean>? = list?.map { s ->
                    PaintCompat.hasGlyph(paint, s)
                }
                result.success(supportedList)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
