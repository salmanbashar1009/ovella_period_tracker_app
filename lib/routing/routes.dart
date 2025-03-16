import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_account_screen/create_account_screen.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/create_new_password/create_new_password.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/login_screen/login_screen.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/otp_screen/otp_screen.dart';
import 'package:ovella_period_tracker_app/view/auth_screens/reset_password/reset_password_screen.dart';
import 'package:ovella_period_tracker_app/view/common_health_concerns_screen/common_health_concerns_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/community_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/fertility_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/menstral_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/sexualhealt.screen.dart';
import 'package:ovella_period_tracker_app/view/home_screen/add_log_screen/add_log_screen.dart';
import 'package:ovella_period_tracker_app/view/home_screen/log_period_screen/log_period_screen.dart';
import 'package:ovella_period_tracker_app/view/parent_screen/parent_screen.dart';
import 'package:ovella_period_tracker_app/view/pregnancy_fertility_tracking/pregnancy_fertility_tracking.dart';
import 'package:ovella_period_tracker_app/view/splash_screen/splash_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/menstrual_fertility_screens/add_note_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/tracking_screen.dart';
import '../view/home_screen/home_screen.dart';
import '../view/on_boarding_screen/on_boarding_screen.dart';
import '../view/step_screen/step_screen.dart';

class AppRoutes{

  static Map<String, WidgetBuilder> getRoutes(){
    return{
      RouteName.home : (context) => HomeScreen(),
      RouteName.community: (context)=>CommunityScreen(),
      RouteName.stepScreen : (context) => StepScreen(),
      RouteName.onboardingScreen : (context) => OnBoardingScreen(),
      RouteName.splashScreen : (context) => SplashScreen(),
      RouteName.commonHealthConcernScreen : (context) => CommonHealthConcernsScreen(),
      RouteName.trackingScreen : (context) => TrackingScreen(),
      RouteName.menstralScreen : (context) => MenstralScreen(),
      RouteName.fertilityScreen:(context)=>FertilityScreen(),
      RouteName.sexualScreen:(context)=>SexualScreen(),
      RouteName.pregnancyFertilityTracking:(context)=>PregnancyFertilityTracking(),
      RouteName.logPeriodScreen: (context) => LogPeriodScreen(),
      RouteName.addLogScreen: (context) => AddLogScreen(),
      RouteName.addNoteScreen : (context) => AddNoteScreen(),
      RouteName.createAccountScreen:(context)=>CreateAccountScreen(),
      RouteName.loginScreen:(context)=>LoginScreen(),
      RouteName.resetPasswordScreen:(context)=>ResetPasswordScreen(),
      RouteName.otpScreen:(context)=>OtpScreen(),
      RouteName.createNewPassword:(context)=>CreateNewPassword(),
      RouteName.parentScreen:(context)=>ParentScreen(),
    };
  }
}