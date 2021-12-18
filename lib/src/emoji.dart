/// A class to store data for each individual emoji
class Emoji {
  /// Emoji constructor
  const Emoji(this.name, this.emoji, {this.skinToneVariants = const []});

  /// The name or description for this emoji
  final String name;

  /// The unicode string for this emoji
  ///
  /// This is the string that should be displayed to view the emoji
  final String emoji;

  /// Skin Tone variants
  final List<String> skinToneVariants;

  /// Flag if emoji supports multiple skin tones
  bool hasSkinTone() {
    return skinToneVariants.isNotEmpty;
  }

  //// TODO PROBABLY BETTER TO USE attribute hasSkinVariants in Emoji list and then generate the emoji's based on this attribute during Tooltip showing
  /// TOoltip https://www.youtube.com/watch?v=OOEyJ0ct0Sg&ab_channel=JohannesMilke

  @override
  String toString() {
    return 'Name: $name, Emoji: $emoji';
  }

  /// Parse Emoji from json
  static Emoji fromJson(Map<String, dynamic> json) {
    return Emoji(json['name'] as String, json['emoji'] as String);
  }

  ///  Encode Emoji to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'emoji': emoji,
    };
  }
}
