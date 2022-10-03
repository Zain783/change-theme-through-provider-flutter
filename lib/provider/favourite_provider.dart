import 'package:flutter/material.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _Selected_item = [];
  List<int> get selectedItem => _Selected_item;
  void addItem(int value) {
    _Selected_item.add(value);
    notifyListeners();
  }
    void removeItem(int value) {
    _Selected_item.remove(value);
    notifyListeners();
  }
}
