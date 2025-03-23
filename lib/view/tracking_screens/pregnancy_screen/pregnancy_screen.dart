import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/log_symtoms_card.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/checkup_vacation_list.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/image_slider.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/pregnancy_image_slider_container.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/section_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/week_list.dart';
import 'package:provider/provider.dart';
import '../../../constant/images.dart';
import '../../../view_model/home_screen_provider.dart';
import '../../../view_model/pregnancy_screen_provider.dart';
import '../../home_screen/add_log_screen/widget/build_log_item_widget.dart';

class PregnancyScreen extends StatelessWidget {
  const PregnancyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PregnancyScreenProvider>(
      builder: (BuildContext context, pregnancyScreenProvider, Widget? child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, John Doe",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Week ${pregnancyScreenProvider.selectedWeek} of your pregnancy",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(height: 24.h),

              /// show list of weeks to track pregnancy
              WeekList(),
              SizedBox(height: 20.h),

              /// image slider container : shows conception and due date with baby images
              PregnancyImageSliderContainer(),
              SectionHeader(title: "My Daily Insight"),

              /// log card row for symptoms and mood
              Row(
                children: [
                  LogCard(
                    onAddPressed: () {
                      final homeScreenProvider =
                          context.read<HomeScreenProvider>();
                      homeScreenProvider.onLog(
                        logTo: homeScreenProvider.symptomsLog,
                      );
                      Navigator.pushNamed(context, RouteName.addLogScreen);
                    },
                    title: "Log your Symptoms",
                  ),
                  SizedBox(width: 16.w),
                  LogCard(
                    onAddPressed: () {
                      final homeScreenProvider =
                          context.read<HomeScreenProvider>();
                      homeScreenProvider.onLog(
                        logTo: homeScreenProvider.moodLog,
                      );
                      Navigator.pushNamed(context, RouteName.addLogScreen);
                    },
                    title: "Log your Mood",
                  ),
                ],
              ),

              /// Show symptoms list if not empty
              Consumer<HomeScreenProvider>(
                builder: (_, homeScreenProvider, _) {
                  return homeScreenProvider.selectedSymptoms.isNotEmpty
                      ? Column(
                        spacing: 12.h,
                        children: [
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Symptoms",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              GestureDetector(
                                onTap: () {
                                  final homeScreenProvider =
                                  context.read<HomeScreenProvider>();
                                  homeScreenProvider.onLog(
                                    logTo: homeScreenProvider.symptomsLog,
                                  );
                                  Navigator.pushNamed(context, RouteName.addLogScreen);
                                },
                                child: Image.asset(
                                  AppImages.editIcon,
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          IgnorePointer(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children:
                                    homeScreenProvider.selectedSymptoms
                                        .map(
                                          (symptom) => BuildLogItem(
                                            logItem: symptom,
                                            onSelect:
                                                homeScreenProvider.onSelectLog,
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ),
                        ],
                      )
                      : SizedBox();
                },
              ),
              /// show mood list if not empty
              Consumer<HomeScreenProvider>(
                builder: (_, homeScreenProvider, _) {
                  return homeScreenProvider.selectedMoods.isNotEmpty
                      ? Column(
                        spacing: 12.h,
                        children: [
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mood",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              GestureDetector(
                                onTap: () {
                                  final homeScreenProvider =
                                  context.read<HomeScreenProvider>();
                                  homeScreenProvider.onLog(
                                    logTo: homeScreenProvider.moodLog,
                                  );
                                  Navigator.pushNamed(context, RouteName.addLogScreen);
                                },
                                child: Image.asset(
                                  AppImages.editIcon,
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                      
                          IgnorePointer(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children:
                                    homeScreenProvider.selectedMoods
                                        .map(
                                          (symptom) => BuildLogItem(
                                            logItem: symptom,
                                            onSelect:
                                                homeScreenProvider.onSelectLog,
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ),
                        ],
                      )
                      : SizedBox();
                },
              ),


              SectionHeader(title: "Checkup & Vacation"),
              /// checkup and vacation card list
              CheckupVacationList(),
            ],
          ),
        );
      },
    );
  }
}

