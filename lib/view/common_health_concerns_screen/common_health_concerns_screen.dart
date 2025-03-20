import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../utility/utils.dart';
import 'widgets/health_concern_selected_button.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/background_widget.dart';
import 'widgets/common_heath_concern_header_widget.dart';

class CommonHealthConcernsScreen extends StatelessWidget {
  const CommonHealthConcernsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: Consumer<StepScreenProvider>(
          builder: (BuildContext context, stepScreenProvider, Widget? child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonHeathScreenConcernHeaderWidget(),
                      SizedBox(height: 24.h),
                      Text(
                        "Let's Get to Know You",
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "Share more about yourself to help us tailor your experience",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.h,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      HealthConcernSelectedButton(
                        title: 'Have you been diagnosed with fibroids?',
                        options: ['Yes', 'No'],
                        selectedOption: stepScreenProvider.diagnosedWithFibroids,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider.updateDiagnosedWithFibroids(
                            newValue,
                          );
                        },
                      ),
                      HealthConcernSelectedButton(
                        title:
                            'Have you been diagnosed with PCOS (Polycystic Ovary Syndrome)?',
                        options: ['Yes', 'No'],
                        selectedOption: stepScreenProvider.diagnosedWithPCOS,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider.updateDiagnosedWithPCOS(newValue);
                        },
                      ),
                      HealthConcernSelectedButton(
                        title: 'Do you have a history of endometriosis??',
                        options: ['Yes', 'No'],
                        selectedOption: stepScreenProvider.historyOfEndometriosis,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider.updateHistoryOfEndometriosis(
                            newValue,
                          );
                        },
                      ),
                      HealthConcernSelectedButton(
                        title:
                            'Do you have a family history of fibroids or reproductive issues?',
                        options: ['Yes', 'No'],
                        selectedOption:
                            stepScreenProvider.familyHistoryOfFibroids,
                        onOptionSelected: (String newValue) {
                          stepScreenProvider.updateFamilyHistoryOfFibroids(
                            newValue,
                          );
                        },
                      ),
                      SizedBox(height: 7.h,),
                      SizedBox(
                        width: double.infinity,
                        child: Utils.primaryButton(
                          title: 'Continue',
                          context: context,
                          padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 18.h),
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.pregnancyFertilityTracking);
                          },
                        ),
                      ),
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
