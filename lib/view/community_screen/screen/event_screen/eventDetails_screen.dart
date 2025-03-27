// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart'
    show AppPadding;
import 'package:ovella_period_tracker_app/model/eventModel.dart';
import 'package:ovella_period_tracker_app/model/healthCardModel.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view/community_screen/widget/speakerTile.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';

class EventdetailsScreen extends StatelessWidget {
  final Event event;
  const EventdetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final Healthcardmodel? card;

    return BackgroundWidget(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //---------appbar section ------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Utils.backButton(context),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Events Details",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text("        "),
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color(0xffFFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 2.w,
                      right: 2.w,
                      top: 2.h,
                      bottom: 2.h,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(event.imagePath),
                    ),
                  ),
                ),
                SizedBox(height: 16.r),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    event.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                ),
                SizedBox(height: 8.r),
                Row(
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
                SizedBox(height: 12.h),
                Text(
                  event.discription,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: AppColors.lightTextColor,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 176.w,
                  width: 362.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What You’ll Learn",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            itemCount: event.card.length,

                            itemBuilder: (context, index) {
                              final card = event.card[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/on_boarding_screen/point_check.png",
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Text(
                                        card.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Speakers",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Speakertile(
                      img: "assets/images/person/blackdoc.png",
                      title: "Dr. Emily Carter",
                      subtitle: "Certified Prenatal Nutritionist",
                    ),
                    SizedBox(width: 16.w),
                    Speakertile(
                      img: "assets/images/person/doc.png",
                      title: "Dr. Alex Mitchell",
                      subtitle: " Obstetrician & Gynecologist",
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 362.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(230.r),
                      color: AppColors.primary,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 32.w,
                        right: 32.w,
                        top: 18.h,
                        bottom: 18.h,
                      ),
                      child: Center(
                        child: Text(
                          "Register Now",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
