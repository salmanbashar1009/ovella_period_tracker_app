import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/padding.dart';
import '../../../../view_model/step_screen_provider.dart';
import '../../../../widgets/background_widget.dart';
import 'widgets/cycle_length_menstrual_setting.dart';
import 'widgets/health_condition_menstrual_setting.dart';
import 'widgets/pregnancy_status_menstrual_setting.dart';
import 'widgets/last_period_date_menstrual_setting.dart';
import 'package:provider/provider.dart';
import '../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../utility/utils.dart';
import '../header_widget/header_widget.dart';

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
                            ///<------- Cycle Length -------->
                            CycleLengthMenstrualSetting(
                              textTheme: textTheme,
                              stepScreenProvider: stepScreenProvider,
                            ),

                            ///<------ Last period date -------->
                            LastPeriodDateMenstrualSetting(
                              textTheme: textTheme,
                              stepScreenProvider: stepScreenProvider,
                            ),

                            ///<------ Pregnancy Status -------->
                            PregnancyStatusMenstrualSetting(
                              textTheme: textTheme,
                              stepScreenProvider: stepScreenProvider,
                            ),

                            ///<------ Health Conditions ------>
                            HealthConditionMenstrualSetting(
                              textTheme: textTheme,
                              stepScreenProvider: stepScreenProvider,
                            ),

                            ///<------ Save Button primary ------>
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
