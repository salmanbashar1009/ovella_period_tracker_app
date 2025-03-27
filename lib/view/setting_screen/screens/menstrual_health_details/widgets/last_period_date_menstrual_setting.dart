import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../../../view_model/step_screen_provider.dart';
import '../../../../pregnancy_fertility_tracking/widgets/period_date_range_selection_widget.dart';

class LastPeriodDateMenstrualSetting extends StatelessWidget {
  const LastPeriodDateMenstrualSetting({
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
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>PeriodDateRangeSelection())),
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