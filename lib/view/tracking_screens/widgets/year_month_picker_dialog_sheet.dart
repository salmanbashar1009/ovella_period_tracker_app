import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/widgets/month_picker.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/widgets/year_picker.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

class YearMonthPickerDialog extends StatelessWidget {
  const YearMonthPickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trackingScreenProvider = Provider.of<TrackingScreenProvider>(context);

    return AlertDialog(
      title: Center(child:  Text('Select Year and Month',style: Theme.of(context).textTheme.bodyLarge,)),
      content: SizedBox(
        width: double.maxFinite,
        height: 250.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Year picker
            SizedBox(
              width: 120.w,
              child: EditYearPicker(),
            ),

            // Month picker
            SizedBox(
              width: 120.w,
              child: EditMonthPicker(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            trackingScreenProvider.setMonthYear();
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}