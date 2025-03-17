import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utility/utils.dart';

class CreateAccountEmailForm extends StatelessWidget {
  const CreateAccountEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<CreateAccountProvider>(
      builder: (
        BuildContext context,
        CreateAccountProvider createAccountProvider,
        Widget? child,
      ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
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
                title: 'Next',
                context: context,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                onTap: () {
                  createAccountProvider.updatePage(1);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
