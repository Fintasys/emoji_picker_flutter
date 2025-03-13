import 'package:web/web.dart' as web;

/// Information about the environment in which the current program is running.
///
/// Platform provides information such as the operating system,
/// the hostname of the computer, the value of environment variables,
/// the path to the running program,
/// and other global properties of the program being run.
class Platform {
  /// Whether the operating system is a version of
  /// [Linux](https://en.wikipedia.org/wiki/Linux).
  ///
  /// This value is `false` if the operating system is a specialized
  /// version of Linux that identifies itself by a different name,
  /// for example Android (see [isAndroid]).
  static final bool isLinux = (operatingSystem == 'linux');

  /// Whether the operating system is a version of
  /// [macOS](https://en.wikipedia.org/wiki/MacOS).
  static final bool isMacOS = (operatingSystem == 'macos');

  /// Whether the operating system is a version of
  /// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
  static final bool isWindows = (operatingSystem == 'windows');

  /// Whether the operating system is a version of
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
  static final bool isAndroid = (operatingSystem == 'android');

  /// Whether the operating system is a version of
  /// [iOS](https://en.wikipedia.org/wiki/IOS).
  static final bool isIOS = (operatingSystem == 'ios');

  /// Whether the operating system is a version of
  /// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
  static final bool isFuchsia = (operatingSystem == 'fuchsia');

  /// A string representing the operating system or platform.
  static String get operatingSystem {
    final s = web.window.navigator.userAgent.toLowerCase();
    if (s.contains('iphone') ||
        s.contains('ipad') ||
        s.contains('ipod') ||
        s.contains('watch os')) {
      return 'ios';
    }
    if (s.contains('mac os')) {
      return 'macos';
    }
    if (s.contains('fuchsia')) {
      return 'fuchsia';
    }
    if (s.contains('android')) {
      return 'android';
    }
    if (s.contains('linux') || s.contains('cros') || s.contains('chromebook')) {
      return 'linux';
    }
    if (s.contains('windows')) {
      return 'windows';
    }
    return '';
  }
}
