import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/forum_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/categoryList.dart';
import 'package:ovella_period_tracker_app/view/home_screen/add_log_screen/arguments_model/arguments_model.dart';
import 'package:ovella_period_tracker_app/view/home_screen/add_log_screen/widget/build_log_item_widget.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/calender_grid.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/fertile_alert_sheet.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/log_symtoms_card.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/month_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/next_period_alert_sheet.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/ovulation_alert_sheet.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/period_alert_sheet.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/week_day_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/section_header.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../home_screen/widgets/tailored_wellness_journey_widget/wellness_tips_list_widget.dart';

class MenstrualFertilityScreen extends StatelessWidget {
  const MenstrualFertilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trackingScreenProvider = Provider.of<TrackingScreenProvider>(
      context,
      listen: false,
    );
    final appLocalization = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: AppColors.onPrimary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// calendar month & year header
                    const MonthHeader(),
                    const SizedBox(height: 20),

                    /// calendar week day header
                    const WeekdayHeader(),
                    const SizedBox(height: 10),

                    /// calendar day number grid list
                    SizedBox(
                      height: 300.h,
                      width: double.infinity,
                      child: Consumer<TrackingScreenProvider>(
                        builder: (context, trackingScreenProvider, _) {
                          return IgnorePointer(
                            child: CalendarGrid(
                              borderColor: Colors.transparent,
                              year:
                                  trackingScreenProvider.selectedMonthYear.year,
                              month:
                                  trackingScreenProvider
                                      .selectedMonthYear
                                      .month,
                              onTap:
                                  (numb) =>
                                      trackingScreenProvider.toggleBorder(numb),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              /// Added Note list
              ...List.generate(trackingScreenProvider.notes.length, (index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.r),
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appLocalization.note,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(fontSize: 17.sp),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors.textColor,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "3 Mar,25",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontSize: 13.sp),
                              ),
                              SizedBox(width: 30.w),
                              GestureDetector(
                                onTap: () {
                                  trackingScreenProvider.removeNotes(index);
                                },
                                child: Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.edit_calendar_outlined,
                            color: AppColors.textColor,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              trackingScreenProvider.notes[index],
                              maxLines: null,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: AppColors.lightTextColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),

              SizedBox(height: 8.h),

              // activity tile row
              Row(
                children: [
                  /// period activity tile: can add note, edit period date and remove period date
                  activityTile(
                    context: context,
                    bgColor: AppColors.secondary,
                    imagePath: AppImages.periodTileIcon,
                    title: "Period",
                    onTap: () {
                      showPeriodAlertDialogSheet(context);
                    },
                  ),
                  SizedBox(width: 12.w),

                  /// Fertile activity tile
                  activityTile(
                    context: context,
                    bgColor: AppColors.fertileColor,
                    imagePath: AppImages.fertileTileIcon,
                    title: "Fertile",
                    onTap: () {
                      showFertileAlertDialogSheet(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.w),

              // activity tile row
              Row(
                children: [
                  /// Ovulation activity tile
                  activityTile(
                    context: context,
                    bgColor: AppColors.ovulationColor,
                    imagePath: AppImages.ovulationTileIcon,
                    title: "Ovulation",
                    onTap: () {
                      showOvulationAlertDialogSheet(context);
                    },
                  ),
                  SizedBox(width: 12.w),

                  /// Next period activity tile
                  activityTile(
                    context: context,
                    bgColor: AppColors.nextPeriodColor,
                    imagePath: AppImages.nextPeriodTileIcon,
                    title: "Next Period",
                    onTap: () {
                      showNextPeiodAlertDialogSheet(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              /// log your symptoms card
              LogCard(
                onAddPressed: () {
                  final homeScreenProvider = context.read<HomeScreenProvider>();
                  homeScreenProvider.onLog(
                    logTo: homeScreenProvider.symptomsLog,
                  );
                  Navigator.pushNamed(
                    context,
                    RouteName.addLogScreen,
                    arguments: AddLogScreenArguments(
                      isBackButtonOnAppBar: true,
                      onSave: () {},
                      saveButtonText: "Save",
                    ),
                  );
                },
                title: 'Log your Symptoms',
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
                                  debugPrint(
                                    "\nSymptoms Edit button pressed\n",
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.addLogScreen,
                                    arguments: AddLogScreenArguments(
                                      isBackButtonOnAppBar: true,
                                      onSave: () {},
                                      saveButtonText: "Save",
                                    ),
                                  );
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children:
                                  homeScreenProvider.selectedSymptoms
                                      .map(
                                        (symptom) => BuildLogItem(
                                          isEditMode: homeScreenProvider.isSymptomsEditMode,
                                          logItem: symptom,
                                          onSelect:
                                              homeScreenProvider.onSelectLog,
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      )
                      : SizedBox();
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        CategorySection(
          title: "Menstrual Health",
          categories: categories1,
          routeName: RouteName.menstralScreen,
        ),

        Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: SectionHeader(title: "Tailored Wellness Journey",textButton: "See all",onTap: (){Navigator.pushNamed(context,RouteName.wellnessTipsScreen);},),
        ),
        /// Wellness tips list
        SizedBox(
          height: MediaQuery.of(context).size.height < 660 ? 380.h : 325.h,
          child: WellnessTipsList(),
        ),
      ],
    );
  }

  /// custom activity tile widget
  Widget activityTile({
    required BuildContext context,
    required Color bgColor,
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    final screenHeight =
        MediaQuery.of(
          context,
        ).size.height; // Start with a ScreenUtil-based height
    final responsiveHeight = screenHeight * 0.09; // Clamp between 70.h and 90.h

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 12.w, bottom: 12.h, top: 12.h),

        width: 175.w,
        height: responsiveHeight - 12,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                shape: BoxShape.circle,
              ),
              child: Image(image: AssetImage(imagePath)),
            ),
            SizedBox(width: 8.h),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
