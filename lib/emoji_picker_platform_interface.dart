import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'emoji_picker_method_channel.dart';

/// EmojiPickerPlatform
abstract class EmojiPickerPlatform extends PlatformInterface {
  /// Constructs a EmojiPickerPlatform.
  EmojiPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static EmojiPickerPlatform _instance = MethodChannelEmojiPicker();

  /// The default instance of [EmojiPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelEmojiPicker].
  static EmojiPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EmojiPickerPlatform] when
  /// they register themselves.
  static set instance(EmojiPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// getPlatformVersion
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
