#include "include/emoji_picker_flutter/emoji_picker_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "emoji_picker_flutter_plugin.h"

void EmojiPickerFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  emoji_picker_flutter::EmojiPickerFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
