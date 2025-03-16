import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/reset_password/widgets/reset_password_form.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../common_health_concerns_screen/widgets/common_heath_concern_header_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Consumer<CreateAccountProvider>(
            builder:
                (BuildContext context, createAccountProvider, Widget? child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: AppPadding.screenPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonHeathScreenConcernHeaderWidget(),
                      SizedBox(height: 24.h),
                      Text(
                        "Reset Your Password",
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "No worries! Enter your email or phone, and we’ll send you a reset link.",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.h,
                        ),
                      ),
                      ResetPasswordForm(),
                      SizedBox(height: 24.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Remembered your password? ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff676364),
                                ),
                              ),
                              TextSpan(
                                text: 'Login Here',
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
