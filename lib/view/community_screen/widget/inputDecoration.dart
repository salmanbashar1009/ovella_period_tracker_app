import 'package:flutter/material.dart';

InputDecoration inputDecoration(
    BuildContext context,  Widget? suffixIcon,
    [String? text]
    ) {
  return InputDecoration(
    
    filled: true,
    fillColor:Color(0xffffffff),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xFF9BA2A7))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 251, 18, 220)
          )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xFF9BA2A7))),
    suffixIcon: suffixIcon,
    hintText:text ?? "",
    hintStyle: TextStyle(color: Color(0xff676364))
  );
}