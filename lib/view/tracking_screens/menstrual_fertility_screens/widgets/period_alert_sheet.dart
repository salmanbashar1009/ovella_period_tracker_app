import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/menstrual_fertility_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

void showPeriodAlertDialogSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<TrackingScreenProvider>(
        builder: (context,trackingScreenProvider,child) {

          String periodStartDate = "";
          String periodEndDate = "";
          String periodMonth = "";

          if (trackingScreenProvider.periodDates.isNotEmpty) {
            periodStartDate = DateFormat('dd').format(trackingScreenProvider.periodDates.first);
            periodEndDate = DateFormat('dd').format(trackingScreenProvider.periodDates.last);
            periodMonth = DateFormat('MMMM').format(trackingScreenProvider.periodDates.last);
          }

          final screenHeight = MediaQuery.of(context).size.height;
          final screenWidth = MediaQuery.of(context).size.width;


          return LayoutBuilder(
            builder: (context,constraints) {

              double dialogHeight = MediaQuery.of(context).size.height * 0.22; // 30% height


              return AlertDialog(

                title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Period Date:",style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 10.h,),
                    Text( periodStartDate.isNotEmpty ? "$periodStartDate - $periodEndDate , $periodMonth" : "Not Selected",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.secondary
                      ),),
                  ],
                ),
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: dialogHeight,
                    minHeight: dialogHeight * 0.2, // Minimum height fallback
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                            child:  Text('Edit Period',style: Theme.of(context).textTheme.bodyMedium,),
                          ),
                          Consumer2<TrackingScreenProvider, MenstrualFertilityScreenProvider>(
                            builder: (context,trackingScreenProvider,menstrualFertilityScreenProvider,child) {
                              return TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                    
                                  trackingScreenProvider.removePeriodDates();
                                  menstrualFertilityScreenProvider.getOvulationDate();
                    
                                },
                                child:  Text('Remove Period',style: Theme.of(context).textTheme.bodyMedium,),
                              );
                            }
                          ),
                        ]
                    ),
                  ),
                ),
              );
            }
          );
        }
      );
    },
  );
}