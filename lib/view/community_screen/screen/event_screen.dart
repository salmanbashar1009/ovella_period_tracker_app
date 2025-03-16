import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/getdetailButton.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/joinButton.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: 271.w,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20.r),
      ),
         child: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(left: 8.w,right: 8.w, top: 8.h,bottom:12.h ),
               child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.asset("assets/images/community/pgcook.png")),
             ),
           Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),

             child: Text("Pregnancy Nutrition Webinar",
             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500
             ),
             
             ),
           ),
           SizedBox(height: 8.h,),
        Padding(
          padding: EdgeInsets.only(left:16.w ),
          child: Row(
            children: [
              Image.asset("assets/images/icons/cal.png",
              height: 16.h,
              width: 16.w,
              ),
          SizedBox(width: 4.w,),
          Text("20 March 2025",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: AppColors.lightTextColor,
           ),
          ),
          SizedBox(width: 12.w,),
         Image.asset("assets/images/icons/location.png",
              height: 16.h,
              width: 16.w,
              ),
               SizedBox(width: 4.w,),
          Text("Cairo",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: AppColors.lightTextColor,
           ),
          ),
            ],
          ),


        ),

        SizedBox(height: 12.h,),
     Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Getdetailbutton()),
          ],
         ),

    );
    
}}