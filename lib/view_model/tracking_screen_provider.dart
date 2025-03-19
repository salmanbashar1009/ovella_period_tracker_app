import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingScreenProvider extends ChangeNotifier{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }




  /// Calender provider

  TrackingScreenProvider() {
    setMonthYear();

  }


  List<int> _monthList = [1,2,3,4,5,5,6,7,8,9,10,11,12];
  List<int> get monthList => _monthList;

    int _year = DateTime.now().year;
  int get year => _year;

    int _month = DateTime.now().month;
  int get month => _month;

  late DateTime _selectedMonthYear;
  final List<int> _periodDays = [];
  final List<int> _purpleDays =[12, 13, 14, 15, 16, 18];
  final List<int> _greenDays = [17];

  DateTime get selectedMonthYear => _selectedMonthYear;
  List<int> get periodDays => _periodDays;
  List<int> get purpleDays => _purpleDays;
  List<int> get greenDays => _greenDays;

  void setMonthYear(){
    _selectedMonthYear = DateTime(_year,_month);
    notifyListeners();
  }

  void setYear(int newYear){
    if(newYear != null){
      _year = newYear;
      notifyListeners();
    }
  }



  void setMonth(int newMonth){
    if(newMonth != null){
      _month = newMonth;
      notifyListeners();
    }
  }

  // void onTapPeriodDate(int value){
  //   debugPrint("\nvalue : $value\n");
  //   if (_periodDays.contains(value)) {
  //     _periodDays.remove(value);
  //   } else {
  //     _periodDays.add(value);
  //   }
  //   notifyListeners();
  // }


  final List<int> _borderSet = [];
  List<int> get borderSet => _borderSet;

  void toggleBorder(int day) {
    if (_borderSet.contains(day)) {
      _borderSet.remove(day);
      debugPrint("\nRemove date : $day");
    } else {
      _borderSet.add(day);
      debugPrint("\Added date : $day");
    }
    notifyListeners();
  }

  void saveSelectedDays(List<int> listName) {
    listName.addAll(_borderSet);
    _borderSet.clear();
    debugPrint("\nselected period date: $_periodDays");
    notifyListeners();
  }

  void clearSelectedDays(){
    _borderSet.clear();
    debugPrint('\n border set has been cleared: -- $_borderSet ');
    notifyListeners();
  }


  void changeMonth(DateTime newMonth) {
    _selectedMonthYear = newMonth;
    notifyListeners();
  }

  void previousMonth() {
    _selectedMonthYear = DateTime(
      _selectedMonthYear.year,
      _selectedMonthYear.month - 1,
    );
    notifyListeners();
  }

  void nextMonth() {
    _selectedMonthYear = DateTime(
      _selectedMonthYear.year,
      _selectedMonthYear.month + 1,
    );
    notifyListeners();
  }


  Color? getDayColor(int day ) {              //bool isPeriodDateSaved
    if (_periodDays.contains(day) ) {         //&& isPeriodDateSaved == true
      return const Color(0xFFFF5B79);
    } else if (_purpleDays.contains(day)) {
      return const Color(0xFFF2D4F7);
    } else if (_greenDays.contains(day)) {
      return const Color(0xFF27C96A);
    }else{
    return Colors.transparent;
  }

  }
}
