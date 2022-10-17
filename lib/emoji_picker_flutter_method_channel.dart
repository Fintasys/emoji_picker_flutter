import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'emoji_picker_flutter_platform_interface.dart';

/// An implementation of [EmojiPickerFlutterPlatform] that uses method channels.
class MethodChannelEmojiPickerFlutter extends EmojiPickerFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('emoji_picker_flutter');
}
