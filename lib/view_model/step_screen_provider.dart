import 'package:flutter/cupertino.dart';
import '../view/step_screen/widget/Parts/step1.dart';
import '../view/step_screen/widget/Parts/step2.dart';
import '../view/step_screen/widget/Parts/step3.dart';

class StepScreenProvider extends ChangeNotifier{
  int currentIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> carouselItems = [Step1(), Step2(), Step3()];

  void updateIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

}