import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/home_screen/see_all_wellness_tips_screen/widgets/header.dart';

import '../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../widgets/background_widget.dart';

class WellnessTipsScreen extends StatelessWidget {
  const WellnessTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WellnessTipsAppBar(),
          Expanded(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemCount: 5,
                physics: ClampingScrollPhysics(),
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 8.w,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18.r),
                          child: Stack(
                            children: [
                              (index + 1) % 2 != 0
                                  ? Image.asset(
                                    AppImages.wellnessWoman,
                                    width: 200.w,
                                    height: 132.h,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    AppImages.wellnessWoman02,
                                    width: 200.w,
                                    height: 132.h,
                                    fit: BoxFit.cover,
                                  ),

                              Positioned(
                                right: 10.w,
                                top: 10.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ), // Adjust for rounded corners
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5.0,
                                      sigmaY: 5.0,
                                    ), // Adjust blur intensity
                                    child: Container(
                                      color: Colors.white.withOpacity(0.2),
                                      padding: EdgeInsets.all(3.r),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        spacing: 2.w,
                                        children: [
                                          Image.asset(
                                            AppImages.loveIcon,
                                            width: 14,
                                            height: 14,
                                            fit: BoxFit.cover,
                                            color: AppColors.onPrimary,
                                          ),
                                          Text(
                                            (103+index*2).toString(),
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium?.copyWith(
                                              color: AppColors.onPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 6.h,
                            children: [
                              Text(
                                "Personalized Wellness Tips",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),

                              Text(
                                "AI-driven diet, workout, and wellness tips tailored for your cycle or maternity.",
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
