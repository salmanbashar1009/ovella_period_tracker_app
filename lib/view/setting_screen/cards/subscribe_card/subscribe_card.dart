import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../../../constant/images.dart';
import '../../../../constant/padding.dart';
import '../../../../utility/utils.dart';

class SubscribeCard extends StatelessWidget {
  const SubscribeCard({super.key});

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
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.r),
            ),
            child: Image.asset(AppImages.premiumBadge),
          ),
          SizedBox(height: 8.h),
          Text(
            'Unlock Premium Features',
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: Utils.primaryButton(
              title: 'Subscribe Now',
              context: context,
              padding: EdgeInsets.all(18.w),
              onTap: () {
                Navigator.pushNamed(context, RouteName.subscriptionScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
