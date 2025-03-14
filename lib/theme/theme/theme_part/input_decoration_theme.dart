import 'package:flutter/material.dart';
import '../theme_extensions/color_palette.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: Color(0xff676364), // Using hint text color
    filled: true,
    fillColor: Color(0xffffffff), // White background
    labelStyle: TextStyle(color: Color(0xff676364)), // Hint text color
    hintStyle: TextStyle(color: Color(0xff676364)), // Hint text color
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff1E1E1E).withOpacity(0.12)), // Stroke color
      borderRadius: BorderRadius.circular(16), // Match inputDecoration
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff1E1E1E).withOpacity(0.12)), // Stroke color
      borderRadius: BorderRadius.circular(16),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 251, 18, 220),
      ), // Focused color
      borderRadius: BorderRadius.circular(16),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9BA2A7)), // Error color
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
