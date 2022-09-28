import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'emoji_picker_platform_interface.dart';

/// An implementation of [EmojiPickerPlatform] that uses method channels.
class MethodChannelEmojiPicker extends EmojiPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('emojipicker');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
