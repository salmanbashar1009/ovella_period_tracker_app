import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../../view_model/step_screen_provider.dart';
import '../../../../pregnancy_fertility_tracking/cycle_selection_screen.dart';
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
