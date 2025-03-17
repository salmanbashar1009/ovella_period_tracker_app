import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/utility/utils.dart';
import 'package:ovella_period_tracker_app/view_model/settings_provider.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'package:provider/provider.dart';
import 'cards/trail_card_7days.dart';
import 'cards/unlock_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: Consumer<SettingsProvider>(
          builder: (BuildContext context, settingsProvider, Widget? child) {
            return Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Column(
                children: [
                  AppBar(leading: Utils.backButton(context)),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        UnlockCard(
                          textTheme: textTheme,
                          colorScheme: colorScheme,
                        ),
                        SizedBox(height: 24.h),

                        TrailCard7Days(
                          colorScheme: colorScheme,
                          textTheme: textTheme,
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          padding: AppPadding.screenPadding,
                          decoration: BoxDecoration(
                            color: colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Monthly",
                                style: textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "£0.50",
                                    style: textTheme.headlineSmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "per month",
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Row(
                          children: [
                            Checkbox(
                              value: settingsProvider.acceptTermsConditions,
                              onChanged:
                                  settingsProvider.updateAcceptTeamCondition,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'By starting your trial, you agree to our ',
                                      style: TextStyle(
                                        fontSize: 13.h,
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service ',
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
                        SizedBox(height: 16.h),
                        SizedBox(
                          width: double.infinity,
                          child: Utils.primaryButton(
                            title: 'Start Your Free Trial',
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 18.h,
                            ),
                            onTap: () {},
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
