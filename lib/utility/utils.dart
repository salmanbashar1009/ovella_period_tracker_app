import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
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
        margin: AppPadding.iconContainerMargin,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Image.asset(
            AppImages.backArrowIcon,
          width: 16.w,
          height: 16.h,
          fit: BoxFit.cover,
        )
      ),
    );
  }

  /// Circle Container for icon
  static Widget circleContainer({Icon? icon, String? imagePath, EdgeInsets? margin}) {
    return Container(
      padding: AppPadding.iconPadding,
      margin:margin ?? AppPadding.iconContainerMargin,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child:
          icon ??
          (imagePath != null
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: color ?? AppColors.primary,
        elevation: 0,
        shape: StadiumBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
      onPressed: onTap,
      child: Row(
        spacing: 6.w,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) prefixIcon,

          Text(
            title,
            style:
                textStyle ??
                textTheme.bodyMedium!.copyWith(
                  color: textColor ?? colorScheme.onPrimary,
                ),
          ),

          if (suffixIcon != null) suffixIcon,
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

  static void scrollToTop({required ScrollController scrollController}) {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  static void scrollToBottom({required ScrollController scrollController}) {
    scrollController.animateTo(
      scrollController.position.minScrollExtent, // Scroll to the bottom
      duration: Duration(milliseconds: 350), // Animation duration
      curve: Curves.easeOut, // Animation curve
    );
  }

  static void copyText({required String text}) {
    debugPrint("\nText to copy : $text\n");
    Clipboard.setData(ClipboardData(text: text));
  }

  static bool isKeyboardOpen({required BuildContext context}) {
    final viewInsetsBottom = MediaQuery.of(context).viewInsets.bottom;
    debugPrint("Keyboard height: $viewInsetsBottom");

    // If viewInsets.bottom > 0, the keyboard is open, otherwise closed
    return viewInsetsBottom > 0;
  }
}
