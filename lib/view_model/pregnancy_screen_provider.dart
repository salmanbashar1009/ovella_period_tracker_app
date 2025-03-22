import 'package:flutter/cupertino.dart';

class PregnancyScreenProvider extends ChangeNotifier{
  int _selectedWeek = 0;
  int get selectedWeek  => _selectedWeek;
  List<int> weekList = List.generate(50, (i) => i);
  void updatedSelectedWeek(int value){
    _selectedWeek = value;
    notifyListeners();
  }

  ///image slider provider

  final List<String> _imagePath = [
    "assets/images/pregnancy/baby.png",
    "assets/images/pregnancy/checkup.png",
    "assets/images/pregnancy/baby.png",
    "assets/images/pregnancy/checkup.png",
    "assets/images/pregnancy/baby.png",
  ];

  List<String> get imagePath => _imagePath;


}