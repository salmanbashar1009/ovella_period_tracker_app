import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
  }

  ScrollController homeScreenScrollController = ScrollController();

  /// All about period tips
  int _periodTipsCurrentPage = 0;
  int get periodTipsCurrentPage => _periodTipsCurrentPage;

  void onChangedPeriodTipsCurrentPage(int index) {
    _periodTipsCurrentPage = index;
    notifyListeners();
  }

  /// All about period calendar
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;
  final ScrollController periodScrollController = ScrollController();

  DateTime get currentDate => _currentDate;
  DateTime? get selectedDate => _selectedDate;
  List<DateTime> get daysInMonth => _getDaysInMonth(_currentDate);

  List<DateTime> _getDaysInMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(daysInMonth, (index) => DateTime(date.year, date.month, index + 1));
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void changeMonth(int increment) {
    _currentDate = DateTime(_currentDate.year, _currentDate.month + increment, 1);
    _selectedDate = null;
    notifyListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
  }

  void _scrollToCurrentDate() {
    int currentIndex = _currentDate.day - 1;
    double itemWidth = 62.w;
    double screenWidth = periodScrollController.position.viewportDimension;

    double scrollTo = (currentIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
    periodScrollController.jumpTo(scrollTo.clamp(0, periodScrollController.position.maxScrollExtent));
  }

  /// All about add log
  String symptomsLog = "Symptoms";
  String moodLog = "Mood";
  String _logTo = "Symptoms";
  String get logTo => _logTo;
  void onLog({required String logTo}){
    _logTo = logTo;
    notifyListeners();
  }

  final List<Map<String, dynamic>> _symptoms =  [
    {"text": "Everything is fine", "iconPath": AppEmojis.like, "selected": false},
    {"text": "Cramps", "iconPath": AppEmojis.cramps, "selected": false},
    {"text": "Acne", "iconPath": AppEmojis.acne, "selected": false},
    {"text": "Tender breasts", "iconPath": AppEmojis.breasts, "selected": false},
    {"text": "Milky nipple discharge", "iconPath": AppEmojis.milkyNippleDischarge, "selected": false},
    {"text": "Abdominal pain", "iconPath": AppEmojis.abdominalPain, "selected": false},
    {"text": "Fatigue", "iconPath": AppEmojis.fatigue, "selected": false},
    {"text": "Sleepiness", "iconPath": AppEmojis.sleepiness, "selected": false},
    {"text": "Backache", "iconPath": AppEmojis.backache, "selected": false},
    {"text": "Frequent urination", "iconPath": AppEmojis.frequentUrination, "selected": false},
    {"text": "Cravings", "iconPath": AppEmojis.cravings, "selected": false},
    {"text": "Insomnia", "iconPath": AppEmojis.insomnia, "selected": false},
    {"text": "Headache", "iconPath": AppEmojis.headache, "selected": false},
    {"text": "Leg cramps", "iconPath": AppEmojis.legCramps, "selected": false},
    {"text": "Bleeding gums", "iconPath": AppEmojis.bleedingGums, "selected": false},
  ];
  List<Map<String, dynamic>> get symptoms => _symptoms;

  final List<Map<String, dynamic>> _moods =  [
    {"text": "Calm", "iconPath": AppEmojis.calm, "selected": false},
    {"text": "Happy", "iconPath": AppEmojis.happy, "selected": false},
    {"text": "Energetic", "iconPath": AppEmojis.energetic, "selected": false},
    {"text": "Mood swings", "iconPath": AppEmojis.moodSwing, "selected": false},
    {"text": "Frisky", "iconPath": AppEmojis.frisky, "selected": false},
    {"text": "Irritated", "iconPath": AppEmojis.irritated, "selected": false},
    {"text": "Sad", "iconPath": AppEmojis.sad, "selected": false},
    {"text": "Anxious", "iconPath": AppEmojis.anxious, "selected": false},
    {"text": "Depressed", "iconPath": AppEmojis.depressed, "selected": false},
    {"text": "Very self critical", "iconPath": AppEmojis.verySelfCritical, "selected": false},
    {"text": "Apathetic", "iconPath": AppEmojis.apathetic, "selected": false},
    {"text": "Confused", "iconPath": AppEmojis.confused, "selected": false},
    {"text": "Low energy", "iconPath": AppEmojis.lowEnergy, "selected": false},
    {"text": "Feeling guilty", "iconPath": AppEmojis.feelingGuilty, "selected": false},
    {"text": "Obsessive thoughts", "iconPath": AppEmojis.thoughts, "selected": false},
  ];
  List<Map<String, dynamic>> get moods => _moods;


  final List<Map<String, dynamic>> _selectedSymptoms = [];
  final List<Map<String, dynamic>> _selectedMoods = [];
  List<Map<String, dynamic>> get selectedSymptoms => _selectedSymptoms;
  List<Map<String, dynamic>> get selectedMoods => _selectedMoods;

  void onSelectLog(Map<String,dynamic> item){
    debugPrint("\nselected item text : ${item["text"]}\nselection : ${item["selected"]}");
    int index = -1;
    if(logTo == symptomsLog){
       index = _symptoms.indexWhere((itm)=>itm["text"] == item["text"]);
      _symptoms[index]["selected"] = !_symptoms[index]["selected"];
       if(_symptoms[index]["selected"]){
         _selectedSymptoms.add(_symptoms[index]);
       }
       else{
         _selectedSymptoms.remove(_symptoms[index]);
       }
    }
    else{
       index = _moods.indexWhere((itm)=>itm["text"] == item["text"]);
      _moods[index]["selected"] = !_moods[index]["selected"];
       if(_moods[index]["selected"]){
         _selectedMoods.add(_moods[index]);
       }
       else{
         _selectedMoods.remove(_moods[index]);
       }
    }



    notifyListeners();
      }


  /// All about log period

  /// List to hold selected days
  List<DateTime> _selectedDays = [
    DateTime(2025, 3, 27), // Example existing dates
    DateTime(2025, 3, 28),
    DateTime(2025, 3, 29),
    DateTime(2025, 3, 30),
  ];

  /// Getter for selected days
  List<DateTime> get selectedDays => _selectedDays;

  /// Method to toggle selection of a day
  void toggleSelectedDay(DateTime day) {
    /// If the day is already selected, remove it, else add it
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }
    notifyListeners();
  }

  /// Method to check if a day is selected
  bool isSelected(DateTime day) {
    return _selectedDays.contains(day);
  }

}
