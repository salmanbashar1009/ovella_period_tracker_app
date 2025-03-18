import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class LogPeriodScreen extends StatelessWidget {
  const LogPeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: AppBar(
                leading: Utils.backButton(context),
                title: Text(
                  "Log Period",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),

            Padding(
              padding: AppPadding.screenPadding,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: Consumer<HomeScreenProvider>(
                      builder: (_, homeScreenProvider, child) {
                        return TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                          calendarFormat: CalendarFormat.month,
                          selectedDayPredicate: (day) {
                            /// Check if the day is in the selected days list
                            return homeScreenProvider.isSelected(day);
                          },

                          onDaySelected: (selectedDay, focusedDay) {
                            /// Update the selected days in the ViewModel
                            homeScreenProvider.toggleSelectedDay(selectedDay);
                          },

                          /// style of calendar
                          calendarStyle: CalendarStyle(
                            todayTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: AppColors.textColor
                            ),
                            defaultDecoration: BoxDecoration(
                              color: Colors.transparent, // Focused day color
                              shape: BoxShape.rectangle

                          ),
                            todayDecoration: BoxDecoration(
                              color: Colors.transparent, // Focused day color
                              shape: BoxShape.rectangle

                            ),
                            selectedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.textColor
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.transparent, /// Focused day color
                              borderRadius: BorderRadius.circular(12.r), /// Rounded corners
                              border: Border.all(
                                color: AppColors.secondary,
                                width: 1.5
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          //  todayDecoration:
                            // Customizing the focusedDay
                            // focusedDecoration: BoxDecoration(
                            //   color: Colors.blue, // Focused day color
                            //   borderRadius: BorderRadius.circular(12), // Rounded corners
                            //   border: Border.all(
                            //     color: Colors.blueAccent, // Border color
                            //     width: 2, // Border width
                            //   ),
                            // ),
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  SizedBox(
                    width: double.infinity,
                    child: Utils.primaryButton(
                        title: "Save",
                        context: context,
                        onTap: (){Navigator.pop(context);},
                      padding: EdgeInsets.symmetric(vertical: 18.h)
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
