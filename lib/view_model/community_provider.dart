import 'package:flutter/widgets.dart';

class CommunityProvider with ChangeNotifier{


  int _selectedIndex = 0; 

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }



}