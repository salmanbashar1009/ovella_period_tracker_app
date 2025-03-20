import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

void showFertileAlertDialogSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<TrackingScreenProvider>(
          builder: (context,trackingScreenProvider,child) {

            String periodStartDate = "";
            String periodEndDate = "";

            if (trackingScreenProvider.periodDates.isNotEmpty) {
              periodStartDate = DateFormat('dd MMMM').format(trackingScreenProvider.periodDates.first);
              periodEndDate = DateFormat('dd MMMM').format(trackingScreenProvider.periodDates.last);
            }


            return AlertDialog(
              title: Text( periodStartDate.isNotEmpty ? "Fertile Dates: \n$periodStartDate - $periodEndDate" : "Period Dates : Not Selected",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.secondary
                ),),
              content: SizedBox(
                height: 150.h,
                width: 360.w,// Set the desired height
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, RouteName.addNoteScreen);
                          // Close the dialog
                        },
                        child:  Text('Add Note',style: Theme.of(context).textTheme.bodyMedium,),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.pushNamed(context, RouteName.editCalenderScreen);
                        },
                        child:  Text('Edit Fertile',style: Theme.of(context).textTheme.bodyMedium,),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          context.read<TrackingScreenProvider>().removePeriodDates();
                        },
                        child:  Text('Remove Fertile',style: Theme.of(context).textTheme.bodyMedium,),
                      ),
                    ]
                ),
              ),
            );
          }
      );
    },
  );
}