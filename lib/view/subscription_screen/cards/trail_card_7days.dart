import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/images.dart';
import '../../../constant/padding.dart';
class TrailCard7Days extends StatelessWidget {
  const TrailCard7Days({
    super.key,
    required this.colorScheme,
    required this.textTheme,
  });

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.screenPadding,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enjoy a 7-day Free Trial",
            style: textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          ListTile(
            leading: Image.asset(
              AppImages.onBoardingPointCheck,
            ),
            title: Text(
              "Cancel anytime before your trial ends, and you won't be charged.",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              AppImages.onBoardingPointCheck,
            ),
            title: Text(
              "Your free trial will automatically convert to a subscription after 7 days unless canceled.",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}