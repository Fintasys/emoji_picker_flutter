import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:emoji_picker_flutter/src/emoji.dart';

/// Container for Category and their emoji
class CategoryEmoji {
  /// Constructor
  CategoryEmoji(this.category, this.emoji);

  /// Category instance
  final Category category;

  /// List of emoji of this category
  List<Emoji> emoji;
}
