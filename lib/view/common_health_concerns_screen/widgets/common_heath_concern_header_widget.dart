import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/images.dart';
import '../../../utility/utils.dart';
class CommonHeathScreenConcernHeaderWidget extends StatelessWidget {
  const CommonHeathScreenConcernHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Utils.backButton(context),
            SizedBox(width: 82.h),
            Image.asset(AppImages.commonHeathConcernAppBarLogo)
          ],
        ),
      ],
    );
  }
}