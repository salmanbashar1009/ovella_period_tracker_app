import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../../view_model/step_screen_provider.dart';

class PregnancyStatusMenstrualSetting extends StatelessWidget {
  const PregnancyStatusMenstrualSetting({
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
          "Pregnancy Status",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () {},
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
                  stepScreenProvider.isCurrentlyPregnant
                      ? 'Pregnant'
                      : 'Not Pregnant',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}