import 'package:flutter/material.dart';

class DashboardState with ChangeNotifier {
  int _selectedIndex = 4;
  bool _isFabSelected = true;

  int get selectedIndex => _selectedIndex;
  bool get isFabSelected => _isFabSelected;

  void updateIndex(int index) {
    _selectedIndex = index;
    _isFabSelected = index == 4;
    notifyListeners();
  }

  void selectFab() {
    _selectedIndex = 4;
    _isFabSelected = true;
    notifyListeners();
  }
}
