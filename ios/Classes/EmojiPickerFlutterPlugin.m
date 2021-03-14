#import "EmojiPickerFlutterPlugin.h"
#if __has_include(<emoji_picker_flutter/emoji_picker_flutter-Swift.h>)
#import <emoji_picker_flutter/emoji_picker_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "emoji_picker_flutter-Swift.h"
#endif

@implementation EmojiPickerFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEmojiPickerFlutterPlugin registerWithRegistrar:registrar];
}
@end
