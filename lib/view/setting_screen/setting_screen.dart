import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/menstrua_health_details_card/menstrua_health_details_card.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/preferences_notifications/preferences_notification_card.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/privacy_data_card/privacy_data_card.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'cards/invite_partner_card/invite_partner_card.dart';
import 'cards/personal_information/personal_information_edit_card.dart';
import 'cards/profile_card/profile_card.dart';
import 'cards/subscribe_card/subscribe_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenHorizontalPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  ProfileCard(),
                  SizedBox(height: 24.h),
                  SubscribeCard(),
                  SizedBox(height: 16.h),
                  InvitePartnerCard(),
                  SizedBox(height: 16.h),
                  PersonalInformationEditCard(),
                  SizedBox(height: 16.h),
                  MenstrualHealthDetailsCard(),
                  SizedBox(height: 16.h),
                  PreferencesNotificationCard(),
                  SizedBox(height: 16.h),
                  PrivacyDataCard(),
                  SizedBox(height:50.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
