import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class Utils{

  /// All method should be static method

  /// Back button widget
  static Widget backButton(BuildContext context){
    return GestureDetector(
      onTap: ()=>Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(Icons.arrow_back_ios_outlined,
        color: AppColors.iconColor,
        size: 20.r,
        ),
      ),
    );
  }

  static Widget

}