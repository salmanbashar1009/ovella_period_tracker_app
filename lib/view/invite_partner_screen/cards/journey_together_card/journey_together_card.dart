import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../../../constant/images.dart';
import '../../../../utility/utils.dart';
class JourneyTogetherCard extends StatelessWidget {
  const JourneyTogetherCard({super.key});

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
        children: [
          Image.asset(AppImages.coupleImage),
          SizedBox(height: 12.h),
          Text(
            'Journey Together',
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text('Keep your partner connected throughout your pregnancy journey.', style: textTheme.bodySmall,textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}