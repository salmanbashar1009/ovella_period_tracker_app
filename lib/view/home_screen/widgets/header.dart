import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      title: Column(
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

      actions: [
        GestureDetector(
          onTap:
              () => Navigator.pushNamed(context, RouteName.notificationScreen),
          child: Utils.circleContainer(imagePath: AppImages.notificationIcon),
        ),
      ],
    );
  }
}
