import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/header.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/log_widget/log_widget.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_date_calendar/period_date_container.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_tips_slider/period_tips.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/tailored_wellness_journey_widget/wellness_tips_list_widget.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

         Image.asset(AppImages.screenBackground),

          SafeArea(
              child: Padding(
                  padding: AppPadding.screenPadding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Header(),

                      SizedBox(height: 10.h,),

                      PeriodTips(),

                      PeriodDateContainer(),

                      SizedBox(height: 16.h,),

                      Row(
                        children: [
                          Expanded(
                            child: LogWidget(
                              text: "Log your\nSymptoms",
                              onAdd: (){},
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: LogWidget(
                              text: "Log your\nMood",
                              onAdd: (){},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tailored Wellness\njourney",
                          style: Theme.of(context).textTheme.headlineLarge,),

                          Text("See all",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.lightTextColor
                            ),),
                        ],
                      ),

                      SizedBox(height: 16.h,),

                      SizedBox(
                          height: 380.h,
                          child: WellnessTipsList()),

                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}