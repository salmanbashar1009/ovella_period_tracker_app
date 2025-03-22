import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/model/eventModel.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/event_screen/eventDetails_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/getdetailButton.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 271.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(event.imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              event.title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/icons/cal.png",
                  height: 16.h,
                  width: 16.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  event.date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.lightTextColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Image.asset(
                  "assets/images/icons/location.png",
                  height: 16.h,
                  width: 16.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  event.location,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.lightTextColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Getdetailbutton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventdetailsScreen(event: event),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
