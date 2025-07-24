import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadThemePreference();
  }

  void toggleTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    _saveThemePreference(themeMode);
    notifyListeners();
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString('themeMode');
    if (themeString == 'light') {
      _themeMode = ThemeMode.light;
    } else if (themeString == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.system; // Default to system if no preference or system
    }
    notifyListeners();
  }

  void _saveThemePreference(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeString = themeMode == ThemeMode.light ? 'light' : 'dark';
    await prefs.setString('themeMode', themeString);
  }
}
