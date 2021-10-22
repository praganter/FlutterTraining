import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeData.dark();
  bool isDark = true;

  // getTheme() => themeData;

  changeTheme() {
    if (isDark) {
      themeData = ThemeData.light();
      isDark = !isDark;
    } else {
      themeData = ThemeData.dark();
      isDark = !isDark;
    }
    notifyListeners();
  }
}
