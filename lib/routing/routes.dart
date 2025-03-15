import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/community_screen.dart';
import 'package:ovella_period_tracker_app/view/splash_screen/splash_screen.dart';
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
      RouteName.trackingScreen : (context) => TrackingScreen(),
    };
  }
}