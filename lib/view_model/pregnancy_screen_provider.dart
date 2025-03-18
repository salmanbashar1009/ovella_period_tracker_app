import 'package:flutter/cupertino.dart';

class PregnancyScreenProvider extends ChangeNotifier{
  int _selectedWeek = 0;
  int get selectedWeek  => _selectedWeek;
  List<int> weekList = List.generate(50, (i) => i);
  void updatedSelectedWeek(int value){
    _selectedWeek = value;
    notifyListeners();
  }
}