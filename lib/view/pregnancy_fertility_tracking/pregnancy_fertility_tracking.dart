import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/pregnancy_fertility_tracking/widgets/cycle_select_widget.dart';
import 'package:ovella_period_tracker_app/view/pregnancy_fertility_tracking/widgets/period_date_range_selection_widget.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import '../../theme/theme/theme_extensions/color_palette.dart';
import '../../utility/utils.dart';
import '../../view_model/step_screen_provider.dart';
import '../common_health_concerns_screen/widgets/common_heath_concern_header_widget.dart';
import '../common_health_concerns_screen/widgets/health_concern_selected_button.dart';

class PregnancyFertilityTracking extends StatelessWidget {
  const PregnancyFertilityTracking({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: Consumer<StepScreenProvider>(
          builder: (BuildContext context, stepScreenProvider, Widget? child) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonHeathScreenConcernHeaderWidget(),
                      SizedBox(height: 24.h),
                      Text(
                        "Pregnancy & Fertility Tracking",
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "Track your fertility and pregnancy journey with key health insights.",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.h,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      HealthConcernSelectedButton(
                        title: 'Are you actively trying to conceive?',
                        options: ['Yes', 'No', 'Considering'],
                        selectedOption:
                            stepScreenProvider.areYouActivelyTryingToConceive,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider
                              .updateAreYouActivelyTryingToConceive(newValue);
                        },
                      ),
                      HealthConcernSelectedButton(
                        title:
                            'Have you experienced pregnancy loss (miscarriage or stillbirth)?',
                        options: ['Yes', 'No'],
                        selectedOption:
                            stepScreenProvider.haveYouExperiencedPregnancyLoss,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider
                              .updateHaveYouExperiencedPregnancyLoss(newValue);
                        },
                      ),
                      HealthConcernSelectedButton(
                        title:
                            'Do you have a history of high blood pressure or preeclampsia during pregnancy?',
                        options: ['Yes', 'No'],
                        selectedOption:
                            stepScreenProvider
                                .doYouHaveHistoryOfHighBloodPressure,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider
                              .updateDoYouHaveHistoryOfHighBloodPressure(
                                newValue,
                              );
                        },
                      ),
                      HealthConcernSelectedButton(
                        title:
                            'Have you been diagnosed with fertility conditions (e.g., low ovarian reserve, unexplained infertility)?',
                        options: ['Yes', 'No'],
                        selectedOption:
                            stepScreenProvider
                                .haveYouBeenDiagnosedWithFertilityConditions,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider
                              .updateHaveYouBeenDiagnosedWithFertilityConditions(
                                newValue,
                              );
                        },
                      ),
                      SizedBox(height: 8.h),
                      CycleSelectWidget(
                        textTheme: textTheme,
                        stepScreenProvider: stepScreenProvider,
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap:
                            () => Navigator.push(context, MaterialPageRoute(builder: (context)=>PeriodDateRangeSelection())),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Last Period"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    stepScreenProvider.formatDate(
                                      stepScreenProvider.periodStartDate,
                                    ),
                                    style: textTheme.bodyMedium,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xff6B788E),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: Utils.primaryButton(
                          title: 'Finish Setup',
                          context: context,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 18.h,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.createAccountScreen,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
