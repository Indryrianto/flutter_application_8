import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontProvider extends ChangeNotifier {
  // Default font is Roboto
  TextStyle _currentFont = GoogleFonts.roboto();

  TextStyle get currentFont => _currentFont;

  get selectedFontIndex => null;

  // Function to change the font
  void changeFont(int fontIndex) {
    if (fontIndex == 0) {
      _currentFont = GoogleFonts.roboto();
    } else if (fontIndex == 1) {
      _currentFont = GoogleFonts.poppins();
    } else {
      _currentFont = GoogleFonts.lora();
    }
    notifyListeners(); // Notify listeners to refresh UI when the font changes
  }
}
