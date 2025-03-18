import 'package:flutter/cupertino.dart';

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
  final Set<int> _periodDays = {};
  final Set<int> _purpleDays = {12, 13, 14, 15, 16, 18};
  final Set<int> _greenDays = {17};

  DateTime get selectedMonthYear => _selectedMonthYear;
  Set<int> get redDays => _periodDays;
  Set<int> get purpleDays => _purpleDays;
  Set<int> get greenDays => _greenDays;

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

  void onTapPeriodDate(int value){
    if (_periodDays.contains(value)) {
      _periodDays.remove(value);
    } else {
      _periodDays.add(value);
    }
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

  Color? getDayColor(int day) {
    if (_periodDays.contains(day)) {
      return const Color(0xFFFF5B79);
    } else if (_purpleDays.contains(day)) {
      return const Color(0xFFF2D4F7);
    } else if (_greenDays.contains(day)) {
      return const Color(0xFF27C96A);
    }
    return null;
  }
}
