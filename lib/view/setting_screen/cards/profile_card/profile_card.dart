import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';

import '../../../../constant/padding.dart';
import '../../../../utility/utils.dart';
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: AppPadding.screenPadding,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.r),
              image: DecorationImage(
                image: AssetImage(AppImages.pinkAvator),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Jane Doe',
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text('janedoe@email.com', style: textTheme.bodySmall),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: Utils.primaryButton(
              title: 'Edit Profile',
              context: context,
              color: colorScheme.onPrimary,
              textColor: colorScheme.primary,
              textStyle: textTheme.bodyMedium,
              borderColor: Color(0xff1E1E1E).withOpacity(0.12),
              onTap: () {
                Navigator.pushNamed(context, RouteName.editProfileScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}