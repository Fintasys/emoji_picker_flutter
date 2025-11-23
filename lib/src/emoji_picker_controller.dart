import 'package:emoji_picker_flutter/src/emoji_picker.dart' show Category;
import 'package:flutter/foundation.dart' hide Category;

/// Controller for EmojiPicker widget that allows reading and changing
/// the selected category programmatically.
///
/// Similar to [TextEditingController], this controller provides:
/// - Reading the current selected category
/// - Setting the category programmatically
/// - Listening to category changes
///
/// Example usage:
/// ```dart
/// final controller = EmojiPickerController();
///
/// // Listen to changes
/// controller.addListener(() {
///   print('Category changed to: ${controller.currentCategory}');
/// });
///
/// // Set category programmatically
/// controller.setCategory(Category.SMILEYS);
///
/// // Use with EmojiPicker
/// EmojiPicker(
///   controller: controller,
///   // ... other config
/// )
/// ```
class EmojiPickerController extends ChangeNotifier {
  /// Creates an EmojiPickerController with an optional initial category.
  /// Defaults to [Category.RECENT] if not specified.
  EmojiPickerController({Category initialCategory = Category.RECENT})
      : _currentCategory = initialCategory;

  Category _currentCategory;

  /// The currently selected category.
  Category get currentCategory => _currentCategory;

  /// Sets the selected category and notifies listeners.
  ///
  /// This will cause the emoji picker to navigate to the specified category
  /// if it's currently being used by an EmojiPicker widget.
  void setCategory(Category category) {
    if (_currentCategory != category) {
      _currentCategory = category;
      notifyListeners();
    }
  }

  /// Internal method used by EmojiPicker to update the controller
  /// when the user manually changes categories.
  ///
  /// This should not be called directly by user code.
  void updateCategory(Category category) {
    if (_currentCategory != category) {
      _currentCategory = category;
      notifyListeners();
    }
  }

  /// Creates a copy of this controller with the same current category.
  EmojiPickerController copyWith({Category? category}) {
    return EmojiPickerController(
      initialCategory: category ?? _currentCategory,
    );
  }

  @override
  String toString() =>
      'EmojiPickerController(currentCategory: $_currentCategory)';
}
