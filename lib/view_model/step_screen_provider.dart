import 'package:flutter/cupertino.dart';
import '../view/step_screen/widget/Parts/step1.dart';
import '../view/step_screen/widget/Parts/step2.dart';
import '../view/step_screen/widget/Parts/step3.dart';

class StepScreenProvider extends ChangeNotifier{
  int currentIndex = 0;
  String stepOneMode = 'Default';
  List<int> allAges = [1, 10, 2, 3, 9, 4, 5, 6];
  List<String> allLanguages = ['Bangla', 'English', 'Hindi', 'Urdu', 'Arabic', 'Tamil', 'Spanish', 'Gujrathi'];
  int selectedAge = 20;
  String selectedLanguage = 'English';

  final PageController pageController = PageController();

  final List<Widget> carouselItems = [Step1(), Step2(), Step3()];

  void updateIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

  void stepOneModeSelection(String modeName){
    stepOneMode = modeName;
    notifyListeners();
  }
  void ageSelection(int age){
    selectedAge = age;
    notifyListeners();
  }
  void languageSelection(String language){
    selectedLanguage = language;
    notifyListeners();
  }

}