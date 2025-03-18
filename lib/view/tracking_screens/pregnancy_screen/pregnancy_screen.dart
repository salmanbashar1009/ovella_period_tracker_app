import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/CategoryCard1.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/log_symtoms_card.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/checkup_vacation_list.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/image_slider.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/section_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/week_list.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_screen_provider.dart';
import '../../../view_model/pregnancy_screen_provider.dart';

class PregnancyScreen extends StatelessWidget {
  const PregnancyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PregnancyScreenProvider>(builder: (BuildContext context, pregnancyScreenProvider, Widget? child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, John Doe",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.lightTextColor,
                fontWeight: FontWeight.w400
            )),
            Text("Week ${pregnancyScreenProvider.selectedWeek} of your pregnancy",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp
            )),
            SizedBox(height: 24.h,),
            WeekList(),
            SizedBox(height: 20.h,),
            Container(
                width: 362.w,
                height: 373.h,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.onPrimary,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Conception Date",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightTextColor,
                                  fontWeight: FontWeight.w400
                              ),),
                              Text("March 3, 2025",style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Due Date",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightTextColor,
                                  fontWeight: FontWeight.w400
                              ),),
                              Text("December 3, 2025",style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      ImageSlider(),
                      SizedBox(height: 24.h,),
                      SliderDetailsButton(),
                    ]
                )
            ),
            SectionHeader(title:  "My Daily Insight"),
            Row(
              children: [
                LogCard(onAddPressed: (){
                  final homeScreenProvider =  context.read<HomeScreenProvider>();
                  homeScreenProvider.onLog(logTo: homeScreenProvider.moodLog);
                  Navigator.pushNamed(context, RouteName.addLogScreen);
                }, title: "Log your Symptoms"),
                SizedBox(width: 16.w,),
                LogCard(onAddPressed: (){
                  final homeScreenProvider =  context.read<HomeScreenProvider>();
                  homeScreenProvider.onLog(logTo: homeScreenProvider.symptomsLog);
                  Navigator.pushNamed(context, RouteName.addLogScreen);
                }, title: "Log your Mood"),
              ],
            ),
            SectionHeader(title:  "Checkup & Vacation"),
            CheckupVacationList()

          ],
        ),
      );
    },);
  }
}




