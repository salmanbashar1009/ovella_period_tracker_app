import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

import '../../../constant/padding.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
     // padding: AppPadding.screenHorizontalPadding,
      padding: EdgeInsets.only(right: 20.w,left: 10.w),
      child: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6.w,
          children: [
            ClipOval(
              child: Image.asset(AppImages.pinkAvator,
              width: 40.w,
              height: 40.w,
              fit: BoxFit.cover,),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Jane Doe",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "Good Morning",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.lightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          GestureDetector(
            onTap:
                () => Navigator.pushNamed(context, RouteName.notificationScreen),
            child: Utils.circleContainer(imagePath: AppImages.notificationIcon),
          ),
        ],
      ),
    );
  }
}
