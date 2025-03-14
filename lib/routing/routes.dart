import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/routing/route_name.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/community_screen.dart';

import '../view/home_screen/home_screen.dart';

class AppRoutes{

  static Map<String, WidgetBuilder> getRoutes(){
    return{
      RouteName.home : (context) => HomeScreen(),
      RouteName.community: (context)=>CommunityScreen(),
      //RouteName.stepScreen : (context) => StepScreen(),
     // RouteName.onboardingScreen : (context) => OnBoardingScreen(),
    };
  }
}