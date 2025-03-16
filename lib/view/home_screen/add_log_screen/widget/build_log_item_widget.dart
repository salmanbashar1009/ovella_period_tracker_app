import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:provider/provider.dart';

class BuildLogItem extends StatelessWidget{
  final Map<String, dynamic> symptom;
  final void Function(Map<String, dynamic>) onSelect;

  const BuildLogItem({super.key, required this.symptom, required this.onSelect});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (_, homeScreenProvider, child) {
        return GestureDetector(
          onTap: (){
            homeScreenProvider.onSelectLog(symptom);
          } ,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),

            decoration: BoxDecoration(
              color: symptom["selected"] ? Color(0xffFFEEF2) : Colors.white,
              borderRadius: BorderRadius.circular(33.r),
              border: Border.all(
                color: symptom["selected"] ? AppColors.secondary :  Color(0xff1E1E1E).withOpacity(0.12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4.w,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: symptom["selected"] ?  Colors.white : Color(0xffFFEEF2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(symptom["icon"], color: Colors.pinkAccent, size: 18)
                ),
                Text(symptom["text"], style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        );
      }
    );
  }
}