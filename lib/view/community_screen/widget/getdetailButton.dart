import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Getdetailbutton extends StatelessWidget {
  void Function()? onTap;

  Getdetailbutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(130.r),
          color: Color(0xFF1E1E1E),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: 12.h,
            top: 12.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Details",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Color(0xFFFFFFFF)),
              ),
              Image.asset(
                "assets/images/icons/arro.png",
                height: 16.h,
                width: 16.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
