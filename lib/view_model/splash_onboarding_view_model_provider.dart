import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/on_boarding_screen/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashOnBoardViewModelProvider extends ChangeNotifier{

  Future<void> splashController(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isOpenFirst = prefs.getBool('isOpenFirst');
    await Future.delayed(Duration(seconds: 3));
    if (!context.mounted) return;
    if(isOpenFirst==null){
      prefs.setBool('isOpenFirst', true);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
    }else{
    }
  }
}