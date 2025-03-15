import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class PregnancyScreen extends StatelessWidget {
  const PregnancyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello, John Doe",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w400
          )),
          Text("Week 23 of your pregnancy",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp
          )),
          SizedBox(height: 24.h,),
          SizedBox(
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
          )
        ],
      ),
    );
  }
}
