import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingScreenProvider extends ChangeNotifier{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }



  final List<String> _notes = [];
  List<String> get notes => _notes;

  /// note added to the note list
  void addNotes({required noteText}){
    if(noteText != null){
      notes.add(noteText);
      notifyListeners();
    }
  }

  /// delete note from the note list
  void removeNotes(int index){
    notes.removeAt(index);
    notifyListeners();
  }




  /// Calender provider
  TrackingScreenProvider() {
    setMonthYear();
    setSelectedIndex(0);
  }


  List<int> _monthList = [1,2,3,4,5,5,6,7,8,9,10,11,12];
  List<int> get monthList => _monthList;

    int _year = DateTime.now().year;
  int get year => _year;

    int _month = DateTime.now().month;
  int get month => _month;

  late DateTime _selectedMonthYear;
  final List<DateTime> _periodDates = [];
  final List<DateTime> _fertileDates =[DateTime(2025,3,5),DateTime(2025,3,12),DateTime(2025,3,1)];
  final List<DateTime> _ovulationDates = [DateTime(2025,3,10)];

  DateTime get selectedMonthYear => _selectedMonthYear;
  List<DateTime> get periodDates => _periodDates;
  List<DateTime> get fertileDates => _fertileDates;
  List<DateTime> get ovulationDates => _ovulationDates;

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


  // void onPeriodDayTap(int day,) {
  //   DateTime tappedDate = DateTime(_year, _month, day);
  //
  //   if (_periodDays.contains(tappedDate)) {
  //     _periodDays.remove(tappedDate);
  //   } else {
  //     _periodDays.add(tappedDate);
  //   }
  //
  //  notifyListeners();
  // }

  void removePeriodDates(){
    _periodDates.clear();
    notifyListeners();
  }


  final List<DateTime> _borderSet = [];
  List<DateTime> get borderSet => _borderSet;

  void toggleBorder(int day) {
    DateTime tappedDate = DateTime(_year, _month, day);

    if (_borderSet.contains(tappedDate)) {
      _borderSet.remove(tappedDate);
      debugPrint("\nRemove date : $day");
    } else {
      _borderSet.add(tappedDate);
      debugPrint("\Added date : $day");
    }
    notifyListeners();
  }

  /// save selected dates
  void saveSelectedDays(List<DateTime> listName) {
    listName.addAll(_borderSet);
    _borderSet.clear();
    debugPrint("\nselected period date: $_periodDates");
    notifyListeners();
  }

  /// clear and doesn't save selected dates
  void clearSelectedDays(){
    _borderSet.clear();
    debugPrint('\n border set has been cleared: -- $_borderSet ');
    notifyListeners();
  }


  // void changeMonth(DateTime newMonth) {
  //   _selectedMonthYear = newMonth;
  //   notifyListeners();
  // }
  //
  // void previousMonth() {
  //   _selectedMonthYear = DateTime(
  //     _selectedMonthYear.year,
  //     _selectedMonthYear.month - 1,
  //   );
  //   notifyListeners();
  // }
  //
  // void nextMonth() {
  //   _selectedMonthYear = DateTime(
  //     _selectedMonthYear.year,
  //     _selectedMonthYear.month + 1,
  //   );
  //   notifyListeners();
  // }


  Color? getDayColor(int day ) {
    DateTime tappedDate = DateTime(_year, _month, day);//bool isPeriodDateSaved
    if (_periodDates.contains(tappedDate) ) {         //&& isPeriodDateSaved == true
      return const Color(0xFFFF5B79);
    } else if (_fertileDates.contains(tappedDate)) {
      return const Color(0xFFF4D1FF);
    } else if (_ovulationDates.contains(tappedDate)) {
      return const Color(0xFF27C96A);
    }else{
    return Colors.transparent;
  }

  }
}
