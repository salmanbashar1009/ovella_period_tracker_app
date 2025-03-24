import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/menstrual_fertility_screen_provider.dart';
import 'package:provider/provider.dart';

void showFertileAlertDialogSheet(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<MenstrualFertilityScreenProvider>(
          builder: (context,menstrualFertilityScreenProvider,child) {

            /// date format

          final  fertileDateStart = DateFormat('dd MMMM').format(menstrualFertilityScreenProvider.getFertileDates().first);
           final fertileDateEnd = DateFormat('dd MMMM').format(menstrualFertilityScreenProvider.getFertileDates().last);

            final screenHeight = MediaQuery.of(context).size.height * 0.05 ;
            final screenWidth = MediaQuery.of(context).size.width * 0.8;


            return AlertDialog(
              title: Center(
                child: Text( "Fertile Date",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textColor
                  ),),
              ),
              content: SizedBox(
                width: screenWidth ,
                height: screenHeight,
                child: Center(
                  child: Text("$fertileDateStart - $fertileDateEnd"   , style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color:const Color(0xFFF4D1FF),
                    fontSize: 24.sp,
                  ), ),
                ),
              ),
            );
          }
      );
    },
  );
}