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
class EmojiPickerFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "emoji_picker_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    val delimiter = "|"
    when (call.method) {
        "checkAvailability" -> {
          val paint = Paint()
          val keys: List<String> = call.argument<String>("emojiKeys").toString().split(delimiter)
          val entries: List<String> = call.argument<String>("emojiEntries").toString().split(delimiter)
          val supportedList = mutableListOf<String>()
          for (i in keys.indices) {
            if (PaintCompat.hasGlyph(paint, entries[i])) {
              supportedList.add(keys[i])
            }
          }
          result.success(supportedList.joinToString(separator = delimiter))
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
