import 'package:flutter/cupertino.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';

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
    AppImages.babyImage,
    AppImages.checkupImage,
    AppImages.babyImage,
    AppImages.checkupImage,
    AppImages.babyImage,
    AppImages.checkupImage,

  ];

  List<String> get imagePath => _imagePath;


}