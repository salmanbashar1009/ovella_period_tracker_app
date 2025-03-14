import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPoints extends StatelessWidget {
  final String pointTitle;
  const OnBoardingPoints({super.key, required this.pointTitle});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Image.asset('assets/images/on_boarding_screen/point_check.png',height: 24.h,width: 24.w,),
          SizedBox(width: 12,),
          Text(pointTitle,style: textTheme.bodyMedium,)
        ],
      ),
    );
  }
}
