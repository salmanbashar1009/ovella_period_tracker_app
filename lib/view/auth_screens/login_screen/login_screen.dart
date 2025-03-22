import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/login_screen/widget/login_footer_widget.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/login_screen/widget/login_form.dart';
import 'package:ovella_period_tracker_app/view_model/create_account_provider.dart';
import 'package:provider/provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../../constant/images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        bool value = await _showExitDialog(context);
        if (value) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: BackgroundWidget(
          child: SafeArea(
            child: Consumer<CreateAccountProvider>(
              builder:
                  (BuildContext context, createAccountProvider, Widget? child) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: AppPadding.screenHorizontalPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        Center(child: Image.asset(AppImages.commonHeathConcernAppBarLogo)),
                        SizedBox(height: 24.h),
                        Text(
                          "Welcome Back to Ovella",
                          style: textTheme.headlineLarge,
                        ),
                        Text(
                          "Effortlessly manage your health. Sign in for personalized insights.",
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.h,
                          ),
                        ),
                        LoginForm(),
                        LoginFooterWidget(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Exit App"),
        content: Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Exit"),
          ),
        ],
      ),
    ) ??
        false;
  }
}
