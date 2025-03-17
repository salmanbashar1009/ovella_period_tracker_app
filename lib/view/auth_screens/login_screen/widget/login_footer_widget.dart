import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../../../utility/utils.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SizedBox(height: 24.h),

        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: Text('or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 16.h),

        SizedBox(
          width: double.infinity,
          child: Utils.primaryButton(
            title: 'Continue With Google',
            context: context,
            color: colorScheme.onPrimary,
            prefixIcon: Image.asset(
              'assets/images/auth_screens/google icon.png',
            ),
            textColor: colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.h),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, RouteName.stepScreen),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'New to Ovella? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff676364),
                  ),
                ),
                TextSpan(
                  text: 'Create an account',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
