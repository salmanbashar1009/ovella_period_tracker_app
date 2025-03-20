import 'package:flutter/widgets.dart';

class CommunityProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int? _index;

  int? get index => _index;

  void selectImage(int index) {
    _index = index;
    notifyListeners();
  }
}
