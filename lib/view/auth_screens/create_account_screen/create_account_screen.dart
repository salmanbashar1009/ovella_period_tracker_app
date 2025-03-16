import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import '../../common_health_concerns_screen/widgets/common_heath_concern_header_widget.dart';
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonHeathScreenConcernHeaderWidget(),
                SizedBox(height: 24.h),
                Text(
                  "Pregnancy & Fertility Tracking",
                  style: textTheme.headlineLarge,
                ),
                Text(
                  "Track your fertility and pregnancy journey with key health insights.",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
