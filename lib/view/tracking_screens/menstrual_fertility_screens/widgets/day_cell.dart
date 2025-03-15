import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayCell extends StatelessWidget {
  final int day;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const DayCell({
    Key? key,
    required this.day,
    this.backgroundColor, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: backgroundColor == const Color(0xFFFF5B79) && day == 3
                ? Border.all(color: Colors.black, width: 1)
                : null,
          ),
          child: Center(
            child: Text(
              day.toString(),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// color: backgroundColor == const Color(0xFFFF5B79) ? Colors.white : Colors.black,
