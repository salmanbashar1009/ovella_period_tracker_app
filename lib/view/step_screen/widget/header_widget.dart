import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/step_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../../constant/padding.dart';
import '../../../theme/theme/theme_extensions/color_palette.dart';
import '../../../utility/utils.dart';

class StepScreenHeaderWidget extends StatelessWidget {
  const StepScreenHeaderWidget({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<StepScreenProvider>(
      builder: (BuildContext context, stepScreenProvider, Widget? child) {
        return Column(
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (stepScreenProvider.currentIndex>0) {
                      stepScreenProvider.updatePage(stepScreenProvider.currentIndex-1);
                    } else if (stepScreenProvider.stepOneMode == "age") {
                      stepScreenProvider.stepOneModeSelection('default');
                    } else if (stepScreenProvider.stepOneMode == "language") {
                      stepScreenProvider.stepOneModeSelection('age');
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: AppPadding.iconPadding,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColors.iconColor,
                      size: 20.r,
                    ),
                  ),
                ),
                SizedBox(width: 82.h),
                Text(
                  'Step ${stepScreenProvider.currentIndex + 1} of ${stepScreenProvider.carouselItems.length}',
                  style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
