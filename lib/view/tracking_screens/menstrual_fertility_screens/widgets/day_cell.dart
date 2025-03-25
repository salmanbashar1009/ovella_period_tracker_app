import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

class DayCell extends StatelessWidget {
  final int day;
  final int month;
  final int year;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const DayCell({
    Key? key,
    required this.day,
    this.backgroundColor,
    required this.onTap,
    required this.month,
    required this.year, this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border:
                context.watch<TrackingScreenProvider>().borderSet.contains(
                      DateTime(year, month, day),
                    )
                    ? Border.all(color: AppColors.secondary)
                    : Border.all(color: borderColor!), // Border.all(color: AppColors.lightTextColor.withOpacity(0.2)),
          ),
          child: Center(
            child: Text(
              day.toString(),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color:
                    backgroundColor == AppColors.secondary || backgroundColor == AppColors.ovulationColor ?
                    AppColors.onPrimary : AppColors.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// color: backgroundColor == const Color(0xFFFF5B79) ? Colors.white : Colors.black,
