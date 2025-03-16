import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleQuestionWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double height;

  const ToggleQuestionWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
            ),
          ),
          Switch(
            trackColor: WidgetStateProperty.all(
              value ? colorScheme.secondary : Color(0xffE9E9EA),
            ),
            thumbColor: WidgetStateProperty.all(colorScheme.onPrimary),
            value: value,
            onChanged: onChanged, // Calls the passed function
          ),
        ],
      ),
    );
  }
}
