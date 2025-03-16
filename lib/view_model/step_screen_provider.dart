import 'package:flutter/cupertino.dart';

import '../view/step_screen/Parts/step1.dart';
import '../view/step_screen/Parts/step2.dart';
import '../view/step_screen/Parts/step3.dart';

class StepScreenProvider extends ChangeNotifier {
  ///<----------------Step Page -------->
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _carouselItems = [Step1(), Step2(), Step3()];

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;
  List<Widget> get carouselItems => _carouselItems;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updatePage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    updateIndex(pageIndex);
  }

  ///<------------- Step 1------------>

  //mode ==> default , age selection & language selection
  String stepOneMode = 'Default';

  TextEditingController nameController = TextEditingController();

  void stepOneModeSelection(String modeName) {
    stepOneMode = modeName;
    notifyListeners();
  }

  // age selection part
  List<int> allAges = [
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
  ];
  int selectedAge = 28;

  void ageSelection(int age) {
    selectedAge = age;
    notifyListeners();
  }

  //Language selection part
  String selectedLanguage = 'English';
  List<String> allLanguages = [
    'Bangle',
    'English',
    'Hindi',
    'Urdu',
    'Arabic',
    'Tamil',
    'Spanish',
    'Gujarati',
  ];
  void languageSelection(String language) {
    selectedLanguage = language;
    notifyListeners();
  }

  ///<------------------ Step2 & Step3---------------->
  bool _isRegularCircle = false;
  bool _isCurrentlyPregnant = false;
  bool _isExperienceIrregularPeriods = false;
  bool _isPeriodOvulationReminders = false;
  bool _isWhatsAppUpdatesHealthTips = false;

  bool get isRegularCircle => _isRegularCircle;
  bool get isCurrentlyPregnant => _isCurrentlyPregnant;
  bool get isExperienceIrregularPeriods => _isExperienceIrregularPeriods;
  bool get isPeriodOvulationReminders => _isPeriodOvulationReminders;
  bool get isWhatsAppUpdatesHealthTips => _isWhatsAppUpdatesHealthTips;

  void toggleIsRegularCircle(bool value) {
    _isRegularCircle = value;
    notifyListeners();
  }
  void toggleIsCurrentlyPregnant(bool value) {
    _isCurrentlyPregnant = value;
    notifyListeners();
  }
  void toggleIsExperienceIrregularPeriods(bool value) {
    _isExperienceIrregularPeriods = value;
    notifyListeners();
  }
  void toggleIsPeriodOvulationReminders(bool value) {
    _isPeriodOvulationReminders = value;
    notifyListeners();
  }
  void toggleIsWhatsAppUpdatesHealthTips(bool value) {
    _isWhatsAppUpdatesHealthTips = value;
    notifyListeners();
  }

  ///<------------Common Heath concern Screen------------>
  String diagnosedWithFibroids = '';
  String diagnosedWithPCOS = '';
  String historyOfEndometriosis = '';
  String familyHistoryOfFibroids = '';

  void updateDiagnosedWithFibroids(String value) {
    diagnosedWithFibroids = value;
    notifyListeners();
  }
  void updateDiagnosedWithPCOS(String value) {
    diagnosedWithPCOS = value;
    notifyListeners();
  }
  void updateHistoryOfEndometriosis(String value) {
    historyOfEndometriosis = value;
    notifyListeners();
  }
  void updateFamilyHistoryOfFibroids(String value) {
    familyHistoryOfFibroids = value;
    notifyListeners();
  }

  ///<------------ Pregnancy & Fertility Tracking
  String areYouActivelyTryingToConceive = '';
  String haveYouExperiencedPregnancyLoss = '';
  String doYouHaveHistoryOfHighBloodPressure = '';
  String haveYouBeenDiagnosedWithFertilityConditions= '';

  void updateAreYouActivelyTryingToConceive(String value) {
    areYouActivelyTryingToConceive = value;
    notifyListeners();
  }
  void updateHaveYouExperiencedPregnancyLoss(String value) {
    haveYouExperiencedPregnancyLoss = value;
    notifyListeners();
  }
  void updateDoYouHaveHistoryOfHighBloodPressure(String value) {
    doYouHaveHistoryOfHighBloodPressure = value;
    notifyListeners();
  }
  void updateHaveYouBeenDiagnosedWithFertilityConditions(String value) {
    haveYouBeenDiagnosedWithFertilityConditions = value;
    notifyListeners();
  }
}
