#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint emoji_picker_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'emoji_picker_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Emoji Picker'
  s.description      = 'Flutter Emoji Picker Plugin'
  s.homepage         = 'https://fintasys.com'
  s.license          = { :file => '../LICENSE', :type => 'MIT' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'emoji_picker_flutter/Sources/emoji_picker_flutter/**/*.swift'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
