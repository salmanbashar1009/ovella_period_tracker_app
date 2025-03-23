import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utility/utils.dart';

class LoginForm extends StatelessWidget {
   LoginForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return
      // Consumer<CreateAccountProvider>(
      // builder: (BuildContext context, createAccountProvider, Widget? child) {
      //   return
          Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                "Email",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.h,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                /*validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  // Regular expression for validating an email
                  final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

                  if (!emailRegex.hasMatch(value)) {
                    return "Please enter a valid email address";
                  }

                  return null; // Validation passed
                },*/
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
              SizedBox(height: 8.h),
              Text(
                "Password",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.h,
                ),
              ),
              SizedBox(height: 8.h),
              Consumer<CreateAccountProvider>(
                builder: (_,createAccountProvider,_) {
                  return TextFormField(
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
                  );
                }
              ),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, RouteName.resetPasswordScreen),
                  child: Text(
                    'Forgot Password?',
                    style: textTheme.bodyMedium!.copyWith(
                      fontSize: 13.h,
                      color: Color(0xff676364),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: Utils.primaryButton(
                  title: 'Log In',
                  context: context,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      Navigator.pushNamedAndRemoveUntil(context, RouteName.parentScreen, (route) => false,);
                    }
                  },
                ),
              ),
            ],
          ),
        );
    //  },
   // );
  }
}
