import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/key_name.dart';
import 'color_palette.dart';

class AppTextThemes {
  static TextTheme lightTextTheme =
  TextTheme(

    /// Headline
    headlineLarge: TextStyle(
      fontFamily: AppKeyName.carosSoftFontFamily,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppKeyName.carosSoftFontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppKeyName.carosSoftFontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),

    /// Body
    bodyLarge: TextStyle(
      fontFamily: AppKeyName.carosSoftFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppKeyName.carosSoftFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    ),
    bodySmall:   TextStyle(
      fontFamily: AppKeyName.carosSoftFontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.lightTextColor,
    ),
  );
}
