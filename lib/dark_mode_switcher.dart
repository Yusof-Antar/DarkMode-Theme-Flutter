import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkMode with ChangeNotifier {
  late ThemeData _selectedTheme;

  DarkMode({
    required bool isDark,
  }) {
    _selectedTheme = isDark ? dark : light;
  }

  ThemeData dark = ThemeData.dark();

  ThemeData light = ThemeData.light();

  void swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool('isDark', false);
    } else {
      _selectedTheme = dark;
      prefs.setBool('isDark', true);
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
