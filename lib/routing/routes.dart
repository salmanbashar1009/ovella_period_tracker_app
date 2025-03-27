import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_account_screen/create_account_screen.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_new_password/create_new_password.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/login_screen/login_screen.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/otp_screen/otp_screen.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/reset_password/reset_password_screen.dart';
import 'package:ovella_period_tracker_app/view/common_health_concerns_screen/common_health_concerns_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/community_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/fertility_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/menstral_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/Forum_screen/sexualhealt.screen.dart';
import 'package:ovella_period_tracker_app/view/home_screen/add_log_screen/add_log_screen.dart';
import 'package:ovella_period_tracker_app/view/home_screen/log_period_screen/log_period_screen.dart';
import 'package:ovella_period_tracker_app/view/invite_partner_screen/invite_partner_screen.dart';
import 'package:ovella_period_tracker_app/view/notification_screen/notification_screen.dart';
import 'package:ovella_period_tracker_app/view/pairing_screen/pairing_screen.dart';
import 'package:ovella_period_tracker_app/view/parent_screen/parent_screen.dart';
import 'package:ovella_period_tracker_app/view/pregnancy_fertility_tracking/pregnancy_fertility_tracking.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/language_setting_screen/language_setting_screen.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/menstrual_health_details/menstrual_health_details.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/personal_information_setting/personal_information_settings.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/personal_information_setting/select_Age_screen.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/screens/personal_information_setting/select_gender_screen.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/setting_screen.dart';
import 'package:ovella_period_tracker_app/view/splash_screen/splash_screen.dart';
import 'package:ovella_period_tracker_app/view/subscription_screen/subscription_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/add_note_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/edit_calender_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/pregnancy_detail_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/tracking_screen.dart';
import '../view/home_screen/add_log_screen/arguments_model/arguments_model.dart';
import '../view/home_screen/home_screen.dart';
import '../view/home_screen/see_all_wellness_tips_screen/wellness_tips_screen.dart';
import '../view/on_boarding_screen/on_boarding_screen.dart';
import '../view/step_screen/step_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RouteName.home: (context) => HomeScreen(),
      RouteName.community: (context) => CommunityScreen(),
      RouteName.stepScreen: (context) => StepScreen(),
      RouteName.onboardingScreen: (context) => OnBoardingScreen(),
      RouteName.splashScreen: (context) => SplashScreen(),
      RouteName.commonHealthConcernScreen:
          (context) => CommonHealthConcernsScreen(),
      RouteName.trackingScreen: (context) => TrackingScreen(),
      RouteName.menstralScreen: (context) => MenstralScreen(),
      RouteName.fertilityScreen: (context) => FertilityScreen(),
      RouteName.sexualScreen: (context) => SexualScreen(),
      RouteName.pregnancyFertilityTracking:
          (context) => PregnancyFertilityTracking(),
      RouteName.logPeriodScreen: (context) => LogPeriodScreen(),
      RouteName.addLogScreen: (context)  {
        final args = ModalRoute.of(context)!.settings.arguments as AddLogScreenArguments;
        return AddLogScreen(
          isBackButtonOnAppBar: args.isBackButtonOnAppBar,
          saveButtonText: args.saveButtonText,
          onSave: args.onSave,
        );
      },
      RouteName.addNoteScreen: (context) => AddNoteScreen(),
      RouteName.createAccountScreen: (context) => CreateAccountScreen(),
      RouteName.loginScreen: (context) => LoginScreen(),
      RouteName.resetPasswordScreen: (context) => ResetPasswordScreen(),
      RouteName.otpScreen: (context) => OtpScreen(),
      RouteName.createNewPassword: (context) => CreateNewPassword(),
      RouteName.parentScreen: (context) => ParentScreen(),
      RouteName.settingScreen: (context) => SettingScreen(),
      RouteName.subscriptionScreen: (context) => SubscriptionScreen(),

      RouteName.editCalenderScreen: (context) => EditCalenderScreen(),
      RouteName.pregnancyDetailsScreen: (context) => PregnancyDetailScreen(),

      RouteName.invitePartnerScreen: (context) => InvitePartnerScreen(),
      RouteName.pairingScreen: (context) => PairingScreen(),
      RouteName.selectGenderScreen: (context) => SelectGenderScreen(),
      RouteName.editProfileScreen: (context) => EditProfileScreen(),
      RouteName.languageSettingScreen: (context) => LanguageSettingScreen(),
      RouteName.personalInformationSettingScreen: (context) => PersonalInformationSettings(),
      RouteName.selectAgeScreen: (context) => SelectAgeScreen(),
      RouteName.menstrualHealthDetails: (context) => MenstrualHealthDetails(),
      RouteName.notificationScreen: (context) => NotificationScreen(),
      RouteName.wellnessTipsScreen: (context) {
        return WellnessTipsScreen();
      } ,
    };
  }
}
