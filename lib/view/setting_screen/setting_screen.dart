import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/menstrua_health_details_card/menstrua_health_details_card.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/preferences_notifications/preferences_notification_card.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/privacy_data_card/privacy_data_card.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/cards/suport_community_card/support_community_card.dart';
import 'package:ovella_period_tracker_app/widgets/background_widget.dart';
import 'cards/invite_partner_card/invite_partner_card.dart';
import 'cards/personal_information/personal_information_edit_card.dart';
import 'cards/profile_card/profile_card.dart';
import 'cards/subscribe_card/subscribe_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: AppPadding.screenHorizontalPadding,
              child: Column(
                children: [
                  SizedBox(height: 12.h),

                  /// Edit Profile
                  ProfileCard(),
                  SizedBox(height: 24.h),


                  ///  Subscribe Now
                  SubscribeCard(),
                  SizedBox(height: 16.h),

                  ///Invite Your Partner To Ovella
                  InvitePartnerCard(),
                  SizedBox(height: 16.h),

                  /// Personal Information
                  PersonalInformationEditCard(),
                  SizedBox(height: 16.h),


                  ///Menstrual & Health Details
                  MenstrualHealthDetailsCard(),
                  SizedBox(height: 16.h),

                  /// Preferences & Notifications
                  PreferencesNotificationCard(),
                  SizedBox(height: 16.h),

                  /// Privacy & Data
                  PrivacyDataCard(),
                  SizedBox(height: 16.h,),

                  ///Support & Community
                  SupportCommunityCard(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
