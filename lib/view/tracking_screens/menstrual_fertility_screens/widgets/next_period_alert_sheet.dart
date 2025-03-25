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
                          Text( "Next Period Date",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.lightTextColor
                            ),),
                          SizedBox(height: 10.h,),
                          Center(
                            child: Text(nextPeriodDate, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppColors.nextPeriodColor,

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