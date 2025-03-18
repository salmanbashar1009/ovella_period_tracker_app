import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';

void showPeriodAlertSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text('Period Ends',style: Theme.of(context).textTheme.bodyMedium,),
        content: SizedBox(
          height: 130.h,
          width: 360.w,// Set the desired height
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                TextButton(
                  onPressed: () {
                    // Handle Button 3 action
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child:  Text('Remove Period',style: Theme.of(context).textTheme.bodyMedium,),
                ),
              ]
          ),
        ),
      );
    },
  );
}