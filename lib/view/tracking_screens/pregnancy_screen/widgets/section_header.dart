import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 24.h,),
        Row(
          children: [
            Text(title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 17.sp
            ),),
          ],
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
