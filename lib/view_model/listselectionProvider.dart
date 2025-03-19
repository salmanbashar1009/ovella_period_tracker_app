import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/model/catagoryModel.dart';

class CategoryProvider with ChangeNotifier {
  int _selectedIndex = 0; // Default index
  List<CategoryModel> _categories = [];

  int get selectedIndex => _selectedIndex;
  List<CategoryModel> get categories => _categories;

  void setCategories(List<CategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  void selectCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
