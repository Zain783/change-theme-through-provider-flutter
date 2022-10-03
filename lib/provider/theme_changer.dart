import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool _ischangetheme = false;
  bool get ischangetheme => _ischangetheme;
  void setthemebutton(bool flag) {
    _ischangetheme = flag;
    notifyListeners();
  }

  void setTheme(ThemeMode themedata) {
    _themeMode = themedata;
    notifyListeners();
  }
}
