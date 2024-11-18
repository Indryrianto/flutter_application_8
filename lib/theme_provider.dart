import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Default theme is light theme
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  get selectedThemeIndex => null;

  // Function to change the theme
  void changeTheme(int themeIndex) {
    if (themeIndex == 0) {
      _currentTheme = ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      );
    } else if (themeIndex == 1) {
      _currentTheme = ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
        ),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
        ),
      );
    }
    notifyListeners(); // Notify listeners to refresh UI when the theme changes
  }
}
