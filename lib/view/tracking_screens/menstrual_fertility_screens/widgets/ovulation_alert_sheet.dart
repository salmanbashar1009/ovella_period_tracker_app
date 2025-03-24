import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/menstrual_fertility_screen_provider.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';

void showOvulationAlertDialogSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<MenstrualFertilityScreenProvider>(
        builder: (context,menstrualFertilityScreenProvider,child) {

          /// date format

          final ouvlationDate = DateFormat('dd MMMM').format(menstrualFertilityScreenProvider.getOvulationDate());

          final screenHeight = MediaQuery.of(context).size.height * 0.05 ;
          final screenWidth = MediaQuery.of(context).size.width * 0.8;


          return AlertDialog(
            title: Center(
              child: Text( "Ovulation Date",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textColor
              ),),
            ),
            content: SizedBox(
              width: screenWidth ,
              height: screenHeight,
              child: Center(
                child: Text(ouvlationDate, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Color(0xFF25C871),
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