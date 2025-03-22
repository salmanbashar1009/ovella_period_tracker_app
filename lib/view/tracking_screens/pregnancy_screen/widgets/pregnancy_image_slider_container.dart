import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/widgets/image_slider.dart';

class PregnancyImageSliderContainer extends StatelessWidget {
  const PregnancyImageSliderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.w,
      // height: 40.h,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "Conception Date",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(
                      color: AppColors.lightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "March 3, 2025",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Due Date",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(
                      color: AppColors.lightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "December 3, 2025",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          ImageSlider(),
          SizedBox(height: 24.h),
          SliderDetailsButton(),
        ],
      ),
    );
  }
}
