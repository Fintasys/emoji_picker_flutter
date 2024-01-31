import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

/// Container for Category and their emoji
class CategoryEmoji {
  /// Constructor
  const CategoryEmoji(this.category, this.emoji);

  /// Category instance
  final Category category;

  /// List of emoji of this category
  final List<Emoji> emoji;

  /// Copy method
  CategoryEmoji copyWith({Category? category, List<Emoji>? emoji}) {
    return CategoryEmoji(
      category ?? this.category,
      emoji ?? this.emoji,
    );
  }
}
