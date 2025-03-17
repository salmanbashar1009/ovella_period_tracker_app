import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class Utils {
  /// All method should be static method

  /// Back button widget
  static Widget backButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: AppPadding.iconPadding,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          Icons.arrow_back_ios_outlined,
          color: AppColors.iconColor,
          size: 20.r,
        ),
      ),
    );
  }

  /// Circle Container for icon
  static Widget circleContainer({Icon? icon, String? imagePath}) {
    return Container(
      padding: AppPadding.iconPadding,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: icon ?? (imagePath != null
                  ? ClipOval(
                    child: Image.asset(
                      imagePath,
                      width: 20.w, // Adjust size as needed
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  )
                  : const SizedBox()), // Empty widget if neither icon nor image is provided
    );
  }

  /// primary Button
  static Widget primaryButton({
    required String title,
    double? width,
    EdgeInsets? padding,
    required onTap,
    required BuildContext context,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? color,
    Color? textColor,
    Color? borderColor,
    TextStyle? textStyle,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme =Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: color??AppColors.primary,
          elevation: 0,
          ),
      onPressed: onTap,
      child: Row(
        spacing: 6.w,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if(prefixIcon!=null)
            prefixIcon,

          Text(
            title,
            style: textStyle??textTheme.bodyMedium!.copyWith(
              color: textColor??colorScheme.onPrimary,
            ),
          ),

          if(suffixIcon!=null)
            suffixIcon,
        ],
      ),
    );

    //   GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     //   height: 56.h,
    //      //width: 155.w,
    //   //  padding: padding,
    //     decoration: BoxDecoration(
    //       color: Colors.black,
    //       borderRadius: BorderRadius.circular(24),
    //     ),
    //     child: Center(
    //       child: Text(
    //         title,
    //         style: textTheme.bodyLarge!.copyWith(
    //           fontWeight: FontWeight.w500,
    //           color: colorScheme.onPrimary,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  static void scrollToTop({required ScrollController scrollController}){
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }
}
