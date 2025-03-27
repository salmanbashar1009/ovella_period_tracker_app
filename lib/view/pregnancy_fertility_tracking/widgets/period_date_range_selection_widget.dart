import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../constant/images.dart';
import '../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../view_model/step_screen_provider.dart';

class PeriodDateRangeSelection extends StatelessWidget {
  const PeriodDateRangeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Center(
                  child: Image.asset(AppImages.commonHeathConcernAppBarLogo),
                ),
                SizedBox(height: 24.h),
                Text("Select Your Last Period", style: textTheme.headlineLarge),
                Text(
                  "Stay in sync with your cycle – pick your last period’s start & end dates!",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.onPrimary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Consumer<StepScreenProvider>(
                    builder: (_, stepScreenProvider, child) {
                      return TableCalendar(
                        firstDay: DateTime.utc(DateTime.now().year - 1, 01, 01),
                        lastDay: DateTime.now(),
                        focusedDay:
                            stepScreenProvider.periodStartDate ??
                            DateTime.now(),
                        calendarFormat: CalendarFormat.month,
                        selectedDayPredicate: (day) {
                          return isSameDay(
                                stepScreenProvider.periodStartDate,
                                day,
                              ) ||
                              isSameDay(stepScreenProvider.periodEndDate, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          stepScreenProvider.selectDate(selectedDay);
                        },
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: false,
                          titleTextStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          leftChevronIcon: const Icon(
                            Icons.chevron_left,
                            color: AppColors.primary,
                          ),
                          rightChevronIcon: const Icon(
                            Icons.chevron_right,
                            color: AppColors.primary,
                          ),
                        ),
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.3),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          selectedDecoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.3),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          selectedTextStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            if (stepScreenProvider.periodStartDate != null &&
                                stepScreenProvider.periodEndDate != null &&
                                day.isAfter(
                                  stepScreenProvider.periodStartDate!,
                                ) &&
                                day.isBefore(
                                  stepScreenProvider.periodEndDate!,
                                )) {
                              return Container(
                                margin: const EdgeInsets.all(6.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.secondary.withOpacity(0.3),
                                  ),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  '${day.day}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                            return null; // Default behavior
                          },
                          selectedBuilder: (context, day, focusedDay) {
                            return Container(
                              margin: const EdgeInsets.all(6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(11.r),
                              ),
                              child: Text(
                                '${day.day}',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 50.h,),
                SizedBox(
                  width: double.infinity,
                  child: Utils.primaryButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    context: context,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 18.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
