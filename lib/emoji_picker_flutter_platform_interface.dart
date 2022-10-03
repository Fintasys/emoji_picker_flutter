import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'emoji_picker_flutter_method_channel.dart';

/// EmojiPickerFlutterPlatform
abstract class EmojiPickerFlutterPlatform extends PlatformInterface {
  /// Constructs a EmojiPickerFlutterPlatform.
  EmojiPickerFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static EmojiPickerFlutterPlatform _instance =
      MethodChannelEmojiPickerFlutter();

  /// The default instance of [EmojiPickerFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelEmojiPickerFlutter].
  static EmojiPickerFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EmojiPickerFlutterPlatform] when
  /// they register themselves.
  static set instance(EmojiPickerFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
