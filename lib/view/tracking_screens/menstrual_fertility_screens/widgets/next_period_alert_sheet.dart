import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/menstrual_fertility_screen_provider.dart';
import 'package:provider/provider.dart';

void showNextPeiodAlertDialogSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<MenstrualFertilityScreenProvider>(
          builder: (context,menstrualFertilityScreenProvider,child) {

            /// date format

            final nextPeriodDate = DateFormat('dd MMMM').format(menstrualFertilityScreenProvider.getNextPeriodDate());

            final screenHeight = MediaQuery.of(context).size.height * 0.05 ;
            final screenWidth = MediaQuery.of(context).size.width * 0.8;


            return AlertDialog(
              title: Center(
                child: Text( "Next Period Date",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor
                  ),),
              ),
              content: SizedBox(
                width: screenWidth ,
                height: screenHeight,
                child: Center(
                  child: Text(nextPeriodDate, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFFFF9CB6),
                    fontSize: 30.sp,
                  ), ),
                ),
              ),
            );
          }
      );
    },
  );
}