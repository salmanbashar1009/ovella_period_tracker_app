import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utility/utils.dart';
import 'create_account_footer_widget.dart';

class CreateAccountPasswordForm extends StatelessWidget {
  const CreateAccountPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final formkey = GlobalKey<FormState>();
    return Consumer<CreateAccountProvider>(
      builder: (BuildContext context, createAccountProvider, Widget? child) {
        return Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  "Phone Number",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  /*validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your Full Name";
                    } else {
                      return null;
                    }
                  },*/
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    errorStyle: textTheme.bodySmall!.copyWith(
                      color: colorScheme.onError,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Password",
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
                  obscureText: createAccountProvider.isObscurePassword,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () => createAccountProvider.updateObscure(),
                      child: Icon(
                        createAccountProvider.isObscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                      ),
                    ),
                    hintText: 'Password',
                    errorStyle: textTheme.bodySmall!.copyWith(
                      color: colorScheme.onError,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Checkbox(
                      value: createAccountProvider.acceptTermsConditions,
                      onChanged: createAccountProvider.updateAcceptTeamCondition,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By signing up, you agree to our ',
                              style: TextStyle(
                                fontSize: 13.h,
                                color: colorScheme.primary,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms ',
                              style: TextStyle(
                                fontSize: 13.h,
                                color: colorScheme.secondary,
                              ),
                            ),
                            TextSpan(
                              text: '& ',
                              style: TextStyle(
                                fontSize: 13.h,
                                color: colorScheme.primary,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                fontSize: 13.h,
                                color: colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: Utils.primaryButton(
                    title: 'Create Account',
                    context: context,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                    onTap: () {
                      if(formkey.currentState!.validate()){
                        createAccountProvider.changeIsExpand(false);
                        Navigator.pushNamed(context, RouteName.loginScreen);
                      }else{
                        createAccountProvider.changeIsExpand(true);
                      }
                    },
                  ),
                ),
                CreateAccountFooterWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
