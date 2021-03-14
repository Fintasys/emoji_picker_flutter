/// A class to store data for each individual emoji
class Emoji {
  /// The name or description for this emoji
  final String name;

  /// The unicode string for this emoji
  ///
  /// This is the string that should be displayed to view the emoji
  final String emoji;

  const Emoji(this.name, this.emoji);

  @override
  String toString() {
    return "Name: " + name + ", Emoji: " + emoji;
  }
}
