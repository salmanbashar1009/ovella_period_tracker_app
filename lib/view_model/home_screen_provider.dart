import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovella_period_tracker_app/constant/hive_box_name.dart';
import 'package:ovella_period_tracker_app/constant/images.dart';
import 'package:ovella_period_tracker_app/constant/key_name.dart';
import 'package:ovella_period_tracker_app/model/period_information_model.dart';
import 'package:ovella_period_tracker_app/model/period_tips_model.dart';
import 'package:ovella_period_tracker_app/services/local_storage_services/hive_services.dart';

class HomeScreenProvider with ChangeNotifier {
  /// Constructor
  HomeScreenProvider() {
    //  _appPredictedPeriodDays.sort();

    // debugPrint("\nlast period date : ${_appPredictedPeriodDays[0]}\n");

    _getPeriodTips();
    fetchPeriodInformation();
    _symptoms[0]["selected"] = !_symptoms[0]["selected"];
    _selectedSymptoms.add(_symptoms[0]);
    _symptoms[1]["selected"] = !_symptoms[1]["selected"];
    _selectedSymptoms.add(_symptoms[1]);
    _symptoms[2]["selected"] = !_symptoms[2]["selected"];
    _selectedSymptoms.add(_symptoms[2]);


    _moods[0]["selected"] = !_moods[0]["selected"];
    _selectedMoods.add(_moods[0]);
    _moods[1]["selected"] = !_moods[1]["selected"];
    _selectedMoods.add(_moods[1]);
    _moods[2]["selected"] = !_moods[2]["selected"];
    _selectedMoods.add(_moods[2]);


  }

  PeriodTipsModel? _periodTipsModel;
  PeriodTipsModel? get periodTipsModel => _periodTipsModel;

  /// period tips map data
  final Map<String, dynamic> _periodTips = {
    "tips":[
      {
        "title": "Fibroids mainly affect women.",
        "body": "Fibroids can disrupt cycles, cause heavy bleeding, and impact fertility.",
        "image": AppImages.fibroids
      },
      {
        "title": "Migraines affect women.",
        "body": "Fibroids can lead to pain, bloating, and frequent urination.",
        "image": AppImages.migraine
      },
      {
        "title": "PCOS affects women.",
        "body": "Fibroids may cause complications during pregnancy and labor.",
        "image": AppImages.pcos
      }
    ]
  };

  /// fetch period tips
  Future<void> _getPeriodTips() async {
    _periodTipsModel = PeriodTipsModel.fromJson(_periodTips);
    notifyListeners();
  }

  PeriodInformationModel? _periodInformationModel = PeriodInformationModel(
    nextPeriodDates: [
      DateTime(DateTime.now().year, DateTime.now().month, 25),
      DateTime(DateTime.now().year, DateTime.now().month, 20),
      DateTime(DateTime.now().year, DateTime.now().month, 26),
      DateTime(DateTime.now().year, DateTime.now().month, 27),
      DateTime(DateTime.now().year, DateTime.now().month, 28),
    ],
    cycleLength: 28,
    healthConditions: "PCOS",
    lastPeriodDate: DateTime(DateTime.now().year, DateTime.now().month, 28),
    pregnancyStatus: "Not Pregnant",
  );
  PeriodInformationModel? get periodInformationModel => _periodInformationModel;

  Future<void> fetchPeriodInformation() async {
    var data = await HiveServices.fetchHiveData(
      boxName: BoxName.userBoxName,
      modelName: ModelName.periodModelName,
    );

    if (data == null) {
      final List<DateTime> nextPeriodDates = [
        DateTime(DateTime.now().year, DateTime.now().month + 1, 25),
        DateTime(DateTime.now().year, DateTime.now().month + 1, 26),
        DateTime(DateTime.now().year, DateTime.now().month + 1, 27),
        DateTime(DateTime.now().year, DateTime.now().month + 1, 28),
      ];
      nextPeriodDates.sort();
      debugPrint("\nafter sorting : $nextPeriodDates\n");
      await updatePeriodInformationModel(
        nextPeriodDates: nextPeriodDates,
        cycleLength: 28,
        healthConditions: "PCOS",
        lastPeriodDate: DateTime(DateTime.now().year, DateTime.now().month, 28),
        pregnancyStatus: "Not Pregnant",
      );
    } else {
      _periodInformationModel = PeriodInformationModel.fromJson(data);
      _tempPeriodDaysSelection = List<DateTime>.from(_periodInformationModel!.nextPeriodDates,
      );
    }

    _setOvulationDay();
    updatePeriodDaysLeft();
  }

  Future<void> updatePeriodInformationModel({
    List<DateTime>? nextPeriodDates,
    DateTime? lastPeriodDate,
    int? cycleLength,
    String? pregnancyStatus,
    String? healthConditions,
  }) async {
    debugPrint("\nupdate method called\n");
    _periodInformationModel?.nextPeriodDates =
        nextPeriodDates ?? _periodInformationModel!.nextPeriodDates;
    _periodInformationModel?.cycleLength =
        cycleLength ?? _periodInformationModel!.cycleLength;
    _periodInformationModel?.lastPeriodDate =
        lastPeriodDate ?? _periodInformationModel!.lastPeriodDate;
    _periodInformationModel?.pregnancyStatus =
        pregnancyStatus ?? _periodInformationModel!.pregnancyStatus;
    _periodInformationModel?.healthConditions =
        healthConditions ?? _periodInformationModel!.healthConditions;
    _tempPeriodDaysSelection = List<DateTime>.from(
      _periodInformationModel!.nextPeriodDates,
    );
    _setOvulationDay();
    notifyListeners();
    await HiveServices.saveToHive(
      boxName: BoxName.userBoxName,
      modelName: ModelName.periodModelName,
      jsonData: _periodInformationModel!.toJson(),
    );
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
  DateTime _currentDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  int _periodDaysLeft = 0;
  int get periodDaysLeft => _periodDaysLeft;
  final ScrollController periodScrollController = ScrollController();

  DateTime get currentDate => _currentDate;
  List<DateTime> get daysInMonth => _getDaysInMonth(_currentDate);

  void updatePeriodDaysLeft() {
    DateTime firstPeriodDate = _tempPeriodDaysSelection![0];
    Duration difference = firstPeriodDate.difference(DateTime.now());
    _periodDaysLeft = difference.inDays;
    notifyListeners();
  }

  List<DateTime> _getDaysInMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  void changeMonth(int increment) {
    _currentDate = DateTime(
      _currentDate.year,
      _currentDate.month + increment,
      1,
    );
    if (_currentDate.month == DateTime.now().month &&
        _currentDate.year == DateTime.now().year) {
      _currentDate = DateTime.now();
    }
    notifyListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToCurrentDate());
  }

  void scrollToCurrentDate() {
    debugPrint("\nscrolling to current date\n");
    int currentIndex = _currentDate.day - 1;
    double itemWidth = 74.w;
    double screenWidth = periodScrollController.position.viewportDimension;

    double scrollTo =
        (currentIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
    periodScrollController.jumpTo(
      scrollTo.clamp(0, periodScrollController.position.maxScrollExtent),
    );
  }

  /// All about add log
  String symptomsLog = "Symptoms";
  String moodLog = "Mood";
  String _logTo = "Symptoms";
  String get logTo => _logTo;
  void onLog({required String logTo}) {
    _logTo = logTo;
    notifyListeners();
  }

  final List<Map<String, dynamic>> _symptoms = [
    {
      "text": "Everything is fine",
      "iconPath": AppEmojis.like,
      "selected": false,
    },
    {"text": "Cramps", "iconPath": AppEmojis.cramps, "selected": false},
    {"text": "Acne", "iconPath": AppEmojis.acne, "selected": false},
    {
      "text": "Tender breasts",
      "iconPath": AppEmojis.breasts,
      "selected": false,
    },
    {
      "text": "Milky nipple discharge",
      "iconPath": AppEmojis.milkyNippleDischarge,
      "selected": false,
    },
    {
      "text": "Abdominal pain",
      "iconPath": AppEmojis.abdominalPain,
      "selected": false,
    },
    {"text": "Fatigue", "iconPath": AppEmojis.fatigue, "selected": false},
    {"text": "Sleepiness", "iconPath": AppEmojis.sleepiness, "selected": false},
    {"text": "Backache", "iconPath": AppEmojis.backache, "selected": false},
    {
      "text": "Frequent urination",
      "iconPath": AppEmojis.frequentUrination,
      "selected": false,
    },
    {"text": "Cravings", "iconPath": AppEmojis.cravings, "selected": false},
    {"text": "Insomnia", "iconPath": AppEmojis.insomnia, "selected": false},
    {"text": "Headache", "iconPath": AppEmojis.headache, "selected": false},
    {"text": "Leg cramps", "iconPath": AppEmojis.legCramps, "selected": false},
    {
      "text": "Bleeding gums",
      "iconPath": AppEmojis.bleedingGums,
      "selected": false,
    },
  ];
  List<Map<String, dynamic>> get symptoms => _symptoms;

  final List<Map<String, dynamic>> _moods = [
    {"text": "Calm", "iconPath": AppEmojis.calm, "selected": false},
    {"text": "Happy", "iconPath": AppEmojis.happy, "selected": false},
    {"text": "Energetic", "iconPath": AppEmojis.energetic, "selected": false},
    {"text": "Mood swings", "iconPath": AppEmojis.moodSwing, "selected": false},
    {"text": "Frisky", "iconPath": AppEmojis.frisky, "selected": false},
    {"text": "Irritated", "iconPath": AppEmojis.irritated, "selected": false},
    {"text": "Sad", "iconPath": AppEmojis.sad, "selected": false},
    {"text": "Anxious", "iconPath": AppEmojis.anxious, "selected": false},
    {"text": "Depressed", "iconPath": AppEmojis.depressed, "selected": false},
    {
      "text": "Very self critical",
      "iconPath": AppEmojis.verySelfCritical,
      "selected": false,
    },
    {"text": "Apathetic", "iconPath": AppEmojis.apathetic, "selected": false},
    {"text": "Confused", "iconPath": AppEmojis.confused, "selected": false},
    {"text": "Low energy", "iconPath": AppEmojis.lowEnergy, "selected": false},
    {
      "text": "Feeling guilty",
      "iconPath": AppEmojis.feelingGuilty,
      "selected": false,
    },
    {
      "text": "Obsessive thoughts",
      "iconPath": AppEmojis.thoughts,
      "selected": false,
    },
  ];
  List<Map<String, dynamic>> get moods => _moods;

  final List<Map<String, dynamic>> _selectedSymptoms = [];
  final List<Map<String, dynamic>> _selectedMoods = [];
  List<Map<String, dynamic>> get selectedSymptoms => _selectedSymptoms;
  List<Map<String, dynamic>> get selectedMoods => _selectedMoods;

  void onSelectLog(Map<String, dynamic> item) {
    debugPrint(
      "\nselected item text : ${item["text"]}\nselection : ${item["selected"]}",
    );
    int index = -1;
    if (logTo == symptomsLog) {
      index = _symptoms.indexWhere((itm) => itm["text"] == item["text"]);
      _symptoms[index]["selected"] = !_symptoms[index]["selected"];
      if (_symptoms[index]["selected"]) {
        _selectedSymptoms.add(_symptoms[index]);
      } else {
        _selectedSymptoms.remove(_symptoms[index]);
      }
    } else {
      index = _moods.indexWhere((itm) => itm["text"] == item["text"]);
      _moods[index]["selected"] = !_moods[index]["selected"];
      if (_moods[index]["selected"]) {
        _selectedMoods.add(_moods[index]);
      } else {
        _selectedMoods.remove(_moods[index]);
      }
    }

    notifyListeners();
  }

  bool _isSymptomsEditMode = false;
  bool get isSymptomsEditMode =>_isSymptomsEditMode;

  void onEditSymptomsPressed(){
    _isSymptomsEditMode = !_isSymptomsEditMode;
    notifyListeners();
  }

  bool _isMoodsEditMode = false;
  bool get isMoodsEditMode =>_isMoodsEditMode;

  void onEditMoodsPressed(){
    _isMoodsEditMode = !_isMoodsEditMode;
    notifyListeners();
  }

  /// All about log period

  /// List to hold period days
  //  final List<DateTime> _appPredictedPeriodDays = [
  //    DateTime(DateTime.now().year, DateTime.now().month, 25),
  //    DateTime(DateTime.now().year, DateTime.now().month, 20),
  //    DateTime(DateTime.now().year, DateTime.now().month, 26),
  //    DateTime(DateTime.now().year, DateTime.now().month, 27),
  //    DateTime(DateTime.now().year, DateTime.now().month, 28),
  // ];
  //List<DateTime> get appPredictedPeriodDays => _appPredictedPeriodDays;

  List<DateTime> _userSelectedPeriodDays = [];
  List<DateTime> get userSelectedPeriodDays => _userSelectedPeriodDays;

  /// List of ovulation days
  final List<DateTime> _ovulationDays = [];
  List<DateTime> get ovulationDays => _ovulationDays;

  void _setOvulationDay() {
    DateTime now = DateTime.now();
    for (int i = 1; i < DateTime(now.year, now.month + 1, 0).day; i++) {
      if (!_periodInformationModel!.nextPeriodDates.contains(
        DateTime(now.year, now.month, i),
      )) {
        _ovulationDays.add(DateTime(now.year, now.month, i));
      }
    }
    notifyListeners();
  }

  List<DateTime>? _tempPeriodDaysSelection;
  List<DateTime>? get tempPeriodDaysSelection => _tempPeriodDaysSelection;

  /// Method to toggle selection of a day
  void toggleSelectedDay(DateTime day) {
    DateTime localDay = day.toLocal();
    DateTime strippedLocalDay = DateTime(
      localDay.year,
      localDay.month,
      localDay.day,
    );
    debugPrint("\nselected day : $strippedLocalDay\n");
    // _tempPeriodDaysSelection ??= [];
    /// If the day is already selected, remove it, else add it
    if (_tempPeriodDaysSelection!.contains(strippedLocalDay)) {
      _tempPeriodDaysSelection!.remove(strippedLocalDay);
    } else {
      _tempPeriodDaysSelection!.add(strippedLocalDay);
    }
    debugPrint(
      "\nafter temp selected day : $_tempPeriodDaysSelection\napp selected days : ${periodInformationModel!.nextPeriodDates}\n",
    );
    notifyListeners();
  }

  Future<void> saveLogPeriod() async {
    _tempPeriodDaysSelection!.sort();

    await updatePeriodInformationModel(
      nextPeriodDates: _tempPeriodDaysSelection,
    );
    updatePeriodDaysLeft();
  }

  void cancelLogPeriod() {
    _tempPeriodDaysSelection = List<DateTime>.from(
      _periodInformationModel!.nextPeriodDates,
    );
    notifyListeners();
  }

  /// Method to check if a day is selected
  bool isSelected(DateTime day) {
    /// Convert to local time and strip the time part
    DateTime localDay = day.toLocal();
    DateTime strippedLocalDay = DateTime(
      localDay.year,
      localDay.month,
      localDay.day,
    );

    // debugPrint("\nChecking is selected or not for $strippedLocalDay: ${_tempPeriodDaysSelection!.contains(strippedLocalDay)}\n$_tempPeriodDaysSelection\n");

    /// Ensure both the date in the list and the day being checked are in the same time zone (local time with time stripped)
    return _tempPeriodDaysSelection!.contains(
      DateTime(
        strippedLocalDay.year,
        strippedLocalDay.month,
        strippedLocalDay.day,
      ),
    );
  }
}
