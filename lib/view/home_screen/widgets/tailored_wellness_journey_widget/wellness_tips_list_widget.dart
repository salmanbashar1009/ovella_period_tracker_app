import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class WellnessTipsList extends StatelessWidget{
  const WellnessTipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        itemBuilder: (_, index){
        return Container(
          width: 271.w,
          padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 8.h,bottom: 12.h),
          margin: EdgeInsets.only(right: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 12.h,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                child: Image.asset('assets/images/home_screen/wellness_tips.png',
                  fit: BoxFit.cover,
                ),
              ),

              Text("Personalized Wellness Tips",
              style: Theme.of(context).textTheme.headlineLarge,),

              Text("AI-driven diet, workout, and wellness tips tailored for your cycle or maternity.",
              style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: 12.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 6.w,
                children: [
                  Image.asset('assets/icons/love.png',
                  width: 16,
                      height: 16,
                      fit: BoxFit.cover
                    ,),
                  Text("103",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightTextColor
                  ),),
                  Spacer()
                ],
              ),

            ],
          ),
        );
        }
    );
  }
}