import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/otp_screen/widgets/otp_form.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/reset_password/widgets/reset_password_form.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../common_health_concerns_screen/widgets/common_heath_concern_header_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                        "Verify Your Account",
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "A 6-digit OTP has been sent to your email. Enter the code below to proceed.",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.h,
                        ),
                      ),
                      OtpForm(),
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
