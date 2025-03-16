import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
  }


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
