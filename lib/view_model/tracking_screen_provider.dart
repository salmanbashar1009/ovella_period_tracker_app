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
    _year = DateTime.now().year;
    _month = DateTime.now().month;
    _selectedMonth = DateTime(_year, _month);
  }


  List<int> _monthList = [1,2,3,4,5,5,6,7,8,9,10,11,12];
  List<int> get months => _monthList;

  late final int _year;
  int get year => _year;

  late final int _month;
  int get month => _month;

  late DateTime _selectedMonth;
  final Set<int> _periodDays = {};
  final Set<int> _purpleDays = {12, 13, 14, 15, 16, 18};
  final Set<int> _greenDays = {17};

  DateTime get selectedMonth => _selectedMonth;
  Set<int> get redDays => _periodDays;
  Set<int> get purpleDays => _purpleDays;
  Set<int> get greenDays => _greenDays;

  void setYear(int newYear){
    if(newYear != null){
      _year = newYear;
      notifyListeners();
    }
  }

  void setMonth(int newMonth){
    if(newMonth != null){
      _year = newMonth;
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
    _selectedMonth = newMonth;
    notifyListeners();
  }

  void previousMonth() {
    _selectedMonth = DateTime(
      _selectedMonth.year,
      _selectedMonth.month - 1,
    );
    notifyListeners();
  }

  void nextMonth() {
    _selectedMonth = DateTime(
      _selectedMonth.year,
      _selectedMonth.month + 1,
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
