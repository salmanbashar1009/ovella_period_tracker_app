import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ovella_period_tracker_app/constant/hive_box_name.dart';
import 'package:ovella_period_tracker_app/services/local_storage_services/hive_services.dart';

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

  /// age selection part
  List<int> allAges = List.generate(91, (i) => i + 10);

  int selectedAge = 28;

  void ageSelection(int age) {
    selectedAge = age;
    notifyListeners();
  }

  ///Language selection part
  // String selectedLanguage = 'English';

  List<Map<String, String>> allLanguages = [
    {"code": "af", "name": "Afrikaans"},
    {"code": "ar", "name": "Arabic"},
    {"code": "bn", "name": "Bengali"},
    {"code": "bg", "name": "Bulgarian"},
    {"code": "my", "name": "Burmese"},
    {"code": "ca", "name": "Catalan"},
    {"code": "zh", "name": "Chinese (Mandarin)"},
    {"code": "hr", "name": "Croatian"},
    {"code": "cs", "name": "Czech"},
    {"code": "da", "name": "Danish"},
    {"code": "nl", "name": "Dutch"},
    {"code": "en", "name": "English"},
    {"code": "et", "name": "Estonian"},
    {"code": "tl", "name": "Filipino (Tagalog)"},
    {"code": "fi", "name": "Finnish"},
    {"code": "fr", "name": "French"},
    {"code": "ka", "name": "Georgian"},
    {"code": "de", "name": "German"},
    {"code": "el", "name": "Greek"},
    {"code": "gu", "name": "Gujarati"},
    {"code": "he", "name": "Hebrew"},
    {"code": "hi", "name": "Hindi"},
    {"code": "hu", "name": "Hungarian"},
    {"code": "is", "name": "Icelandic"},
    {"code": "id", "name": "Indonesian"},
    {"code": "it", "name": "Italian"},
    {"code": "ja", "name": "Japanese"},
    {"code": "kn", "name": "Kannada"},
  ];

   Map<String, String> selectedLanguage = {"code": "en", "name": "English"}; // Default language

  StepScreenProvider() {
    loadSelectedLanguage(); // Load the saved language on startup
  }

  void languageSelection(Map<String, String> language) async {
    await HiveServices.saveToHive(
      boxName: BoxName.settingsBox, 
      modelName: ModelName.languageModelName, 
      jsonData: language
    );

    selectedLanguage = language;
    notifyListeners();
  }

  void loadSelectedLanguage() async {
    var storedLanguage = await HiveServices.fetchHiveData(
      boxName: BoxName.settingsBox, 
      modelName: ModelName.languageModelName, 
    );

    if (storedLanguage != null && storedLanguage is Map<String, dynamic>) {
      selectedLanguage = Map<String, String>.from(storedLanguage);
    } else {
      selectedLanguage = {"code": "en", "name": "English"}; // Default to English
      await HiveServices.saveToHive(
      boxName: BoxName.settingsBox, 
      modelName: ModelName.languageModelName, 
        jsonData: selectedLanguage
      );
    }

    notifyListeners();
  }

//  final Box settingsBox = Hive.box('settings');
//   Map<String, String> selectedLanguage = {"code": "en", "name": "English"}; // Default language

//   StepScreenProvider() {
//     loadSelectedLanguage(); // Load the saved language on startup
//   }

//   void languageSelection(Map<String, String> language) async {
//     await settingsBox.put('language', language);
//     selectedLanguage = language;
//     notifyListeners();
//   }

//   void loadSelectedLanguage() {
//     final storedLanguage = settingsBox.get('language');

//     if (storedLanguage != null && storedLanguage is Map) {
//       selectedLanguage = Map<String, String>.from(storedLanguage);
//     } else {
//        selectedLanguage = {"code": "en", "name": "English"}; // Set default to English
//        settingsBox.put('language', selectedLanguage); // Save the default language
//     }

//     notifyListeners();
//   }
  //Language searching
  TextEditingController languageSearchController = TextEditingController();
  String languageSearchQuery = "";

  void searchingLanguage(String value) {
    languageSearchQuery = value;
    notifyListeners();
  }

  ///Gender selection part
  String selectedGender = 'Female';
  List<String> allGender = ['Male', 'Female', 'Other'];
  void genderSelection(String gender) {
    selectedGender = gender;
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

  ///<------------ Pregnancy & Fertility Tracking-------------->>
  String areYouActivelyTryingToConceive = '';
  String haveYouExperiencedPregnancyLoss = '';
  String doYouHaveHistoryOfHighBloodPressure = '';
  String haveYouBeenDiagnosedWithFertilityConditions = '';

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

  ///<------------- length of Cycle & period Date ----------->
  int selectedCycleLength = 28;
  List<int> cycleLength = List.generate(35, (i) => i + 14);

  void cycleLengthSelection(int age) {
    selectedCycleLength = age;
    notifyListeners();
  }

  String formatDate(DateTime? date) {
    return DateFormat("MMM dd, yyyy").format(date ?? DateTime.now());
  }

  DateTime? _startDate;
  DateTime? _endDate;

  DateTime? get periodStartDate => _startDate;
  DateTime? get periodEndDate => _endDate;

  void selectDate(DateTime selectedDay) {
    if (_startDate == null || (_startDate != null && _endDate != null)) {
      // Reset selection and start a new range
      _startDate = selectedDay;
      _endDate = null;
    } else if (_startDate != null && _endDate == null) {
      // Ensure end date is after start date
      if (selectedDay.isAfter(_startDate!)) {
        _endDate = selectedDay;
      } else {
        // If the user selects a day before start date, make it the new start
        _startDate = selectedDay;
      }
    }
    notifyListeners();
  }

  void updateSelectedLanguage(String languageCode) {

    selectedLanguage ={"code":languageCode };
  }
}
