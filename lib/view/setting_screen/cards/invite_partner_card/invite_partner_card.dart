import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../../../constant/images.dart';
import '../../../../utility/utils.dart';
class InvitePartnerCard extends StatelessWidget {
  const InvitePartnerCard({super.key});

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
          Image.asset(AppImages.coupleImage,height: 186.h,width: 142.w,),
          SizedBox(height: 12.h),
          Text(
            'Invite Your Partner To Ovella',
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text('Click here to add your partner', style: textTheme.bodySmall),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.infinity,
            child: Utils.primaryButton(
              title: 'Learn More',
              context: context,
              color: colorScheme.onPrimary,
              textColor: colorScheme.primary,
              textStyle: textTheme.bodyMedium,
              borderColor: Color(0xff1E1E1E).withOpacity(0.12),
              onTap: () {
                Navigator.pushNamed(context, RouteName.invitePartnerScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}