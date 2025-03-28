import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, this.textButton = '', this.onTap,
  });

  final String title;
  final String textButton;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 24.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 17.sp
            ),),
            GestureDetector(
              onTap: (){onTap;},
              child: Text(textButton,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                // fontSize: 13,
                color: AppColors.textColor,
                // decoration: TextDecoration.underline
              ),)
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
