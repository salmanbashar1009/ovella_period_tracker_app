import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import '../../../../utility/utils.dart';

class CreateAccountFooterWidget extends StatelessWidget {
  const CreateAccountFooterWidget({super.key});

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
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, RouteName.loginScreen);
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    // Ensure text is visible
                    fontSize: 16,
                    color: Colors.black, // Change color based on theme
                  ),
                ),
                TextSpan(
                  text: 'Login here',
                  style: TextStyle(
                    // Ensure text is visible
                    fontSize: 16,
                    color: colorScheme.secondary, // Change color based on theme
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
