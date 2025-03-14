import 'package:flutter/material.dart';
import '../theme_extensions/color_palette.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor:Color(0xffffffff),

      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFF9BA2A7),),),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Color.fromARGB(255, 251, 18, 220)
          ),),

      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xFF9BA2A7),),),

      hintStyle: TextStyle(color: Color(0xff676364),)
  );
}