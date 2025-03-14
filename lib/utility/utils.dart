import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class Utils{

  /// All method should be static method

  /// Back button widget
  static Widget backButton(BuildContext context){
    return GestureDetector(
      onTap: ()=>Navigator.pop(context),
      child: Container(
        padding: AppPadding.iconPadding,
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

  /// Circle Container for icon
  static Widget circleContainer({required Icon icon}){
    return Container(
      padding: AppPadding.iconPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child:  icon,
    );
  }


  /// primary Button
  static Widget primaryButton({required String title,required TextTheme textTheme,required ColorScheme colorScheme}) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(child: Text(title, style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500,color: colorScheme.onPrimary,))),
    );
  }

}