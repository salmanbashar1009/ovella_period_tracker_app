import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/header.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/log_widget/log_widget.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_date_calendar/period_date_container.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/period_tips_slider/period_tips.dart';
import 'package:ovella_period_tracker_app/view/home_screen/widgets/tailored_wellness_journey_widget/wellness_tips_list_widget.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/background_widget.dart';
import 'add_log_screen/arguments_model/arguments_model.dart';
import 'add_log_screen/widget/build_log_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    debugPrint("\nheight : $deviceHeight\n");

    final translate = AppLocalizations.of(context);

    return BackgroundWidget(
      child: SingleChildScrollView(
        controller:
            context.read<HomeScreenProvider>().homeScreenScrollController,
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  /// App Bar
                  Header(),

                  SizedBox(height: 10.h),

                  /// Page view tips with dot indicator
                  PeriodTips(),

                  Padding(
                    padding: AppPadding.screenHorizontalPadding,
                    child: Column(
                      children: [
                        /// Period date count Container
                        PeriodDateContainer(),

                        SizedBox(height: 16.h),

                        /// Log your symptoms / mood Row
                        Row(
                          children: [
                            Expanded(
                              child: LogWidget(
                                imageIconPath: AppImages.symptomsIcon,
                                text: "Log your\nSymptoms",
                                onAdd: () {
                                  final homeScreenProvider =
                                      context.read<HomeScreenProvider>();
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
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: LogWidget(
                                imageIconPath: AppImages.moodIcon,
                                text: "Log your\nMood",
                                onAdd: () {
                                  final homeScreenProvider =
                                      context.read<HomeScreenProvider>();
                                  homeScreenProvider.onLog(
                                    logTo: homeScreenProvider.moodLog,
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.addLogScreen,
                                    arguments: AddLogScreenArguments(
                                      isBackButtonOnAppBar: true,
                                      onSave: () {},
                                      saveButtonText: translate!.save,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        Consumer<HomeScreenProvider>(
                          builder: (_, homeScreenProvider, _) {
                            return homeScreenProvider
                                    .selectedSymptoms
                                    .isNotEmpty
                                ? Column(
                                  spacing: 12.h,
                                  children: [
                                    SizedBox(height: 16.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          translate!.symptoms,
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.headlineSmall,
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                              "\nSymptoms Edit button pressed\n",
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
                                                        homeScreenProvider
                                                            .onSelectLog,
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

                        Consumer<HomeScreenProvider>(
                          builder: (_, homeScreenProvider, _) {
                            return homeScreenProvider.selectedMoods.isNotEmpty
                                ? Column(
                                  spacing: 12.h,
                                  children: [
                                    SizedBox(height: 16.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Mood",
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.headlineSmall,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                              "\Mood Edit button pressed\n",
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
                                            homeScreenProvider.selectedMoods
                                                .map(
                                                  (symptom) => BuildLogItem(
                                                    isEditMode: homeScreenProvider.isMoodsEditMode,
                                                    logItem: symptom,
                                                    onSelect:
                                                        homeScreenProvider
                                                            .onSelectLog,
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

                        SizedBox(height: 16.h),

                        /// Wellness tips header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tailored Wellness\njourney",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),

                            TextButton(
                              child: Text(
                                "See all",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightTextColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.lightTextColor,
                                ),
                              ),
                              onPressed: () {
                                /// After additional screen proposal offer accept this route should be comment out
                                // Navigator.pushNamed(context,RouteName.wellnessTipsScreen);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              /// Wellness tips list
              SizedBox(
                height: deviceHeight < 660 ? 380.h : 325.h,
                child: WellnessTipsList(),
              ),

              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}
