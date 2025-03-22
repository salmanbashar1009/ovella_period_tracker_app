import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/community_screen/screen/community_screen.dart';
import 'package:ovella_period_tracker_app/view/home_screen/home_screen.dart';
import 'package:ovella_period_tracker_app/view/setting_screen/setting_screen.dart';
import 'package:ovella_period_tracker_app/view/tracking_screens/tracking_screen.dart';

import '../view/ai_chat/chat_screen.dart';

class ParentScreenProvider with ChangeNotifier {
  final List<Widget> _parentScreens =  [
    HomeScreen(),
    TrackingScreen(),
    ChatScreen(),
    CommunityScreen(),
    SettingScreen(),

  ];
  List<Widget> get parentScreens => _parentScreens;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onSelectedIndex(int index) {
    debugPrint("\nselected parent screen index : $index\n");
    _selectedIndex = index;
    notifyListeners();
  }
}
