import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class StepCard extends StatelessWidget {
  const StepCard({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How to invite your partner', style: textTheme.bodyLarge),
          Text(
            '3 simple steps to start sharing.',
            style: textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: Color(0xff676364),
            ),
          ),
          SizedBox(height: 10.h),

          _buildDetails(
            title: 'Send invite link with code',
            context: context,
            slNo: '1', subtitle: 'Invite your partner to the Ovella app using the link and generated code.',
          ),
          _buildDetails(
            title: 'Link your accounts',
            context: context,
            slNo: '2', subtitle: 'Your partner will download the Ovella app and enter the code to link your accounts.',
          ),
          _buildDetails(
            title: "You're all set! Now you're sharing ",
            context: context,
            slNo: '3', subtitle: 'Discover all the amazing things on your journey together.',
          ),
        ],
      ),
    );
  }

  Widget _buildDetails({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String slNo,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffFFEEF2),
            child: Text(
              slNo,
              style: textTheme.headlineMedium!.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 266.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  subtitle,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff676364),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
