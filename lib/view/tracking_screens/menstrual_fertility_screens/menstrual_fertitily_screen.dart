import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/home_screen/add_log_screen/widget/build_log_item_widget.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/calender_grid.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/log_symtoms_card.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/month_header.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/period_alert_sheet.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/widgets/week_day_header.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart' show HomeScreenProvider;
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';
import 'package:ovella_period_tracker_app/widgets/custom_calendar.dart';
import 'package:provider/provider.dart';


class MenstrualFertilityScreen extends StatelessWidget {
  const MenstrualFertilityScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final trackingScreenProvider = Provider.of<TrackingScreenProvider>(context,listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       CustomCalendar(onTap: (numb)=>  trackingScreenProvider.toggleBorder(numb),),

        SizedBox(height: 24.h),

        ...List.generate(trackingScreenProvider.notes.length, (index){
          return GestureDetector(
            onLongPress: (){
              trackingScreenProvider.removeNotes(index);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              margin: EdgeInsets.only(bottom:  12.h),
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Note",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 17.sp),
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,color: AppColors.textColor,),
                          SizedBox(width: 6.w,),
                          Text("3 Mar,25", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 13.sp
                          ),)

                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.edit_calendar_outlined,color: AppColors.textColor,),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(trackingScreenProvider.notes[index],
                          maxLines: null,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.lightTextColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),

        SizedBox(height: 8.h),
        Row(
          children: [
            activityTile(context: context,bgColor: AppColors.secondary, imagePath: "assets/icons/period.png", title: "Period", onTap:(){showPeriodAlertSheet(context);} ),
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
        LogCard(
          onAddPressed: () {
            final homeScreenProvider =
            context.read<HomeScreenProvider>();
            homeScreenProvider.onLog(
              logTo: homeScreenProvider.symptomsLog,
            );
            Navigator.pushNamed(context, RouteName.addLogScreen);
          },
          title: 'Log your Symptoms',
        ),
        Consumer<HomeScreenProvider>(
          builder: (_, homeScreenProvider, _) {
            return homeScreenProvider.selectedSymptoms.isNotEmpty
                ? Column(
              spacing: 12.h,
              children: [
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Symptoms",
                      style:
                      Theme.of(context).textTheme.headlineSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint(
                          "\nSymptoms Edit button pressed\n",
                        );
                      },
                      child: Image.asset(
                        AppImages.editIcon,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children:
                    homeScreenProvider.selectedSymptoms
                        .map(
                          (symptom) => BuildLogItem(
                        logItem: symptom,
                        onSelect:
                        homeScreenProvider.onSelectLog,
                      ),
                    )
                        .toList(),
                  ),
                ),
              ],
            )
                : SizedBox();
          },
        ),
      ],
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


