import 'package:emoji_picker_flutter/src/emoji.dart';

class RecentEmoji {
  RecentEmoji(this.emoji, this.counter);
  final Emoji emoji;
  int counter;

  static RecentEmoji fromJson(json) {
    return new RecentEmoji(
      Emoji.fromJson(json['emoji']),
      json['counter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "emoji": this.emoji,
      "counter": this.counter,
    };
  }
}
