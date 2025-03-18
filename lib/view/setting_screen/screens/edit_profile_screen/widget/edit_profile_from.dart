import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utility/utils.dart';
class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your Full Name";
            } else {
              return null;
            }
          },
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Name',
            errorStyle: textTheme.bodySmall!.copyWith(
              color: colorScheme.onError,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Email",
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.h,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your email";
            } else {
              return null;
            }
          },
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Email',
            errorStyle: textTheme.bodySmall!.copyWith(
              color: colorScheme.onError,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          child: Utils.primaryButton(
            title: 'Save',
            context: context,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
            onTap: () {

            },
          ),
        ),
      ],
    );
  }
}