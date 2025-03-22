import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../../../utility/utils.dart';
import '../widget/toggle_question_widget.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<StepScreenProvider>(
      builder: (BuildContext context, stepScreenProvider, Widget? child) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Health Profile", style: textTheme.headlineLarge),
              Text(
                "Help Ovella better understand your needs.",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),
              ),
              ToggleQuestionWidget(
                title: 'Do you have a regular cycle?',
                value: stepScreenProvider.isRegularCircle,
                onChanged: (bool newValue) {
                  stepScreenProvider.toggleIsRegularCircle(newValue);
                },
              ),
              ToggleQuestionWidget(
                title: 'Are you currently pregnant?',
                value: stepScreenProvider.isCurrentlyPregnant,
                onChanged: (bool newValue) {
                  stepScreenProvider.toggleIsCurrentlyPregnant(newValue);
                },
              ),
              ToggleQuestionWidget(
                title: 'Do you experience irregular periods or PCOS?',
                value: stepScreenProvider.isExperienceIrregularPeriods,
                onChanged: (bool newValue) {
                  stepScreenProvider.toggleIsExperienceIrregularPeriods(newValue);
                },
                height: 80,
              ),
              Text(
                "Any health conditions you'd like to track?",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 8.h,),
              TextFormField(
                maxLines: 4,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: Utils.primaryButton(
                  title: 'Next',
                  context: context,
                  padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 18.h),
                  onTap: () {
                    stepScreenProvider.updatePage(
                      stepScreenProvider.currentIndex + 1,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
