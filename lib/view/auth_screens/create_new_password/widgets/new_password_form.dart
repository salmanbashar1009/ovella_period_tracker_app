import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utility/utils.dart';
import '../../../../view_model/new_password_provider.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<NewPasswordProvider>(
      builder: (BuildContext context, newPasswordProvider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "New Password",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              /*validator: (value) {
                if (value!.isEmpty) {
                  return "please set your password";
                } else {
                  return null;
                }
              },*/
              obscureText: newPasswordProvider.isObscurePassword,
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => newPasswordProvider.updateObscure(),
                  child: Icon(
                    newPasswordProvider.isObscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
                hintText: 'New Password',
                errorStyle: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onError,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Confirm Password",
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              /*validator: (value) {
                if (value!.isEmpty) {
                  return "please confirm your password";
                } else {
                  return null;
                }
              },*/
              obscureText: newPasswordProvider.isObscureRePassword,
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => newPasswordProvider.updateObscureRePassword(),
                  child: Icon(
                    newPasswordProvider.isObscureRePassword
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
                hintText: 'Confirm Password',
                errorStyle: textTheme.bodySmall!.copyWith(
                  color: colorScheme.onError,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: Utils.primaryButton(
                title: 'Reset Password',
                context: context,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                onTap: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
