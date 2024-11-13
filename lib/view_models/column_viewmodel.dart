import 'package:flutter/material.dart';

class ColumnViewModel extends ChangeNotifier {
  List<String> _items = ["Item 1", "Item 2", "Item 3"];
  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();  // Notify listeners to update the UI
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();  // Notify listeners to update the UI
  }

  void updateItem(int index, String newItem) {
    if (index >= 0 && index < _items.length) {
      _items[index] = newItem;
      notifyListeners();  // Notify listeners to update the UI
    }
  }
}
