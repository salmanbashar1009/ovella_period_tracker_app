import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQCard extends StatelessWidget {
  const FAQCard({super.key});
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
          Text('FAQ', style: textTheme.bodyLarge),
          SizedBox(height: 10.h),
          Divider(color: Color(0xff1E1E1E).withOpacity(0.12)),

          _buildDetails(title: 'Is My Data Secure', context: context),
          _buildDetails(title: 'Can I Stop Sharing?', context: context),
          _buildDetails(title: 'Does My Partner Need the App?', context: context),
        ],
      ),
    );
  }

  Widget _buildDetails({required BuildContext context, required String title}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.bodyMedium),
          Icon(Icons.keyboard_arrow_down_outlined),
        ],
      ),
    );
  }
}
