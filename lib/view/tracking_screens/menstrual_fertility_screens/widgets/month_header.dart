import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/widgets/year_month_picker_dialog_sheet.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

class MonthHeader extends StatelessWidget {
  const MonthHeader({Key? key}) : super(key: key);

  void _showYearMonthPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const YearMonthPickerDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackingScreenProvider>(
      builder: (context, trackingScreenProvider, _) {
        final monthYear = DateFormat('MMMM,yyyy').format(trackingScreenProvider.selectedMonthYear);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${DateTime.now().day} $monthYear",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor
                  ),
                ),
                const SizedBox(width: 8),
                // const Icon(Icons.keyboard_arrow_down),
              ],
            ),
            IconButton(
              icon:  Icon(Icons.keyboard_arrow_down_rounded,size: 28.r,color: AppColors.textColor,),
              onPressed: () {
                _showYearMonthPicker(context);
              },
            ),
          ],
        );
      },
    );
  }
}