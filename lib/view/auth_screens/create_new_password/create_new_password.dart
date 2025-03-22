import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_new_password/widgets/new_password_form.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/login_screen/widget/login_footer_widget.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/login_screen/widget/login_form.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../../utility/utils.dart';
import '../../common_health_concerns_screen/widgets/common_heath_concern_header_widget.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Consumer<CreateAccountProvider>(
            builder: (
              BuildContext context,
              createAccountProvider,
              Widget? child,
            ) {
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
                        "Create a New Password",
                        style: textTheme.headlineLarge,
                      ),
                      Text(
                        "Set a strong password to keep your account secure and protected.",
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.h,
                        ),
                      ),
                      NewPasswordForm(),
                      SizedBox(height: 16.h,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(230.r),
                          border: Border.all(
                            color: Color(0xff1E1E1E).withOpacity(0.12),
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Utils.primaryButton(
                            title: 'Back to Log in',
                            context: context,
                            color: Colors.transparent,
                            textColor: colorScheme.primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 18.h,
                            ),
                            onTap: () {},
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
