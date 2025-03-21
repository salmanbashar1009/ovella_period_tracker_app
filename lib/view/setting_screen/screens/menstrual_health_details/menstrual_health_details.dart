import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/header_widget/header_widget.dart';
import 'package:ovella_period_tracker_app/view/step_screen/widget/header_widget.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import '../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../utility/utils.dart';
import '../../../pregnancy_fertility_tracking/cycle_selection_screen.dart';
import '../../../pregnancy_fertility_tracking/widgets/period_date_range_selection_widget.dart';

class MenstrualHealthDetails extends StatefulWidget {
  const MenstrualHealthDetails({super.key});

  @override
  State<MenstrualHealthDetails> createState() => _MenstrualHealthDetailsState();
}

class _MenstrualHealthDetailsState extends State<MenstrualHealthDetails> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: Padding(
          padding: AppPadding.screenHorizontalPadding,
          child: Column(
            children: [
              SizedBox(height: 12.h),
              HeaderWidget(title: 'Menstrual & Health Details'),
              SizedBox(height: 24.h),
              Consumer<StepScreenProvider>(
                builder: (
                  BuildContext context,
                  stepScreenProvider,
                  Widget? child,
                ) {
                  return Container(
                    padding: AppPadding.screenPadding,
                    decoration: BoxDecoration(
                      color: AppColors.onPrimary,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CycleLengthMenstrualSetting(
                              textTheme: textTheme,
                              stepScreenProvider: stepScreenProvider,
                            ),
                            LastPeriodDateMenstrualSetting(textTheme: textTheme,stepScreenProvider: stepScreenProvider,),
                            SizedBox(height: 8.h),
                            Text(
                              "Pregnancy Status",
                              style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.h,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                height: 54.h,
                                width: double.infinity,
                                padding: EdgeInsets.all(16.h),
                                decoration: BoxDecoration(
                                  color: AppColors.onPrimary,
                                  border: Border.all(
                                    color: Color(0xff1E1E1E).withOpacity(0.12),
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      stepScreenProvider.isCurrentlyPregnant?'Pregnant':'Not Pregnant',
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Health Conditions",
                              style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.h,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                height: 54.h,
                                width: double.infinity,
                                padding: EdgeInsets.all(16.h),
                                decoration: BoxDecoration(
                                  color: AppColors.onPrimary,
                                  border: Border.all(
                                    color: Color(0xff1E1E1E).withOpacity(0.12),
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      stepScreenProvider.diagnosedWithPCOS=='Yes'?'PCOS':'Not PCOS',
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 24.h),
                            SizedBox(
                              width: double.infinity,
                              child: Utils.primaryButton(
                                title: 'Save',
                                context: context,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32.w,
                                  vertical: 18.h,
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LastPeriodDateMenstrualSetting extends StatelessWidget {
  const LastPeriodDateMenstrualSetting({
    super.key,
    required this.textTheme, required this.stepScreenProvider,
  });

  final TextTheme textTheme;
  final StepScreenProvider stepScreenProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          "Last Period",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap:
              () => selectDateRange(
                context,
                stepScreenProvider,
              ),
          child: Container(
            height: 54.h,
            width: double.infinity,
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: AppColors.onPrimary,
              border: Border.all(
                color: Color(0xff1E1E1E).withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    Text(
                      stepScreenProvider.formatDate(
                        stepScreenProvider.periodStartDate,
                      ),
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
                Icon(Icons.calendar_month),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CycleLengthMenstrualSetting extends StatelessWidget {
  const CycleLengthMenstrualSetting({
    super.key,
    required this.textTheme,
    required this.stepScreenProvider,
  });

  final TextTheme textTheme;
  final StepScreenProvider stepScreenProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cycle Length",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CycleSelectionScreen(
                        allCycleLength: stepScreenProvider.cycleLength,
                        stepScreenProvider: stepScreenProvider,
                      ),
                ),
              ),
          child: Container(
            height: 54.h,
            width: double.infinity,
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: AppColors.onPrimary,
              border: Border.all(color: Color(0xff1E1E1E).withOpacity(0.12)),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${stepScreenProvider.selectedCycleLength} Days",
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
