import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/common_health_concerns_screen/common_health_concerns_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/community_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/fertility_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/menstral_screen.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/sexualhealt.screen.dart';
import 'package:ovella_period_tracker_app/view/pregnancy_fertility_tracking/pregnancy_fertility_tracking.dart';
import 'package:ovella_period_tracker_app/view/splash_screen/splash_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/pregnancy_screen/pregnancy_detail_screen.dart';
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
      RouteName.menstrualScreen : (context) => MenstralScreen(),
      RouteName.fertilityScreen:(context)=>FertilityScreen(),
      RouteName.sexualScreen:(context)=>SexualScreen(),
<<<<<<< HEAD
      RouteName.pregnancyDetailsScreen:(context)=>PregnancyDetailScreen(),
=======
      RouteName.pregnancyFertilityTracking:(context)=>PregnancyFertilityTracking(),
>>>>>>> b5c5ad6c0914b5dce2c62d34c7fb262c9471309f
    };
  }
}