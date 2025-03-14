import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme_extensions/color_palette.dart';
import 'theme_extensions/text_theme.dart';
import 'theme_part/input_decoration_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: Colors.white,
        onError: Colors.red,
        surface: Colors.white,
        onSurface: Color(0xff1E1E1E),
    ),

      /// AppBar theme
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textColor,
          actionsIconTheme: IconThemeData(
              color: AppColors.iconColor,
          )
      ),

      /// Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r),),
        ),
      ),

      brightness: Brightness.light,
      textTheme: AppTextThemes.lightTextTheme,
      scaffoldBackgroundColor: Colors.transparent,
      inputDecorationTheme:AppInputDecorationTheme.lightInputDecorationTheme
  );
}