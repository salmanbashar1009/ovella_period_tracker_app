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


            return LayoutBuilder(
                builder: (context,constraints) {

                  double dialogHeight = MediaQuery.of(context).size.height * 0.22; // 30% height

                  return AlertDialog(
                    content: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: dialogHeight,
                        minHeight: dialogHeight * 0.2, // Minimum height fallback
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( "Fertile Date",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.lightTextColor
                            ),),
                          SizedBox(height: 10.h,),
                          Center(
                            child: Text(fertileDateStart + " - " + fertileDateEnd, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.purpleAccent.shade200,
                            ), ),
                          ),
                        ],
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