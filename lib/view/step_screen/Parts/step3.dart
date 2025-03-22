import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:provider/provider.dart';
import '../../../../utility/utils.dart';
import '../../../../view_model/step_screen_provider.dart';
import '../widget/toggle_question_widget.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<StepScreenProvider>(
      builder: (BuildContext context, stepScreenProvider, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Preferences & Reminders", style: textTheme.headlineLarge),
            Text(
              "Stay informed with personalized alerts.",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
            ToggleQuestionWidget(
              title: 'Enable period & ovulation reminders?',
              value: stepScreenProvider.isPeriodOvulationReminders,
              onChanged: (bool newValue) {
                stepScreenProvider.toggleIsPeriodOvulationReminders(newValue);
              },
              height: 80,
            ),
            ToggleQuestionWidget(
              title: 'Enable WhatsApp updates for health tips & cycle tracking.',
              value: stepScreenProvider.isWhatsAppUpdatesHealthTips,
              onChanged: (bool newValue) {
                stepScreenProvider.toggleIsWhatsAppUpdatesHealthTips(newValue);
              },
              height: 80,
            ),

            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: Utils.primaryButton(
                title: 'Next',
                context: context,
                padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 18.h),
                onTap: () {
                  Navigator.pushNamed(context, RouteName.commonHealthConcernScreen);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
