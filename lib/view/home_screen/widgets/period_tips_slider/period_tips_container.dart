import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';

class PeriodTipsContainer extends StatelessWidget{
  final String title;
  final String bodyText;
  final String assetImagePath;
  const PeriodTipsContainer({super.key, required this.title, required this.bodyText, required this.assetImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      margin: AppPadding.screenHorizontalPadding,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.w,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),

            decoration: BoxDecoration(
              color: Color(0xffFFDEE6),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.asset(assetImagePath,
            width: 40.w,
              height: 43.h,
              fit: BoxFit.cover,
            )
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                   maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      bodyText,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}