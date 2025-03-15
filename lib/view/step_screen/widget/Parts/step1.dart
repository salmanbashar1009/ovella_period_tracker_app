import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/step_screen/widget/widgets/language_selection.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/age_selection.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final formkey = GlobalKey<FormState>();
    return Consumer<StepScreenProvider>(
      builder: (BuildContext context, stepScreenProvider, Widget? child) {
        if (stepScreenProvider.stepOneMode == 'age') {
          return AgeSelection(
            textTheme: textTheme,
            allAges: stepScreenProvider.allAges,
            stepScreenProvider: stepScreenProvider,
          );
        } else if (stepScreenProvider.stepOneMode == 'language') {
          return LanguageSelection(
            textTheme: textTheme,
            stepScreenProvider: stepScreenProvider,
            allLanguages: stepScreenProvider.allLanguages,
          );
        }
        return Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Let's Get to Know You", style: textTheme.headlineLarge),
                Text(
                  "Share more about yourself to help us tailor your experience",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Full Name",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Age",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {
                    stepScreenProvider.stepOneModeSelection('age');
                  },
                  child: Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.onPrimary,
                      border: Border.all(
                        color: Color(0xff1E1E1E).withOpacity(0.12),
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Preferred Language",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {
                    stepScreenProvider.stepOneModeSelection('language');
                  },
                  child: Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.onPrimary,
                      border: Border.all(
                        color: Color(0xff1E1E1E).withOpacity(0.12),
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
                SizedBox(height: 24.h,),
                Utils.primaryButton(
                  title: 'Next',
                  textTheme: textTheme,
                  colorScheme: colorScheme,
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      stepScreenProvider.stepOneModeSelection('age');
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
