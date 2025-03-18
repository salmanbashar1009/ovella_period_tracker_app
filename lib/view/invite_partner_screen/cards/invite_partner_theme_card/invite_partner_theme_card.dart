import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/padding.dart';
class InvitePartnerScreenThemeCard extends StatelessWidget {
  const InvitePartnerScreenThemeCard({super.key, required this.image, required this.title, required this.subtitle});
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: AppPadding.screenPadding,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 186.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
