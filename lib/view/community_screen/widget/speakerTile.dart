import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class Speakertile extends StatelessWidget {
  final String title;
  final String img;
  final String subtitle;
  const Speakertile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xFFFFFFFF),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(child: Image.asset(img, height: 48.h, width: 48.w)),
              SizedBox(height: 8.h),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColors.lightTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
