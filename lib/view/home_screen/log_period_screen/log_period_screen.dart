import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class LogPeriodScreen extends StatelessWidget {
  const LogPeriodScreen({super.key});

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: AppBar(
                leading: GestureDetector(
                  onTap: (){
                    context.read<HomeScreenProvider>().cancelLogPeriod();
                    Navigator.pop(context);
                  },
                  child: Utils.circleContainer(
                    imagePath: AppImages.arrowBackIcon,
                  ),
                ),
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
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Consumer<HomeScreenProvider>(
                      builder: (_, homeScreenProvider, child) {
                        // Define pre-selected days
                     //   final List<DateTime> preSelectedDays = homeScreenProvider.tempPeriodDaysSelection!;

                        return TableCalendar(
                          firstDay: DateTime.utc(DateTime.now().year-1, 01, 01),
                          lastDay: DateTime.utc(DateTime.now().year+1, 12, 31),
                          focusedDay: DateTime.now(),
                          calendarFormat: CalendarFormat.month,
                          selectedDayPredicate: (day) {
                            return homeScreenProvider.isSelected(day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                           // if (!homeScreenProvider.periodInformationModel!.nextPeriodDates.any((d) => isSameDay(d, selectedDay))) {
                             homeScreenProvider.toggleSelectedDay(selectedDay);
                          //  }
                          },
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false, // Hides the "2 weeks" button
                            titleCentered: false,
                            titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
                            rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
                          ),
                          calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                              color: const Color(0xffFF4A7A).withOpacity(0.3), /// Updated fill color
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            defaultDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            todayDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            todayTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.textColor
                            ),
                            outsideDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            weekendDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            holidayDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            disabledDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            markerDecoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          calendarBuilders: CalendarBuilders(
                            selectedBuilder: (context, day, focusedDay) {
                              bool isPreSelected = homeScreenProvider.periodInformationModel!.nextPeriodDates.any((d) => isSameDay(d, day));
                              return Container(
                                margin: const EdgeInsets.all(6.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isPreSelected
                                      ? const Color(0xffFF4A7A) /// Updated fill color
                                      : null,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(11.r),
                                  border: Border.all(
                                    color: const Color(0xffFF4A7A), // Updated border color
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  '${day.day}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: isPreSelected
                                        ? Colors.white : AppColors.textColor,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(20.r)
                  //   ),
                  //   child: Consumer<HomeScreenProvider>(
                  //     builder: (_, homeScreenProvider, child) {
                  //       return TableCalendar(
                  //         firstDay: DateTime.utc(2010, 10, 16),
                  //         lastDay: DateTime.utc(2030, 3, 14),
                  //         focusedDay: DateTime.now(),
                  //         calendarFormat: CalendarFormat.month,
                  //         selectedDayPredicate: (day) {
                  //           /// Check if the day is in the selected days list
                  //           return homeScreenProvider.isSelected(day);
                  //         },
                  //
                  //         onDaySelected: (selectedDay, focusedDay) {
                  //           /// Update the selected days in the ViewModel
                  //           homeScreenProvider.toggleSelectedDay(selectedDay);
                  //         },
                  //
                  //         /// style of calendar
                  //         calendarStyle: CalendarStyle(
                  //           selectedDecoration: BoxDecoration(
                  //             color: Colors.red.withOpacity(0.3),
                  //             shape: BoxShape.rectangle,
                  //             borderRadius: BorderRadius.circular(8.0),
                  //           ),
                  //           selectedTextStyle: const TextStyle(
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //           defaultDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //           todayDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //           outsideDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //           weekendDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //           holidayDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //           // Cover any other special days
                  //           disabledDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //           markerDecoration: const BoxDecoration(
                  //             shape: BoxShape.rectangle,
                  //           ),
                  //         //   todayTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //         //       color: AppColors.textColor
                  //         //   ),
                  //         //   defaultDecoration: BoxDecoration(
                  //         //     color: Colors.transparent, // Focused day color
                  //         //    // shape: BoxShape.rectangle
                  //         //     shape: BoxShape.circle,
                  //         // ),
                  //         //   todayDecoration: BoxDecoration(
                  //         //     color: Colors.transparent, // Focused day color
                  //         //   //  shape: BoxShape.rectangle
                  //         //     shape: BoxShape.circle,
                  //         //   ),
                  //         //   selectedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //         //     color: AppColors.textColor
                  //         //   ),
                  //         //   selectedDecoration: BoxDecoration(
                  //         //     color: Colors.transparent, /// Focused day color
                  //         //    // borderRadius: BorderRadius.circular(12.r), /// Rounded corners
                  //         //     border: Border.all(
                  //         //       color: AppColors.secondary,
                  //         //       width: 1.5
                  //         //     ),
                  //         //     shape: BoxShape.circle,
                  //         //   ),
                  //         //  todayDecoration:
                  //           // Customizing the focusedDay
                  //           // focusedDecoration: BoxDecoration(
                  //           //   color: Colors.blue, // Focused day color
                  //           //   borderRadius: BorderRadius.circular(12), // Rounded corners
                  //           //   border: Border.all(
                  //           //     color: Colors.blueAccent, // Border color
                  //           //     width: 2, // Border width
                  //           //   ),
                  //           // ),
                  //         ),
                  //       );
                  //     }
                  //   ),
                  // ),


                  SizedBox(height: 24.h,),
                  SizedBox(
                    width: double.infinity,
                    child: Utils.primaryButton(
                        title: "Save",
                        context: context,
                        onTap: () async {
                         // debugPrint("\nsaving...\n");
                          if(context.read<HomeScreenProvider>().tempPeriodDaysSelection != null && context.read<HomeScreenProvider>().tempPeriodDaysSelection!.isNotEmpty){
                            await context.read<HomeScreenProvider>().saveLogPeriod();
                            Navigator.pop(context);
                          }

                          },
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
