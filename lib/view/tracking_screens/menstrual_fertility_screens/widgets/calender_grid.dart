import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

import 'day_cell.dart';

class CalendarGrid extends StatelessWidget {
  final int year;
  final int month;
  final Color? borderColor;
  Function(int)  onTap;

   CalendarGrid({
    super.key,
    required this.year,
    required this.month, //required this.onTap,
    required this.onTap, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final trackingScreenProvider = Provider.of<TrackingScreenProvider>(context, listen: false);

    // Calculate first day of month
    final firstDayOfMonth = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;

    // Calculate starting weekday (0 = Sunday, 1 = Monday, etc.)
    final firstWeekdayOfMonth = firstDayOfMonth.weekday % 7;

    // Calculate number of rows needed
    final totalDays = firstWeekdayOfMonth + daysInMonth;
    final rowCount = (totalDays / 7).ceil();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: rowCount * 7,
      itemBuilder: (context, index) {
        final dayOffset = index - firstWeekdayOfMonth;

        if (dayOffset < 0 || dayOffset >= daysInMonth) {
          return const SizedBox.shrink();
        }

        final dayNumber = dayOffset + 1;
        final dayColor = trackingScreenProvider.getDayColor(dayNumber,);

        return Consumer<TrackingScreenProvider>(
          builder: (context,trackingScreenProvider,child) {
            return DayCell(
              borderColor: borderColor,
              year: year,
              month: month,
              day: dayNumber,
              backgroundColor: dayColor,
              onTap: (){
                // trackingScreenProvider.toggleBorder(dayNumber);
                onTap(dayNumber);
              },
            );
          }
        );
      },
    );
  }
}