#ifndef FLUTTER_PLUGIN_EMOJI_PICKER_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_EMOJI_PICKER_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace emoji_picker_flutter {

class EmojiPickerFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EmojiPickerFlutterPlugin();

  virtual ~EmojiPickerFlutterPlugin();

  // Disallow copy and assign.
  EmojiPickerFlutterPlugin(const EmojiPickerFlutterPlugin&) = delete;
  EmojiPickerFlutterPlugin& operator=(const EmojiPickerFlutterPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace emoji_picker_flutter

#endif  // FLUTTER_PLUGIN_EMOJI_PICKER_FLUTTER_PLUGIN_H_
