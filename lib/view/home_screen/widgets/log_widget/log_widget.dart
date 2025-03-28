import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/theme/theme/theme_extensions/color_palette.dart';

class LogWidget extends StatelessWidget{

  final String text;
  final GestureTapCallback onAdd;
  final String imageIconPath;

   const LogWidget({super.key, required this.text, required this.onAdd, required this.imageIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
            colors: [Color(0xffFFDDE5), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
              style: Theme.of(context).textTheme.bodyLarge,),

              Image.asset(imageIconPath,
              width: 35.w,
                height: 35.w,
                fit: BoxFit.cover,
              )
            ],
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ),
          )

        ],
      ),
    );
  }
}