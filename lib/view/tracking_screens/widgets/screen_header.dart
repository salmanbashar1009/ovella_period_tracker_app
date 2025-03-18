import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Utils.backButton(context),
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
