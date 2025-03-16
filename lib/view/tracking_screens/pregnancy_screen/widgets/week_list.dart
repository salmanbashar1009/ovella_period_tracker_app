import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class WeekList extends StatelessWidget {
  const WeekList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: double.infinity,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        itemBuilder: (context,index){
          return Container(
            width: 85.w,
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              color: AppColors.onPrimary,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(child: Text("Week $index")),
          );
        },
      ),
    );
  }
}
