import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeriodTipsContainer extends StatelessWidget{
  const PeriodTipsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 14.h,
      ),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Colors.grey.withOpacity(0.08),
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.w,
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
            child: Icon(
              Icons.ac_unit_outlined,
              color: Color(0xffB4193B),
              size: 40.r,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Fibroids mainly affect women.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                  // maxLines: 3,
                ),

                Expanded(
                  child: Text(
                    "Fibroids can disrupt cycles, cause heavy bleeding, and impact fertility.",
                    style: Theme.of(context).textTheme.bodySmall,
                    //  maxLines: 3,
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