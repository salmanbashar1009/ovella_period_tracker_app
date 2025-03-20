import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration inputDecoration(
  BuildContext context, [
  String? text,
  Widget? suffixIcon,
  Widget? preffix,
  double? val,
]) {
  return InputDecoration(
    filled: true,
    fillColor: Color(0xffffffff),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(val ?? 16),
      borderSide: BorderSide(color: Color(0xFF9BA2A7)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(val ?? 16),
      borderSide: BorderSide(
        // color: Color(0xFF9BA2A7)
        color: Color.fromARGB(255, 251, 18, 220),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(val ?? 16),
      borderSide: BorderSide(color: Color(0xFF9BA2A7)),
    ),
    prefixIcon: preffix,
    suffixIcon: suffixIcon,
    hintText: text ?? "",
    hintStyle: TextStyle(color: Color(0xff676364), fontSize: 14.sp),
  );
}
