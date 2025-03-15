import 'package:flutter/cupertino.dart';

class TrackingScreenProvider extends ChangeNotifier{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }




  /// Calender provider
  DateTime _selectedMonth = DateTime(2025, 3);
  final Set<int> _periodDays = {};
  final Set<int> _purpleDays = {12, 13, 14, 15, 16, 18};
  final Set<int> _greenDays = {17};

  DateTime get selectedMonth => _selectedMonth;
  Set<int> get redDays => _periodDays;
  Set<int> get purpleDays => _purpleDays;
  Set<int> get greenDays => _greenDays;

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
