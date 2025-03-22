import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';

import '../../../../constant/images.dart';

class MenstrualHealthDetailsCard extends StatelessWidget {
  const MenstrualHealthDetailsCard({super.key});
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Menstrual & Health Details', style: textTheme.bodyLarge),
              GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, RouteName.menstrualHealthDetails),
                  child: Image.asset(AppImages.editPencil)),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(color: Color(0xff1E1E1E).withOpacity(0.12)),
          _buildDetails(
            textTheme: textTheme,
            title: 'Cycle Length',
            value: '28 Days',
          ),
          _buildDetails(
            textTheme: textTheme,
            title: 'Last Period',
            value: 'Jan 15, 2025',
          ),
          _buildDetails(
            textTheme: textTheme,
            title: 'Pregnancy Status',
            value: 'Not Pregnant',
          ),
          _buildDetails(
            textTheme: textTheme,
            title: 'Health Conditions',
            value: 'PCOS',
          ),
        ],
      ),
    );
  }

  Widget _buildDetails({
    required TextTheme textTheme,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.bodyMedium),
          Text(value, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
