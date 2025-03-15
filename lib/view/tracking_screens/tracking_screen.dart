import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/menstrual_fertitily_screen.dart';
import 'package:ovella_period_tracker_app/view_model/tracking_screen_provider.dart';

import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        backgroundImage: "assets/images/community/screen_background.png",
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColors.onSecondary,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        _buildSegmentItem(context, 0, "Menstrual & Fertility"),
                        _buildSegmentItem(context, 1, "Pregnancy"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: Consumer<TrackingScreenProvider>(
                    builder: (context, trackingScreenProvider, child) {
                      // Display different content based on selected tab
                      return MenstrualFertilityScreen();
                    },
                    // Add more content for the selected tab here
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentItem(BuildContext context, int index, String title) {
    bool isSelected =
        context.watch<TrackingScreenProvider>().selectedIndex == index;

    return Expanded(
      child: Consumer<TrackingScreenProvider>(
        builder: (context, trackingScreenProvider, child) {
          return GestureDetector(
            onTap: () {
              trackingScreenProvider.setSelectedIndex(index);
            },
            child: Container(
              width: 200.w,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99.r),
                color: isSelected ? Colors.black : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
