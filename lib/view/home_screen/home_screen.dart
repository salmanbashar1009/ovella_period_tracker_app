import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/constant/images.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/header.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_date_calendar/period_date_container.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_tips_slider/period_tips.dart';

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