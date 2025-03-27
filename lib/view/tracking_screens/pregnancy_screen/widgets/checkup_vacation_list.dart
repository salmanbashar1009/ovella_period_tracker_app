import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class CheckupVacationList extends StatelessWidget {
  const CheckupVacationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context,index){
          return Container(
            width: MediaQuery.of(context).size.height > 800 ? 271.w : 220.w,
            height: MediaQuery.of(context).size.height > 800 ? 269.h : 260.h ,
            padding: EdgeInsets.all(8.r),
            margin: EdgeInsets.only(right: index == 5 ? 20 : 12,left: index == 0 ? 20 : 0),

            decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.circular(24.r)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 255.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                          image: AssetImage(AppImages.checkupImage),
                          fit: BoxFit.contain
                      )
                  ),
                ),
                SizedBox(height: 12.h,),
                Text("Next Checkup",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),),
                SizedBox(height: 8.h,),
                Text("Feb 15 Prenatal Screening",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp
                ),),
              ],
            ),
          );
        },
      ),
    );
  }
}
