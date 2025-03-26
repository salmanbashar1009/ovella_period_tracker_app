import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/pregnancy_screen_provider.dart';
import 'package:provider/provider.dart';

class WeekList extends StatelessWidget {
  const WeekList({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<PregnancyScreenProvider>(
      builder: (BuildContext context, pregnancyScreenProvider, Widget? child) {
        return SizedBox(
          height: 42.h,
          width: double.infinity,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pregnancyScreenProvider.weekList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  pregnancyScreenProvider.updatedSelectedWeek(index);
                },
                child: Container(
                  width: 85.w,
                  margin: EdgeInsets.only(
                      left: index == pregnancyScreenProvider.weekList.first ? 24.w : 0,
                      right: index == pregnancyScreenProvider.weekList.last ? 24.w : 8.w),
                  decoration: BoxDecoration(
                    color:
                        pregnancyScreenProvider.selectedWeek == index
                            ? AppColors.primary
                            : AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: Text(
                      "Week $index",
                      style: textTheme.bodyMedium!.copyWith(
                        color:
                            pregnancyScreenProvider.selectedWeek == index
                                ? AppColors.onPrimary
                                : AppColors.primary,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
