import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Joinbutton extends StatelessWidget {
  final String name;
  const Joinbutton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          child: Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
    );
  }
}
