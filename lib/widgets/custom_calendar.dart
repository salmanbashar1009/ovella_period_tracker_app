import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/month_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/week_day_header.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

import '../theme/theme/theme_extensions/color_palette.dart';
import '../view/tracking_screens/menstrual_fertility_screens/widgets/calender_grid.dart' show CalendarGrid;

class CustomCalendar extends StatelessWidget {
  CustomCalendar({
    super.key,required this.onTap
  });

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(16.r),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.onPrimary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MonthHeader(),
          const SizedBox(height: 20),
          const WeekdayHeader(),
          const SizedBox(height: 10),
          SizedBox(
            height: 290.h,
            width: double.infinity,
            child: Consumer<TrackingScreenProvider>(
              builder: (context, trackingScreenProvider, _) {
                return CalendarGrid(
                  year: trackingScreenProvider.selectedMonthYear.year,
                  month: trackingScreenProvider.selectedMonthYear.month,
                  onTap: onTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}