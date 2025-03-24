import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view_model/home_screen_provider.dart';

class TrackingScreenProvider extends ChangeNotifier{

  HomeScreenProvider? homeScreenProvider;

  /// Constructor
  TrackingScreenProvider(this.homeScreenProvider) {
    _periodDates = homeScreenProvider?.tempPeriodDaysSelection ?? [];
    setMonthYear();
    setSelectedIndex(0);

  }

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







  List<int> _monthList = [1,2,3,4,5,5,6,7,8,9,10,11,12];
  List<int> get monthList => _monthList;

    int _year = DateTime.now().year;
  int get year => _year;

    int _month = DateTime.now().month;
  int get month => _month;

  late DateTime _selectedMonthYear;
   List<DateTime> _periodDates = [];
  final List<DateTime> _nextPeriodDates = [];
  final List<DateTime> _fertileDates =[];
  final List<DateTime> _ovulationDates = [];

  DateTime get selectedMonthYear => _selectedMonthYear;
  List<DateTime> get periodDates => _periodDates;
  List<DateTime> get nextPeriodDates => _nextPeriodDates;
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


  void removePeriodDates(){
    _periodDates.clear();
    removeOvulationDate();
    removeFertileDate();
    removeNextPeriodDates();
    notifyListeners();
  }

  void removeOvulationDate(){
    _ovulationDates.clear();
    notifyListeners();
  }

  void removeFertileDate(){
    _fertileDates.clear();
    notifyListeners();
  }

  void removeNextPeriodDates(){
    _nextPeriodDates.clear();
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


  Color? getDayColor(int day ) {
    DateTime tappedDate = DateTime(_year, _month, day);//bool isPeriodDateSaved
    if (_periodDates.contains(tappedDate) ) {         //&& isPeriodDateSaved == true
      return const Color(0xFFFF5B79);
    } else if (_fertileDates.contains(tappedDate)) {
      return const Color(0xFFF4D1FF);
    } else if (_ovulationDates.contains(tappedDate)) {
      return const Color(0xFF27C96A);
    }else if(_nextPeriodDates.contains(tappedDate)){
      return const Color(0xFFFF9CB6);
    } else{
    return Colors.transparent;
  }

  }
}
