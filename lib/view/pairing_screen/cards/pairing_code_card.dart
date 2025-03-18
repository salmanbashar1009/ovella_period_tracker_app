import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class PairingCodeCard extends StatelessWidget {
  const PairingCodeCard({super.key});

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
          Container(
            height: 71.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffF4F6F6),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: Text(
                generateCode(),
                style: textTheme.headlineLarge!.copyWith(fontSize: 25.sp),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Invitation Sent',
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String generateCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    String generateSegment(int length) {
      return List.generate(
        length,
        (index) => chars[random.nextInt(chars.length)],
      ).join();
    }

    return '${generateSegment(4)}-${generateSegment(4)}';
  }
}
