import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../../../constant/images.dart';

class SupportCommunityCard extends StatelessWidget {
  const SupportCommunityCard({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<SettingsProvider>(
      builder: (BuildContext context, settingsProvider, Widget? child) {
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
              Text('Support & Community', style: textTheme.bodyLarge),
              SizedBox(height: 10.h),
              Divider(color: Color(0xff1E1E1E).withOpacity(0.12)),
              _buildDetails(title: 'Contact Support', context: context),
              _buildDetails(title: 'FAQ & Guides', context: context),
              _buildDetails(title: 'Join a Community ', context: context),
            ],
          ),
        );
      },
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
          Icon(Icons.keyboard_arrow_right_sharp),
        ],
      ),
    );
  }
}
