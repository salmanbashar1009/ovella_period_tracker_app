import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/header.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/log_widget/log_widget.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_date_calendar/period_date_container.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_tips_slider/period_tips.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/tailored_wellness_journey_widget/wellness_tips_list_widget.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/background_widget.dart';
import 'add_log_screen/widget/build_log_item_widget.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
          child: Column(
            children: [

              /// App Bar
              Padding(
                  padding: AppPadding.screenHorizontalPadding,
                child: Header(),
              ),

              Expanded(
                child: Padding(
                    padding: AppPadding.screenPadding,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        SizedBox(height: 10.h,),

                        /// Page view tips with dot indicator
                        PeriodTips(),

                        /// Period date count Container
                        PeriodDateContainer(),

                        SizedBox(height: 16.h,),

                        /// Log your symptoms / mood Row
                        Row(
                          children: [
                            Expanded(
                              child: LogWidget(
                                text: "Log your\nSymptoms",
                                onAdd: (){
                                  final homeScreenProvider =  context.read<HomeScreenProvider>();
                                  homeScreenProvider.onLog(logTo: homeScreenProvider.symptomsLog);
                                Navigator.pushNamed(context, RouteName.addLogScreen);
                                  },
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: LogWidget(
                                text: "Log your\nMood",
                                onAdd: (){
                                  final homeScreenProvider =  context.read<HomeScreenProvider>();
                                homeScreenProvider.onLog(logTo: homeScreenProvider.moodLog);
                                  Navigator.pushNamed(context, RouteName.addLogScreen);
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h,),

                        Consumer<HomeScreenProvider>(
                          builder: (_, homeScreenProvider, _){
                            return homeScreenProvider.selectedSymptoms.isNotEmpty ?
                            Column(
                              spacing: 12.h,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Symptoms",
                                    style: Theme.of(context).textTheme.headlineSmall,),
                                    Icon(Icons.edit,
                                    color: AppColors.iconColor,)
                                  ],
                                ),
                                Align(
                                  alignment:Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children:

                                    homeScreenProvider.selectedSymptoms.map(
                                          (symptom) =>
                                          BuildLogItem(
                                            symptom: symptom,
                                            onSelect: homeScreenProvider.onSelectLog,),).toList(),
                                  ),
                                ),
                              ],
                            ):SizedBox();
                          },
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
      ),
    );
  }
}