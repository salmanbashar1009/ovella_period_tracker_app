import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/key_name.dart';
import 'package:ovella_period_tracker_app/view/on_boarding_screen/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routing/route_name.dart';

class SplashOnBoardViewModelProvider extends ChangeNotifier{

  Future<void> splashController(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isOpenFirst = prefs.getBool(AppKeyName.isOpenFirst);
    await Future.delayed(Duration(seconds: 3));
    if (!context.mounted) return;
    if(isOpenFirst==null){
      prefs.setBool(AppKeyName.isOpenFirst, true);
      Navigator.pushNamed(context, RouteName.onboardingScreen);
    }else{
      Navigator.pushNamed(context, RouteName.loginScreen);
    }
  }
}