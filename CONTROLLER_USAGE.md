# EmojiPickerController Usage

The `EmojiPickerController` provides programmatic control over the emoji picker's category selection state. This is particularly useful when you need to:

- Persist the selected category across widget rebuilds (e.g., theme changes)
- Change the category programmatically
- Listen to category changes
- Synchronize category state with other parts of your app

## Basic Usage

### Creating a Controller

```dart
// Create with default category (RECENT)
final controller = EmojiPickerController();

// Create with specific initial category
final controller = EmojiPickerController(initialCategory: Category.SMILEYS);
```

### Using with EmojiPicker

```dart
EmojiPicker(
  controller: controller,
  textEditingController: textController,
  config: Config(
    // ... your config
  ),
)
```

### Reading Current Category

```dart
Category currentCategory = controller.currentCategory;
print('Currently selected: ${currentCategory.name}');
```

### Setting Category Programmatically

```dart
// Change to a specific category
controller.setCategory(Category.ANIMALS);
```

### Listening to Changes

```dart
controller.addListener(() {
  print('Category changed to: ${controller.currentCategory.name}');
  // Perform any additional actions
});
```

## Solving Theme Rebuild Issues

**Problem**: When your app's theme changes, the emoji picker widget rebuilds and loses the selected category tab, always reverting to the initial category.

**Solution**: Use `EmojiPickerController` to persist the category across rebuilds:

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final EmojiPickerController _emojiController;
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _emojiController = EmojiPickerController(initialCategory: Category.SMILEYS);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Column(
          children: [
            // Theme toggle button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDarkTheme = !_isDarkTheme;
                  // The selected category persists through this rebuild!
                });
              },
              child: Text('Toggle Theme'),
            ),

            // Emoji picker with controller
            EmojiPicker(
              controller: _emojiController, // This preserves the category!
              config: Config(
                categoryViewConfig: CategoryViewConfig(
                  backgroundColor: _isDarkTheme ? Colors.grey[800]! : Colors.grey[200]!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emojiController.dispose();
    super.dispose();
  }
}
```

## Advanced Usage

### Category Control Buttons

```dart
Widget _buildCategoryButton(String label, Category category) {
  final isSelected = _emojiController.currentCategory == category;

  return ElevatedButton(
    onPressed: () => _emojiController.setCategory(category),
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.blue : Colors.grey,
    ),
    child: Text(label),
  );
}
```

### State Synchronization

```dart
class _MyWidgetState extends State<MyWidget> {
  late final EmojiPickerController _emojiController;
  String _statusText = '';

  @override
  void initState() {
    super.initState();
    _emojiController = EmojiPickerController();

    // Listen to category changes and update other parts of the UI
    _emojiController.addListener(_onCategoryChanged);
  }

  void _onCategoryChanged() {
    setState(() {
      _statusText = 'Browsing ${_emojiController.currentCategory.name} emojis';
    });
  }

  @override
  void dispose() {
    _emojiController.removeListener(_onCategoryChanged);
    _emojiController.dispose();
    super.dispose();
  }
}
```

## Backward Compatibility

The `EmojiPickerController` is completely optional. If you don't provide a controller, the emoji picker works exactly as before. You can also still use the `onCategoryChanged` callback:

```dart
EmojiPicker(
  // Old way - still works
  onCategoryChanged: (Category category) {
    print('Category changed: ${category.name}');
  },
  config: Config(
    categoryViewConfig: CategoryViewConfig(
      initCategory: Category.SMILEYS, // Still works
    ),
  ),
)
```

**Note**: If both `controller` and `onCategoryChanged` are provided, the controller takes precedence.

## Controller Methods

| Method                           | Description                                    |
| -------------------------------- | ---------------------------------------------- |
| `currentCategory`                | Get the currently selected category            |
| `setCategory(Category)`          | Set the category programmatically              |
| `addListener(VoidCallback)`      | Listen to category changes                     |
| `removeListener(VoidCallback)`   | Remove a listener                              |
| `dispose()`                      | Clean up the controller                        |
| `copyWith({Category? category})` | Create a copy with optional different category |

## Available Categories

- `Category.RECENT` - Recently used emojis
- `Category.SMILEYS` - Smiley and emotion emojis
- `Category.ANIMALS` - Animal emojis
- `Category.FOODS` - Food and drink emojis
- `Category.TRAVEL` - Travel and places emojis
- `Category.ACTIVITIES` - Activity emojis
- `Category.OBJECTS` - Object emojis
- `Category.SYMBOLS` - Symbol emojis
- `Category.FLAGS` - Flag emojis
