import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/images.dart';
class InvitationSentCard extends StatelessWidget {
  const InvitationSentCard({super.key});

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
          Image.asset(AppImages.pairingImage),
          SizedBox(height: 12.h),
          Text(
            'Invitation Sent',
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(' Wait for your partner to pair, or resend the code if necessary.', style: textTheme.bodySmall,textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}