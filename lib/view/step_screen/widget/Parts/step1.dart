import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Let's Get to Know You", style: textTheme.headlineLarge),
        Text(
          "Share more about yourself to help us tailor your experience",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        Text("Full Name"),
        TextFormField(decoration: InputDecoration(
          hintText: 'Name',

        ),),
        Container(
          height: 54.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff1E1E1E).withOpacity(0.12))
          ),
        )
      ],
    );
  }
}
