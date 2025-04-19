import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // ThemeProvider() { loadThemePreference(); }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    // saveThemePreference(isDarkMode);
    notifyListeners();
  }
  // void saveThemePreference(bool isDarkMode) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isDarkMode', isDarkMode);
  // }
  //
  // void loadThemePreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isDarkMode = prefs.getBool('isDarkMode') ?? false;
  //   notifyListeners();
  // }
}


