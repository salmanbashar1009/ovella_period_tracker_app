import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';
import 'package:provider/provider.dart';

class BuildLogItem extends StatelessWidget{
  final bool isEditMode;
  final Map<String, dynamic> logItem;
  final void Function(Map<String, dynamic>) onSelect;

  const BuildLogItem({super.key, required this.logItem, required this.onSelect,required this.isEditMode});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (_, homeScreenProvider, child) {
        return GestureDetector(
          onTap: (){
            homeScreenProvider.onSelectLog(logItem);
          } ,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),

            decoration: BoxDecoration(
              color: logItem["selected"] ? Color(0xffFFEEF2) : Colors.white,
              borderRadius: BorderRadius.circular(33.r),
              border: Border.all(
                color: logItem["selected"] ? AppColors.secondary :  Color(0xff1E1E1E).withOpacity(0.12),
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
                      color: logItem["selected"] ?  Colors.white : Color(0xffFFEEF2),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(logItem["iconPath"],
                    width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    )
                ),
                Text(logItem["text"], style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        );
      }
    );
  }
}