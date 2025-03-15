import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/calender_grid.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/log_symtoms_card.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/month_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/week_day_header.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class MenstrualFertilityScreen extends StatelessWidget {
  const MenstrualFertilityScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(

           padding: EdgeInsets.all(16.r),

           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(24.r),
             color: AppColors.onPrimary,
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const MonthHeader(),
               const SizedBox(height: 20),
               const WeekdayHeader(),
               const SizedBox(height: 10),
               SizedBox(
                 height: 290.h,
                 width: double.infinity,
                 child: Consumer<TrackingScreenProvider>(
                   builder: (context, provider, _) {
                     return CalendarGrid(
                       year: provider.selectedMonth.year,
                       month: provider.selectedMonth.month,
                     );
                   },
                 ),
               ),
             ],
           ),
         ),

          SizedBox(height: 24.h),
          Row(
            children: [
              activityTile(context: context,bgColor: AppColors.secondary, imagePath: "assets/icons/period.png", title: "Period", onTap:(){} ),
              SizedBox(width: 12.w,),
              activityTile(context: context,bgColor: Color(0xFFF4D1FF), imagePath: "assets/icons/fertile.png", title: "Fertile", onTap:(){} ),
            ],
          ),
          SizedBox(height: 16.w,),
          Row(
            children: [
              activityTile(context: context,bgColor: Color(0xFF25C871), imagePath: "assets/icons/ovulation.png", title: "Ovulation", onTap:(){} ),
              SizedBox(width: 12.w,),
              activityTile(context: context,bgColor: Color(0xFFFF9CB6), imagePath: "assets/icons/period.png", title: "Next Period", onTap:(){} ),
            ],
          ),
          SizedBox(height: 24.h,),
          LogSymptomsCard(
            onAddPressed: () {

            },
          ),
        ],
      ),
    );
  }

  Widget activityTile(
      {required BuildContext context,required Color bgColor , required String imagePath,required String title,required VoidCallback onTap,}) {
    return Container(
      padding: EdgeInsets.only(left:12.r,bottom: 12.r,top: 12.r),
      width: 175.w,
      height: 70.h,
      decoration:BoxDecoration (
      color: bgColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: ListTile(
        horizontalTitleGap: 6.w,
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(10.r),
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.onPrimary,
            shape: BoxShape.circle,
          ),
          child: Image(image: AssetImage(imagePath)),
        ),
        title: Text(title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.w400
        ),) ,
      ),
    );
  }
}
