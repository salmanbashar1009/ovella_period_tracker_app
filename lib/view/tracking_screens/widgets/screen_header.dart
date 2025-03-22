import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key, required this.title, required this.onTap
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: AppPadding.iconPadding,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.iconColor,
              size: 20.r,
            ),
          ),
        ),
        Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 19.sp,
          ),
        ),
        Spacer(),
        SizedBox(width: 30.w,)
      ],
    );
  }
}
