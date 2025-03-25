import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class LogCard extends StatelessWidget {
  final VoidCallback onAddPressed;
  final String title;

  const LogCard({Key? key, required this.onAddPressed, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 170.h,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFDDE5), Color(0xFFFFFFFF)],
        ), // Light pink background
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: onAddPressed,
              child: Container(
                width: 44.w,
                height: 44.h,
                decoration: const BoxDecoration(
                  color: AppColors.textColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.add, color: AppColors.onPrimary, size: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
