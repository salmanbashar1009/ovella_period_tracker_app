import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/calender_grid.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/month_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/week_day_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/widgets/screen_header.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_screen_provider.dart';

class EditCalenderScreen extends StatelessWidget {
  const EditCalenderScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Consumer<TrackingScreenProvider>(
              builder: (context, trackingScreenProvider, child) {
                final monthYear = DateFormat(
                  'MMMM,yyyy',
                ).format(trackingScreenProvider.selectedMonthYear);

                return Column(
                  children: [
                    ScreenHeader(title: monthYear,onTap: (){
                      trackingScreenProvider.clearSelectedDays();
                      Navigator.pop(context);

                    },),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: const WeekdayHeader(),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.all(16.r),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: AppColors.onPrimary,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const MonthHeader(),
                          SizedBox(height: 20.h),

                          SizedBox(
                            height: 290.h,
                            width: double.infinity,
                            child: CalendarGrid(
                              borderColor: AppColors.textColor.withOpacity(0.12),
                              year: trackingScreenProvider.selectedMonthYear.year,
                              month:
                                  trackingScreenProvider
                                      .selectedMonthYear
                                      .month,
                              onTap:
                                  (numb) => trackingScreenProvider
                                      .toggleBorder(numb),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: Utils.primaryButton(
                        title: "Save",
                        context: context,
                        onTap: () async {
                          // if(context.read<HomeScreenProvider>().tempPeriodDaysSelection != null && context.read<HomeScreenProvider>().tempPeriodDaysSelection!.isNotEmpty){
                          //   await context.read<HomeScreenProvider>().saveLogPeriod();
                          //   Navigator.pop(context);
                          // }
                         trackingScreenProvider.saveSelectedDays(trackingScreenProvider.periodDates);
                         Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
