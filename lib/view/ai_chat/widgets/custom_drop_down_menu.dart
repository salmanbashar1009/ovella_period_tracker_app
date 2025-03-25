import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/padding.dart';
import '../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../utility/utils.dart';
class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110.h,
      right: 0,
      child: Container(
        padding: AppPadding.screenPadding,
        decoration: BoxDecoration(
            color: AppColors.onPrimary,
            borderRadius:BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 10.r,
              blurRadius: 10.r,
              offset: Offset(-4, 8)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Utils.primaryButton(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
              title: 'Send to Doctor',
              onTap: () {},
              context: context,
            ),
            SizedBox(height: 12.h),
            Utils.primaryButton(
              color: const Color(0xffF4F6F6),
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
              title: 'Export Chat',
              textColor: AppColors.primary,
              onTap: () {},
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}