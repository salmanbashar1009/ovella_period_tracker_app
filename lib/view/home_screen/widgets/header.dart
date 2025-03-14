import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Jane Doe",
            style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text("Good Morning",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.lightTextColor,
              fontWeight: FontWeight.w400,
            ),
            )
          ],
        ),

        Utils.circleContainer(icon : Icon(Icons.notifications_outlined),),
      ],
    );
  }
}