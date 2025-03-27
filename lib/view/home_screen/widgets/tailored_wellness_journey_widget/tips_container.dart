import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/images.dart';
import '../../../../theme/theme/theme_extensions/color_palette.dart';

class TipsContainer extends StatelessWidget{
  final String imagePath;
  final String title;
  final String bodyText;
  final int reactAmount;
  final int index;
  final double width;
  final double listLength;
  final bool isFromSeeAllList;

  const TipsContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.bodyText,
    required this.reactAmount,
    required this.index,
    required this.listLength,
    required this.isFromSeeAllList,
    this.width = 271
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 8.h,bottom: 8.h),
      margin: EdgeInsets.only(left: 20.w, right: !isFromSeeAllList ?  index  == listLength-1 ? 20.w : 0 : 12.w,
      bottom: isFromSeeAllList ? 20.h : 0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 12.h,
        children: [

          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child:Image.asset(
                  imagePath
              )
            ),
          ),

          Text(title,
            style: Theme.of(context).textTheme.headlineSmall,),

          Text(bodyText,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 6.w,
            children: [
              Image.asset(
                AppImages.loveIcon,
                width: 16,
                height: 16,
                fit: BoxFit.cover
                ,),
              Text(reactAmount.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightTextColor
                ),),
              Spacer()
            ],
          ),

        ],
      ),
    );
  }
}